module Chatmeter
    class API
  
      def accounts
        req = request(
          expects: 200,
          method:  :get,
          path:    '/accounts',
        )

        JSON.parse(req.body)["accounts"] if req.body
      end
  
    end
  end
  