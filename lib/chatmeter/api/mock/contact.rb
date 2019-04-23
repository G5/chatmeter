module Chatmeter
  class API
    module Mock
      contact_body = {
        "_id": {
          "$oid": "123"
        },
        "name": "Lucy Diamond",
        "email": "lucy.diamond@testemail.com",
        "phone": "5412345678",
        "campaignId": "5be1d1121ad2341fbca4e45a",
        "locationId": "100497362",
      }

      # Stub POST /reviewBuilder/campaign/contact/create
      Excon.stub(expects: 201, method: :post, path: '/v5/reviewBuilder/campaign/contact/create') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: contact_body,
          status: 201
        }
      end

      # Stub GET /reviewBuilder/campaign/contact/get/{contactId}
      Excon.stub(expects: 200, method: :get, path: %r{^/v5/reviewBuilder/campaign/contact/get/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: contact_body,
          status: 200
        }
      end

      # Stub PUT /reviewBuilder/campaign/contact/update/{contactId}
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/reviewBuilder/campaign/contact/update/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: contact_body,
          status: 200
        }
      end

      # Stub DELETE /reviewBuilder/campaign/contact/delete
      Excon.stub(expects: 200, method: :delete, path: %r{^/v5/reviewBuilder/campaign/contact/delete/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: contact_body,
          status: 200
        }
      end
    end
  end
end
