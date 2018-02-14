module Chatmeter
  class API
    module Mock

      # stub GET /users/
      Excon.stub(expects: 200, method: :get, path: '/v5/users') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: '{
            "users": [
              {
                "id": "3233",
                "accountId": "23232",
                "username": "TestUser",
                "email": "user@test.com",
                "phoneNumber": "555555555",
                "firstName": "test",
                "lastName": "User",
                "userType": "Standard"
              }
            ],
            "hasMore": false
          }',
          status: 200
        }
      end

      # stub GET /user/{user_id}
      Excon.stub(expects: 200, method: :get, path: %r{^/v5/user/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            "id": "5877d8e8b71466175f392449",
            "username": "companyuser",
            "email": "billsmith@company.com",
            "phoneNumber": "8443245000",
            "firstName": "Bill",
            "lastName": "Smith",
            "userType": "Standard",
            "accountId": "5997d8bbee5427ff15007df1",
            "enabled": true,
            "alertEmails": false,
            "permissionOverrides": []
          },
          status: 200
        }
      end

      # stub POST /users
      Excon.stub(expects: 200, method: :post, path: '/v5/users') do |params|
        {
          body: '{
            "accountId": "23232",
            "username": "TestUser",
            "email": "user@test.com",
            "phoneNumber": "555555555",
            "firstName": "Test",
            "lastName": "User",
            "userType": "Standard"
          }',
          status: 200
        }
      end

      # stub PUT /users/{user_id}
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/users/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            "accountId": request_params[:body]["accountId"],
            "username": request_params[:body]["username"],
            "email": request_params[:body]["email"],
            "phoneNumber": request_params[:body]["phoneNumber"],
            "firstName": request_params[:body]["firstName"],
            "lastName": request_params[:body]["lastName"],
            "userType": request_params[:body]["userType"]
          },
          status: 200
        }
      end

      # stub PUT /users/{user_id}/password
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/users/([^/]+)/password$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

      # stub DELETE /users/{user_id}
      Excon.stub(expects: 200, method: :delete, path: %r{^/v5/users/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

      # stub POST /users/{user_id}/status
      Excon.stub(expects: 200, method: :post, path: %r{^/v5/users/([^/]+)/status$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

    end
  end
end
