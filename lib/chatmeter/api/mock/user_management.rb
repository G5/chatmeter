module Chatmeter
  class API
    module Mock

      # stub GET /users/
      Excon.stub(:expects => 200, :method => :get, :path => '/users') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
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
          },
          status: 200
        }
      end
      
    end
  end
end
