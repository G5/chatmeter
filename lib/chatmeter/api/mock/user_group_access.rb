module Chatmeter
  class API
    module Mock

      # stub GET /users/{user_id}/groups
      Excon.stub(expects: 200, method: :get, path: %r{^/v5/users/([^/]+)/groups$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            "groups": [
              {
                "id": "406ab658-7f13-11e4-b116-123b93f75cba",
                "accountId": "232",
                "groupName": "Coffee shop San Diego"
              }
            ],
            "hasMore": false
          },
          status: 200
        }
      end

      # stub POST /users/{user_id}/groups
      Excon.stub(expects: 200, method: :post, path: %r{^/v5/users/([^/]+)/groups$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

      # stub DELETE /groups/{groups_id}
      Excon.stub(expects: 200, method: :delete, path: %r{^/v5/groups/([^/]+)/locations$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

    end
  end
end
