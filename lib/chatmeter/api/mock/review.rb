module Chatmeter
  class API
    module Mock

      # stub GET /dashboard/reviewReport
      Excon.stub(expects: 200, method: :get, path: '/v5/dashboard/reviewReport') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            "dateRange":{
              "startDate":"2016-03",
              "endDate":"2016-06"
            },
            "periodSummary":{
              "count":1142,
              "countWithResponses":218,
              "oneStarRatings":128,
              "fiveStarRatings":604,
              "avgRating":4.0275454545454545,
              "countByRating":{
                "4star":234,
                "2star":54,
                "3star":80,
                "5star":604,
                "1star":128
              }
            },
            "competitorsPeriodSummary":{
              "count":160,
              "countWithResponses":41,
              "oneStarRatings":17,
              "fiveStarRatings":100,
              "avgRating":4.1580547112462005,
              "countByRating":{
                "4star":21,
                "2star":7,
                "3star":10,
                "5star":100,
                "1star":17
              }
            },
            "totalSummary":{
              "count":31217,
              "countWithResponses":1763,
              "oneStarRatings":2268,
              "fiveStarRatings":17142,
              "avgRating":4.144513477975017,
              "countByRating":{
                "4star":6607,
                "2star":1502,
                "3star":2901,
                "5star":17142,
                "1star":2268
              }
            },
            "competitorsTotalSummary":{
              "count":37754,
              "countWithResponses":1429,
              "oneStarRatings":1910,
              "fiveStarRatings":21718,
              "avgRating":4.265295391681018,
              "countByRating":{
                "4star":7808,
                "2star":1579,
                "3star":3167,
                "5star":21718,
                "1star":1910
              }
            },
            "reviewsByPeriod":{
              "period":"Month",
              "values":{
                "2016-05":{
                  "total":348,
                  "avgRating":3.957057057057057
                },
                "2016-04":{
                  "total":418,
                  "avgRating":4.072319201995012
                },
                "2016-03":{
                  "total":376,
                  "avgRating":4.042622950819672
                }
              }
            },
            "providerReport":{
              "BING":{
                "lastRating":1,
                "count":139,
                "avgRating":3.8333333333333335
              },
              "YELLOWPAGES":{
                "count":0
              },
              "YELPCA":{
                "lastRating":1,
                "count":5,
                "avgRating":4
              },
              "OPENTABLE":{
                "lastRating":4,
                "count":55,
                "avgRating":4.127272727272727
              },
              "YAHOOCA":{
                "count":0
              },
              "DEALERRATER":{
                "lastRating":5,
                "count":34,
                "avgRating":4.626470588235294
              },
              "INSIDERPAGES":{
                "lastRating":5,
                "count":1,
                "avgRating":5
              },
              "APARTMENTRATINGS":{
                "lastRating":5,
                "count":2,
                "avgRating":5
              },
              "YAHOO":{
                "lastRating":2,
                "count":132,
                "avgRating":3.792307692307692
              },
              "DOCTOROOGLE":{
                "count":0
              },
              "FACEBOOK":{
                "lastRating":5,
                "count":106,
                "avgRating":4.122641509433962
              },
              "SCOOT":{
                "count":0
              },
              "YELPGB":{
                "lastRating":3,
                "count":5,
                "avgRating":2.6
              },
              "CITYSEARCH":{
                "lastRating":5,
                "count":1,
                "avgRating":5
              },
              "HEALTHGRADES":{
                "count":0
              },
              "EDMUNDS":{
                "lastRating":1,
                "count":1,
                "avgRating":1
              },
              "ZOCDOC":{
                "count":0
              },
              "CARS":{
                "lastRating":1,
                "count":6,
                "avgRating":3.3333333333333335
              },
              "ZOMATO":{
                "lastRating":3,
                "count":2,
                "avgRating":3
              },
              "REALSELF":{
                "count":0
              },
              "SUPERPAGES":{
                "lastRating":5,
                "count":1,
                "avgRating":5
              },
              "GOOGLE":{
                "lastRating":5,
                "count":258,
                "avgRating":4.12015503875969
              },
              "MERCHANTCIRCLE":{
                "count":0
              },
              "YELL":{
                "count":0
              },
              "FOURSQUARE":{
                "count":15
              },
              "APARTMENTGUIDE":{
                "count":0
              },
              "TRIPADVISOR":{
                "lastRating":4,
                "count":217,
                "avgRating":4.336405529953917
              },
              "YELLOWPAGESCA":{
                "count":0
              },
              "YELP":{
                "lastRating":2,
                "count":162,
                "avgRating":3.6419753086419755
              }
            }
          },
          status: 200
        }
      end

      reviews = {
        "reviews": [
          {
            "id": "1048748",
            "locationId": "123111",
            "contentProvider": "YELP",
            "rating": 5.0,
            "reviewerUserName": "NA",
            "reviewerPictureURL": "NA",
            "reviewDetail": "Itook my 2008 Buick Lacerne to ValMark Cheverolet on 8/12/11 concerning vibration san noise. Roger Bittner, my service representative for several years, greated me in a friendly and courteous manner as always. He accepted the car for service and found the motor mounts were broken. Mounts were ordered and installed under warnty. This did not solve the noise problem. After checkin, Roger called to tell me the cost of repairs would be $1,055.00 to install new struts and mounts. I told Roger that in view of all the problems I have with the car since new, I would pick up the car unrepaired around 5;30 P.M. At about 3;30 P.M., Jim the service manager called to say that Roger informed him of the problem. With Roger in his office, they called General Motors concerning the issue, and General Motors agreed to cover all but $300.00 Dollars. The car was then repaird and picked up 8/23/11. Roger Bittner is truly an asset to ValMark and its customers. Sincerely, Erwin C. Tschoepe, Jr.",
            "reviewURL": "http://www.dealerrater.com/dealer/ValMark-Chevrolet-review-22508/page11/",
            "responseURL":"https://biz.yelp.com/r2r/sqoouYxSEiLrf8ZppuLmzQ",
            "reviewDate": "2011-09-03",
            "responses": [
              {
                "responseUserName": "Dealership Owner",
                "responseUserTitle": "Business Owner",
                "responseDetail": "We appreciate your custom",
                "responseDate": "2015-08-17 00:00:00"
              }
            ],
            "dateAdded": "2013-02-21 14:53:23.0",
            "lastUpdated": "2013-02-21 14:52:02.0"
          },
          {
            "id": "1048749",
            "locationId": "123111",
            "contentProvider": "DEALERRATER",
            "rating": 5.0,
            "reviewerUserName": "NA",
            "reviewerPictureURL": "NA",
            "reviewDetail": "Great experience, realistic trade in allowance ($2500 more than anyone else!), Good price on the vehicle I wanted. No need to haggle- one of those rare times when you feel as if both sides were happy. Definitely buy your next car there!",
            "reviewURL": "http://www.dealerrater.com/dealer/ValMark-Chevrolet-review-22508/page11/",
            "responseURL":"https://biz.yelp.com/r2r/sqeorYxTEiLrf8ZppcLmzQ",
            "reviewDate": "2011-09-02",
            "responses": [],
            "dateAdded": "2013-02-21 14:53:23.0",
            "lastUpdated": "2013-02-21 14:52:02.0"
          }
        ],
        "hasMore": true
      }

      # stub GET /reviews
      Excon.stub(expects: 200, method: :get, path: '/v5/reviews') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: reviews,
          status: 200
        }
      end

      # stub GET /reviews/{reviewId}
      Excon.stub(expects: 200, method: :get, path: %r{^/v5/reviews/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: reviews,
          status: 200
        }
      end

      # stub POST /reviews/{ReviewId}/responses
      Excon.stub(expects: 200, method: :post, path: %r{^/v5/reviews/([^/]+)/responses$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            "reviewResponse": {
              "id": "59b6d56fb64adcbec92acaff",
              "responseUserName": "Location Name Here",
              "responseDetail": "Thank you for your review",
              "responseDate": "2017-09-11T11:26:55.416-07:00",
              "isFromOwner": true,
              "authorUserId": "5952c822a49444c45fe28482",
              "publishingStatus": "PUBLISHED"
            }
          },
          status: 200
        }
      end

      # stub GET /reviews/reports/{ReviewId}
      Excon.stub(expects: 200, method: :get, path: %r{^/v5/reviews/reports/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            "reportResults": [
              {
                "id": {
                  "locationId": "123111",
                  "contentProvider": "DEALERRATER"
                },
                "value":{
                  "count": 1,
                  "countByRating": {
                    "4star": 0,
                    "2star": 0,
                    "3star": 0,
                    "5star": 1,
                    "0star": 0,
                    "1star": 0
                  },
                  "avgRating": 5.0
                }
              }
            ],
            "hasMore": true
          },
          status: 200
        }
      end

      # stub POST /reviews
      Excon.stub(expects: [200, 201], method: :post, path: '/v5/reviews') do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

      # stub POST /reviews/{ReviewId}/notMine
      Excon.stub(expects: 200, method: :post, path: %r{^/v5/reviews/([^/]+)/notMine$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          status: 200
        }
      end

      # stub DELETE /reviews/{ReviewId}
      Excon.stub(expects: 200, method: :delete, path: %r{^/v5/reviews/([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: {
            "totalFound": 2,
            "hasMore": false,
            "reviews": [
              {
                "reviewId": "580169412ab4c9b057dcb869",
                "removedOn": "2017-03-20T23:33:25.537Z",
                "reason": "flagged as duplicate"
              },
              {
                "reviewId": "580169412ab4c9b057dcb86b",
                "removedOn": "2017-03-20T23:33:25.534Z",
                "reason": "flagged as duplicate"
              }
            ]
          },
          status: 200
        }
      end

    end
  end
end
