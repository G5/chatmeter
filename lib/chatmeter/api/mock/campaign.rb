module Chatmeter
  class API
    module Mock

      # stub GET /reviewBuilder/campaign/get
			Excon.stub(expects: 200, method: :get, path: '/v5/reviewBuilder/campaign/get') do |params|
        {
          body: {
            "campaigns":[
							{
								"_id": {
									"$oid": "574de7bfd4c6c9beb42c4c88"
								},
								"name": "firstCampaign",
								"accountId": "56a184a6d4c61f5267b3f386",
								"formId": "5743765dd4c682374d25e148",
								"deliveryMethods": [
									{
										"type": "email",
										"_id": {
											"$oid": "574de7bfd4c6c9beb42c4c87"
										},
										"deliveryDelay": 0,
										"fromAddress": "support@chatmeter.com",
										"subject": "Please tell us your thoughts!",
										"templateId": "5748e778d4c680e898e308a9",
										"deliveryHour": nil
									}
								],
								"dateAdded": {
									"$date": 1464723391292
								},
								"isActive": false,
								"timeZone": "84",
								"deleted": false
							},
							{
								"_id": {
									"$oid": "574de899d4c6c9beb42c4cf9"
								},
								"name": "newCampaign",
								"accountId": "56a184a6d4c61f5267b3f386",
								"formId": "5743765dd4c682374d25e148",
								"deliveryMethods": [
									{
										"type": "email",
										"_id": {
											"$oid": "574de899d4c6c9beb42c4cf8"
										},
										"deliveryDelay": 0,
										"fromAddress": "support@chatmeter.com",
										"subject": "Please tell us your thoughts!",
										"templateId": "57438b4dd4c66450f9866e1d",
										"deliveryHour": nil
									}
								],
								"dateAdded": {
									"$date": 1464723609260
								},
								"isActive": false,
								"timeZone": "88",
								"deleted": false
							},
							{
								"_id": {
									"$oid": "574deaadd4c6c9beb42c4d4d"
								},
								"name": "anotherCampaign",
								"accountId": "56a184a6d4c61f5267b3f386",
								"formId": "574ddfdcd4c6e2402ff37e0c",
								"deliveryMethods": [
									{
										"type": "email",
										"_id": {
											"$oid": "574deaadd4c6c9beb42c4d4c"
										},
										"deliveryDelay": 0,
										"fromAddress": "support@chatmeter.com",
										"subject": "Please tell us your thoughts!",
										"templateId": "5748e778d4c680e898e308a9",
										"deliveryHour": nil
									}
								],
								"dateAdded": {
									"$date": 1464724141467
								},
								"isActive": false,
								"deleted": false
							}
						]
          },
          status: 200
        }
      end

      campaign_body = {
        "name": "anotherCampaign",
        "accountId": "56a184a6d4c61f5267b3f386",
        "isActive": false,
        "deliveryMethods": [
          {
            "deliveryDelay": 0,
            "fromAddress": "support@chatmeter.com",
            "subject": "Please tell us your thoughts!",
            "templateId": "5748e778d4c680e898e308a9",
            "type": "email",
            "message": "Please tell us your thoughts! \n {{ formUrl }}"
          }
        ],
        "formId": "574ddfdcd4c6e2402ff37e0c"
      }


      # stub GET /reviewBuilder/campaign/get/#{campaign_id}
      Excon.stub(expects: 200, method: :get, path: %r{^/v5/reviewBuilder/campaign/get/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: campaign_body,
          status: 200
        }
      end

      # POST /reviewBuilder/campaign/create
      Excon.stub(expects: 201, method: :post, path: '/v5/reviewBuilder/campaign/create') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: campaign_body,
          status: 201
        }
      end

      # DELETE /reviewBuilder/campaign/delete/{campaignId}
      Excon.stub(expects: 200, method: :delete, path: %r{^/v5/reviewBuilder/campaign/delete/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end
    end
  end
end
