module Chatmeter
  class API

    # GET /singlesignon/generateLoginToken?username={username}
    def signin_user(user_name)
      request(
        expects: 200,
        method:  :get,
        path:    "/singlesignon/generateLoginToken?username=#{user_name}"
      )
    end

  end
end
