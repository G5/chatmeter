module Chatmeter
    class API
  
      def accounts
        request(
          expects: 200,
          method:  :get,
          path:    '/accounts',
        )
      end
  
    end
  end
  