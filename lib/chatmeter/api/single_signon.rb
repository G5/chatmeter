module Chatmeter
  class API

    # GET /singlesignon/generateLoginToken?username={username}
    def sso_token_for(user_name)
      request(
        expects: 200,
        method:  :get,
        path:    "/singlesignon/generateLoginToken?username=#{user_name}"
      )[:ssoToken]
    end

  end
end
