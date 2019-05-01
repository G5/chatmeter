module Chatmeter
  class API
    module Mock

      # stub GET /reviewBuilder/campaign/get
			Excon.stub(expects: 200, method: :get, path: '/v5/listings') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            "listings":[
              {
                "id": "24343434",
                "locationId": "22121",
                "contentProvider": "GOOGLE",
                "listingType": "Best",
                "listingURL": "https://maps.google.com/?cid=6534117673332158777",
                "expected": {
                  "businessName": "Coffee Shop 2",
                  "website": "http://www.mycoffeeshop.com",
                  "address": {
                    "street": "234 Main Street",
                    "city": "San Diego",
                    "postalCode": "92101",
                    "state": "CA",
                    "country": "USA"
                  },
                  "phoneNumber": "5555551234"
                },
                "found": {
                  "businessName": "Coffee Shop",
                  "website": "http://www.mycoffeeshop.com",
                  "address": {
                    "street": "234 Main Street",
                    "city": "San Diego",
                    "postalCode": "92101",
                    "state": "AZ",
                    "country": "USA"
                  },
                  "phoneNumber": "5555550000"
                },
                "matchErrors": [
                  "BusinessName",
                  "PhoneNumber",
                  "State"
                ],
                "listingInfo": {
                  "claimStatus": {
                    "claimed": false
                  },
                  "categories": [
                    "Coffee Shop",
                    "Cafe"
                  ],
                  "photoURLs": [
                    "https://plus.google/232323/23.png"
                  ],
                  "stats": {
                    "categories": 2,
                    "photos": 1,
                    "videos": 0,
                    "averageRating": 2.5,
                    "reviewCount": 10
                  }
                },
                "dateAdded": "2014-02-09T01:20:38Z",
                "lastUpdated": "2015-03-05T12:44:38Z"
              },
              {
                "locationId": "22121",
                "contentProvider": "BING",
                "listingType": "Missing",
                "expected": {
                  "businessName": "Coffee Shop 2",
                  "website": "http://www.mycoffeeshop.com",
                  "address": {
                    "street": "234 Main Street",
                    "city": "San Diego",
                    "postalCode": "92101",
                    "state": "CA",
                    "country": "USA"
                  },
                  "phoneNumber": "5555551234"
                },
                "found": {
                },
                "dateAdded": "2014-02-09T01:20:38Z",
                "lastUpdated": "2015-03-05T12:44:38Z"
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
