module Chatmeter
  module G5
    class LocationManagement

      attr_reader :current_user, :chatmeter

      def initialize(user = nil, ch_user = nil)
        @chatmeter = Chatmeter::API.new(username: ENV["CHATMETER_ADMIN_USER"],password: ENV["CHATMETER_ADMIN_PASSWORD"])
        @current_user = user

        @chatmeter_user = ch_user if ch_user

        if @current_user
          @locations = @current_user.locations
          @user_mgr = UserManager.new(@current_user)
          @chatmeter_user = get_chatmeter_user(@current_user) unless @chatmeter_user
        end

      end

      #
      def add_locations_to_user
        return if @user_mgr.global?
        client_urns = @current_user.clients.pluck("urn")

        add_account_access(@current_user, @chatmeter_user)

        # get all IMC Platinum Locations Granted through Auth's Roles
        imc_platinum_locations = @user_mgr.role_locations_platinum

        Rails.logger.info "#### Auth's Role Platinum Locations : #{imc_platinum_locations.size}"

        # get all Locations from Chatmeter for current user account, this are Platinum Locations on Chatmeter
        new_cm_platinum_locations = get_all_location_by_reseller_id(imc_platinum_locations)

        cm_all_platinum_locations = @chatmeter.get_user_locations(@chatmeter_user.chatmeter_id).with_indifferent_access[:locations]

        remove_location_access(cm_all_platinum_locations)

        @chatmeter.add_location_to_user(@chatmeter_user.chatmeter_id, new_cm_platinum_locations.map { |l| l.with_indifferent_access[:id] }) if new_cm_platinum_locations.any?
      end

      def add_account_access(user, chatmeter_user)
        cm_account_ids = []
        client_urns = user.clients.pluck("urn")

        # search chatmeter account ids
        client_urns.each do |client_urn|
          data = @chatmeter.accounts(query: client_urn)
          cm_account_ids << data.first[:id] if data.any?
        end

        # Add and Remove access account to the Chatmeter's User
        cm_account_access_ids = @chatmeter.get_accounts_for_user(chatmeter_user.chatmeter_id)

        new_acc_ids = cm_account_access_ids - cm_account_ids
        if new_acc_ids.any?
          Rails.logger.info "########### Add new accounts ids #{new_acc_ids}"
          @chatmeter.add_sub_account(chatmeter_user.chatmeter_id, accounts: new_acc_ids)
        end

      end

      # clear all current User Loaction Access on Chatmeter
      def remove_location_access(locations)
        locations_ids = locations.map { |l| l["id"] }
        @chatmeter.remove_location_access(@chatmeter_user.chatmeter_id, locationIds: locations_ids)
      end

      # Get Chatmeter's locations by reserler id URN
      def get_all_location_by_reseller_id(imc_locations)
        new_locations = []
        imc_locations.each do |imc_location|
          data = get_chatmeter_location(imc_location["urn"])
          if data.any?
            new_locations << data.first
          end
        end
        new_locations
      end

      # Grant permission on Chatmeter Locations for G5 Location
      def add_users_to_location(location, chatmeter_location=nil)
        chatmeter_location = get_chatmeter_location(location.urn).first if chatmeter_location.nil?
        return unless chatmeter_location

        users = get_location_users_access(location)
        users.each do |user|
          ch_user = get_chatmeter_user(user)
          @chatmeter.add_location_to_user(ch_user.chatmeter_id, [chatmeter_location[:id]] )
          add_account_access(user, ch_user)
        end
      end

      def get_chatmeter_user user
        Chatmeter::G5::UserManagement.new(user, @chatmeter).chatmeter_user
      end

      # Return all G5 Users that have access to the G5 Location
      def get_location_users_access(location)
        # get locations roles ids that have direct access to the Location
        location_roles_ids = G5Authenticatable::Role.where("resource_type = ? and resource_id = ?",G5Updatable::Location.name,location.id).pluck(:id)

        # get clients roles ids that has access to the location
        client_roles_ids = G5Authenticatable::Role.where("resource_type = ? and resource_id = ?",G5Updatable::Client.name,location.client.id).pluck(:id)

        roles_ids = (location_roles_ids + client_roles_ids)
        # get users that have access to those locations or client roles ids
        users = G5Authenticatable::User.joins("INNER JOIN g5_authenticatable_users_roles as ur ON g5_authenticatable_users.id = ur.user_id").where("ur.role_id IN (?)", roles_ids )
        users.uniq(&:id)
      end

      def get_chatmeter_location(location_id)
        @chatmeter.get_locations_by_reseller_location_id(location_id)
      end

    end

  end
end
