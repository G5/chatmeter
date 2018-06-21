module Chatmeter
  class API
    module Mock

      # stub GET /users/{user_id}/locations
      Excon.stub(expects: 200, method: :get, path: %r{^/v5/users/([^/]+)/locations$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

      # stub POST /users/{user_id}/groups
      Excon.stub(expects: 200, method: :post, path: %r{^/v5/users/([^/]+)/locations$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

      # stub DELETE /users/{user_id}/locations?locationIds={group_ids}
      Excon.stub(expects: 200, method: :delete, path: %r{^/v5/users/([^/]+)/locations(.*)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

      Excon.stub(expects: 200, method: :post, path: %r{^/v5/users/([^/]+)/locations/delete}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

    end
  end
end
