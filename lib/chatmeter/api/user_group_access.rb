module Chatmeter
  class API

    # GET /users/{user_id}/groups
    def groups_for_user(user_id)
      request(
        expects: 200,
        method:  :get,
        path:    "/users/#{user_id}/groups"
      )
    end

    # POST /users/{user_id}/groups
    def add_group_to_user(user_id, params)
      request(
        expects:  200,
        method:   :post,
        path:     "/users/#{user_id}/groups",
        body:    params.to_json
      )
    end

    # DELETE /users/{user_id}/groups?groupIds={group_ids}
    def delete_group_access(user_id, group_ids)
      request(
        expects:  200,
        method:   :delete,
        path:     "/users/#{user_id}/groups?groupIds=#{group_ids.join(',')}"
      )
    end

  end
end
