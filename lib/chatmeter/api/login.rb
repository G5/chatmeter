module Chatmeter
  class API

    def post_login(username, password)
      request(
        expects: 200,
        method:  :post,
        path:    '/login',
        body:    { username: username, password: password }.to_json
      )
    end

  end
end
