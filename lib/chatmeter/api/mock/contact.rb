module Chatmeter
  class API
    module Mock
      contact_body = {
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
    end
  end
end
