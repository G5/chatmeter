module Chatmeter
  class API
    module Mock

      # stub GET /groups
      Excon.stub(expects: 200, method: :get, path: '/v5/groups') do |params|
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

      # stub POST /groups
      Excon.stub(expects: 200, method: :post, path: '/v5/groups') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            "id": "406ab658-7f13-11e4-b116-123b93f75cba",
            "accountId": request_params[:query][:accountId],
            "groupName": request_params[:query][:groupName],
            "externalGroupId": "1x276bnh333"
          },
          status: 200
        }
      end

      # stub PUT /groups/{group_id}
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/groups/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            "id": "406ab658-7f13-11e4-b116-123b93f75cba",
            "accountId": request_params[:query][:accountId],
            "groupName": request_params[:query][:groupName],
            "externalGroupId": "1x276bnh333"
          },
          status: 200
        }
      end

      # stub DELETE /groups/{groups_id}
      Excon.stub(expects: 200, method: :delete, path: %r{^/v5/groups/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

      # stub POST /groups/{group_id}/locations
      Excon.stub(expects: 200, method: :post, path: %r{^/v5/groups/([^/]+)/locations$}) do |params|
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
