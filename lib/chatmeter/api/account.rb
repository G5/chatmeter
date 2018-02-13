module Chatmeter
    class API

      def accounts(query={})
        req = request(
          expects: 200,
          method:  :get,
          path:    '/accounts',
          query:    query
        )

        req.body[:accounts]
      end

      # POST /accounts
      def add_new_account(params)
        request(
          expects:  200,
          method:   :post,
          path:     "/accounts",
          query:    params
        )
      end

    end
  end
