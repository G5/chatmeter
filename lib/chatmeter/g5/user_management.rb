module Chatmeter
  module G5
    class UserManagement
      INTERNAL_SOCIAL_USER = 'G5SocialUserInternal'
      EXTERNAL_SOCIAL_USER = 'G5SocialUser'
      SUPER_ADMIN_ROLE = 'super_admin'

      attr_reader :current_user
      attr_reader :chatmeter_api

      def initialize(current_user, chatmeter = nil)
        @chatmeter_api = chatmeter || Chatmeter::API.new(username: ENV["CHATMETER_ADMIN_USER"],password: ENV["CHATMETER_ADMIN_PASSWORD"])
        @current_user = current_user
      end

      def chatmeter_user
        current_chatmeter_user_on_hand = already_created_user
        if current_chatmeter_user_on_hand
          Rails.logger.info "######## chatmeter_user: User => #{current_chatmeter_user_on_hand.to_json}"
          updated_user = update_user(current_chatmeter_user_on_hand)
          return updated_user
        else
          new_user_attr = normalized_new_chatmeter_user
          Rails.logger.info "######## chatmeter_user: New user => #{new_user_attr.to_json}"
          new_user = ChatmeterUser.create!(new_user_attr)
          return new_user
        end
      end

      private

      def change_user?(chatmeter_user)
        usr = chatmeter_user.with_indifferent_access
        changed = false
        ["email", "first_name", "last_name", "phone_number"].each do |attr|
          changed = (current_user.send(attr) != usr[attr.camelize(:lower)])
          break if changed
        end
        changed
      end

      def normalized_new_chatmeter_user
        chatmeter_creds = create_chatmeter_user
        normalize_chatmeter_user_response(chatmeter_creds)
      end

      def get_normalized_updated_creds(user_we_have)
        params = chatmeter_user_params
        params[:userType] = user_we_have[:userType]
        normalized_updated_creds = {}
        if change_user?(user_we_have)
          updated_creds = @chatmeter_api.update_user(user_we_have["chatmeter_id"], params)
          normalized_updated_creds = normalize_chatmeter_user_response(updated_creds)
        else
          normalized_updated_creds = normalize_chatmeter_user_response(user_we_have)
        end
        normalized_updated_creds
      end

      def update_user(user_we_have)
        normalized_updated_creds = get_normalized_updated_creds(user_we_have)
        db_user_to_update = ChatmeterUser.find_by(uid: @current_user.uid)
        if db_user_to_update
          if normalized_updated_creds.any? # because we have 4-n seperate staging instances they might not all have a chatmeter user row
            Rails.logger.info "############## update_user: Update DB user #{normalized_updated_creds.to_json}"
            db_user_to_update.update_columns(normalized_updated_creds)
          end
          return db_user_to_update
        else
          Rails.logger.info "############### update_user: Create new ChatmeterUser"
          new_user = ChatmeterUser.create!(normalized_updated_creds)
          return new_user
        end
      end

      def normalize_chatmeter_user_response(chatmeter_creds)
        chatmeter_creds.delete(:permissionOverrides)
        chatmeter_creds.delete(:permissions)
        chatmeter_creds.delete(:locationTotal)
        usr = chatmeter_creds.with_indifferent_access
        usr["chatmeter_id"] = usr.delete("id") unless usr["chatmeter_id"]
        usr["uid"] = @current_user.uid
        usr
      end

      def already_created_user
        created_user = @chatmeter_api.list_all_users(username: chatmeter_username)[0]
        if created_user
          normalize_chatmeter_user_response(created_user)
        end
      end

      def create_chatmeter_user
        params = chatmeter_user_params
        params[:password] = ENV["CHATMETER_CLIENT_PASSWORD"]
        params[:userType] = user_type
        @chatmeter_api.create_new_user(params)
      end

      def user_account_id
        client = @current_user.clients.first
        if @current_user.roles.global.exists? || client.nil?
          # if user is Super Admin User or do not have clients we use default Account id
          return ENV["G5_SEARCH_MARKETING_INC_ACCOUNT_ID"]
        else
          return @chatmeter_api.accounts(query: client.urn).first[:id]
        end
      end

      def current_user_phone_number
        @current_user.phone_number || ""
      end

      def chatmeter_username
        "g5searchaccount#{@current_user.uid}".gsub(/\W/, '')
      end

      def chatmeter_user_params
        {
          accountId: user_account_id,
          username: chatmeter_username,
          email: @current_user.email,
          phoneNumber: current_user_phone_number,
          firstName: @current_user.first_name,
          lastName: @current_user.last_name
        }
      end

      def user_type
        g5_user? ? INTERNAL_SOCIAL_USER : EXTERNAL_SOCIAL_USER
      end

      def g5_user?
        @current_user.roles.global.exists?
      end
    end
  end
end
