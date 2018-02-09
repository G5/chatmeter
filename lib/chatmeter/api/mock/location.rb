module Chatmeter
    class API
      module Mock
  
        # stub GET /groups
        Excon.stub(expects: 200, method: :get, path: '/v5/locations') do |params|
            request_params, mock_data = parse_stub_params(params)
            {
            body: {
                "locations":[
                  {
                    "id": "392939",
                    "accountId": "21",
                    "resellerLocationId": "coffee-shop-10",
                    "businessName": "Coffee Shop 2",
                    "primaryKeyword": "Coffee",
                    "website": "http://www.mycoffeeshop.com",
                    "alternateWebsites": [
                      {
                        "website": "http://shop2.mycoffeeshop.com"
                      }
                    ],
                    "email": "contact@mycoffeeshop.com",
                    "alternateEmails": [
                      {
                        "email": "sales@mycoffeeshop.com"
                      }
                    ],
                    "address": {
                        "street": "234 Main Street",
                        "city": "San Diego",
                        "postalCode": "92101",
                        "state": "CA",
                        "country": "USA"
                      },
                    "primaryPhone": "5555551234",
                    "alternatePhoneNumbers": [
                      {
                        "phoneNumber": "5555552341"
                      }
                    ],
                    "auditOnly": false,
                    "brandMonitoring": {
                      "listingMonitoring": [
                        {
                          "name": "TenTen",
                          "searchCriteria": []
                        }
                      ],
                      "socialMonitoring": [
                        {
                          "name": "TenTen",
                          "searchCriteria": []
                        }
                      ]
                    },
                    "rankingKeywords": [
                      {
                        "keyword": "Coffee",
                        "localArea": "San Diego, CA"
                      }
                    ]
                  }
                ],
                "hasMore": true
              },
                status: 200
            }
            end
        end 
    end
  end
  

