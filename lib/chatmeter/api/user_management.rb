module Chatmeter
  class API

    # GET /users
    def list_all_users(params={})
      req = request(
        expects: 200,
        method:  :get,
        path:    "/users",
        query:    params
      )
      req["users"]
    end

    # GET /user/{user_id}
    def get_user(user_id)
      request(
        expects: 200,
        method:  :get,
        path:    "/user/#{user_id}"
      )
    end

    # POST /users
    def create_new_user(params)
      request(
        expects:  200,
        method:   :post,
        path:     "/users",
        body:     params.to_json
      )
    end

    # PUT /users/{user_id}
    def update_user(user_id, params)
      request(
        expects:  200,
        method:   :put,
        path:     "/users/#{user_id}",
        body:     params.to_json
      )
    end

    # PUT /users/{user_id}/password
    def update_user_password(user_id, params)
      request(
        expects:  200,
        method:   :put,
        path:     "/users/#{user_id}/password",
        query:    params
      )
    end

    # DELETE /users/{user_id}
    def delete_user(user_id)
      request(
        expects:  200,
        method:   :delete,
        path:     "/users/#{user_id}"
      )
    end


    # POST /users
    def enable_user(user_id, params)
      request(
        expects:  200,
        method:   :post,
        path:     "/users/#{user_id}/status",
        query:    params
      )
    end

  end
end
