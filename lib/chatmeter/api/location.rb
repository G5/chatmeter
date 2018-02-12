module Chatmeter
    class API
  
      def locations
        request(
          expects: 200,
          method:  :get,
          path:    '/locations',
        )
      end

      def add_new_locations_for_user(user_id, location_ids)
        request(
          expects: 200,
          method: :post,
          path: "/users/#{user_id}/locations",
          body: {
            "locationIds": location_ids
          }.to_json
        )
      end
  
    end
  end
  