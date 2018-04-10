module Chatmeter
  class API
    module Mock

      # stub GET /locations
      Excon.stub(expects: 200, method: :get, path: '/v5/locations') do |params|
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


      # stub GET /v5/locations/externalId/{resellerLocationId}
      Excon.stub(expects: 200, method: :get, path: %r{^/v5/locations/externalId/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: [
            {
              "id": "217846",
              "resellerLocationId": "tore",
              "accountId": "56a184a6d4c61f5267b3f386",
              "busName": "Apple Store",
              "primaryKeyword": "Electronics Store",
              "website": "https://www.apple.com/uk/retail/coventgarden/",
              "alternateWebsites": [],
              "email": "fraser@chatmeter.com",
              "alternateEmails": [],
              "address": {
                "street": "1-7 The Piazza, Covent Garden",
                "city": "London",
                "state": "GB",
                "country": "GB",
                "postalCode": "WC2E 8HA"
              },
              "primaryPhone": "02074471400",
              "alternatePhoneNumbers": [],
              "auditOnly": false,
              "brandMonitoring": {
                "listingMonitoring": [],
                "socialMonitoring": []
              },
              "rankingKeywords": [
                {
                  "keyword": "iphone"
                }
              ],
              "customListings": []
            }
          ],
          status: 200
        }
      end


      location_body = {
        "id": "392939",
        "accountId": "21",
        "resellerLocationId": "coffee-shop-10",
        "busName": "Coffee Shop 2",
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
        "rankingKeywords": [
          {
            "keyword": "Coffee",
            "localArea": "San Diego, CA"
          }
        ],
        "auditOnly": false,

        "listingManagementSpecs":{
          "hours":{
            "Monday":{
              "blocks":[

              ],
              "status":"Closed"
            },
            "Tuesday":{
              "blocks":[
                {
                  "from":"0000",
                  "to":"2400"
                }
              ],
              "status":"Open"
            },
            "Wednesday":{
              "blocks":[
                {
                  "from":"0030",
                  "to":"1900"
                }
              ],
              "status":"Open"
            },
            "Thursday":{
              "blocks":[
                {
                  "from":"1230",
                  "to":"2000"
                }
              ],
              "status":"Open"
            },
            "Friday":{
              "blocks":[
                {
                  "from":"0330",
                  "to":"0830"
                },
                {
                  "from":"1400",
                  "to":"2100"
                }
              ],
              "status":"Open"
            },
            "Saturday":{
              "blocks":[

              ],
              "status":"Closed"
            },
            "Sunday":{
              "blocks":[

              ],
              "status":"Closed"
            }
          },
          "providerImages":{
            "FACEBOOK":"https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/e3b2883e8dfb198714fe1374f2ac55ab11f6e33dbf3f8bbd65275cda1fac7a86.jpg",
            "GOOGLEMAP":"https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/752a09b1af72547b47f013334609c2884e56a4f4af56bc5b96bccba1d228116c.jpg",
            "TWITTER":"https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/aeae7dbcea88a3e747e24b61e4688a8b3942bc3beb220c4feb181217fda075a4.jpg"
          },
          "hideAddress":false,
          "description":"This business is pretty great, I mean, truly fantastic. You would really love this business if you came to check it out, it would really make your day awesome. Highly recommend coming to this business.",
          "paymentTypes":"American Express,Cash,Check,Discover,MasterCard,Visa",
          "businessOwner":"Rick",
          "businessEmail":"rick@business.com",
          "faxNumber":"555-555-5555",
          "product":"Businesses and other things",
          "brands":"Oakley, Nintendo, Dole",
          "yearsInBusiness":8,
          "licenseNumber":"1234556",
          "linkedIn":"https://www.linkedin.com/company/bubba-bbq",
          "logoUrl":"https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/ee68cbc4c4374b7f2ae29e595250a5a0ff4cfbb80b64d00b9b285ae8b4d6c21c.png",
          "imageUrls":[
            "https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/9305c42f390dbbc2e7cab50b8d9f6063cc4f37cebe49919f8eee269c53add3df.jpg",
            "https://cm-review-builder.s3.amazonaws.com/userImages/56a184a6d4c61f5267b3f386/ee68cbc4c4374b7f2ae29e595250a5a0ff4cfbb80b64d00b9b285ae8b4d6c21c.png"
          ]
        }
      }

      # stub POST /locations
      Excon.stub(expects: 200, method: :post, path: '/v5/locations') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: location_body,
          status: 200
        }
      end

      # stub PUT /locations/{location_id}
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/locations/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: location_body,
          status: 200
        }
      end

      # stub DELETE /locations/{location_id}
      Excon.stub(expects: 200, method: :delete, path: %r{^/v5/locations/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

      # stub PUT /locations/restore
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/locations/restore}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

    end
  end
end
