module Chatmeter
  class API

    # GET /singlesignon/generateLoginToken?username={username}
    def sso_token_for(user_name)
      req = request(
        expects: 200,
        method:  :get,
        path:    "/singlesignon/generateLoginToken?username=#{user_name}"
      )
      req["ssoToken"]
    end

  end
end
