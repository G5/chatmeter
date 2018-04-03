module Chatmeter
  class API
    module Mock

      # stub GET /accounts
      Excon.stub(expects: 200, method: :get, path: '/v5/accounts') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            accounts: [
              {
                id: "23232",
                accountName: "Reseller 1"
              }
            ],
            hasMore: false
          },
          status: 200
        }
      end

      # stub POST /accounts
      Excon.stub(expects: 200, method: :post, path: %r{^/v5/accounts}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            id: "23232",
            accountName: "Reseller 1"
          },
          status: 200
        }
      end

    end
  end
end
