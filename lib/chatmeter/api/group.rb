module Chatmeter
  class API

    # GET /groups
    def list_all_groups
      request(
        expects: 200,
        method:  :get,
        path:    "/groups"
      )[:groups]
    end

    # POST /groups
    def create_new_group(params)
      request(
        expects:  200,
        method:   :post,
        path:     "/groups",
        query:    params
      )
    end

    # PUT /groups/{group_id}
    def update_group(group_id, params)
      request(
        expects:  200,
        method:   :put,
        path:     "/groups/#{group_id}",
        query:    params
      )
    end

    # DELETE /groups/{group_id}
    def delete_group(group_id)
      request(
        expects:  200,
        method:   :delete,
        path:     "/groups/#{group_id}"
      )
    end

    # POST /groups/{group_id}/locations
    def update_group_locations(group_id, params)
      request(
        expects:  200,
        method:   :post,
        path:     "/groups/#{group_id}/locations",
        query:    params
      )
    end

    # DELETE /groups/{group_id}/locations
    def delete_group_locations(group_id)
      request(
        expects:  200,
        method:   :delete,
        path:     "/groups/#{group_id}/locations"
      )
    end

  end
end
