module Chatmeter
  class API

    # GET /users/{user_id}/locations
    def locations_for_user(user_id)
      request(
        expects: 200,
        method:  :get,
        path:    "/users/#{user_id}/locations"
      )
    end

    # POST /users/{user_id}/locations
    def add_location_to_user(user_id, location_ids)
      request(
        expects: 200,
        method: :post,
        path: "/users/#{user_id}/locations",
        body: {
          "locationIds": location_ids
        }.to_json
      )
    end

    # DELETE /users/{user_id}/locations?locationIds={location_ids}
    def remove_location_access(user_id, location_ids)
      request(
        expects:  200,
        method:   :delete,
        path:     "/users/#{user_id}/locations?locationIds=#{location_ids.join(',')}"
      )
    end

  end
end
