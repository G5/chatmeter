module Chatmeter
    class API
  
      def locations
        request(
          expects: 200,
          method:  :get,
          path:    '/locations',
        )
      end
  
    end
  end
  