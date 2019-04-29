module Chatmeter
  class API
    module Mock

      # stub POST /competitors
			Excon.stub(expects: 200, method: :post, path: '/v5/competitors') do |params|
        {
          body: [
            {
              "locationId": "26794",
              "competitorName": "Auto Detailing By Ron Thompson",
              "competitorId": "1128900",
              "providerListingUrls": {
                "GOOGLE": "https://maps.google.com/?cid=11793612764198950331",
                "YELP": "http://www.yelp.com/biz/auto-detailing-by-ron-thompson-portland"
              },
              "competitorAddress":"Auto Detailing By Ron Thompson, 34 Grosvenor Square, London, Engla, W1K 2HD, GB",
              "competitorPhone":"02033503434"
            },
            {
              "locationId": "26794",
              "competitorName": "Auto Detailing By Ron Thompson Llc.",
              "competitorId": "1060520",
              "providerListingUrls": {
                "GOOGLE": "https://maps.google.com/?cid=11793612764198950331",
                "YELP": "http://www.yelp.com/biz/auto-detailing-by-ron-thompson-portland"
              },
              "competitorAddress":"Auto Detailing By Ron Thompson Llc., 12 Upper St Martin's Lane, London, Engla, WC2H 9FB, GB",
              "competitorPhone":"02074209320"
            },
            {
              "locationId": "26794",
              "competitorName": "Alpha's Auto Detail",
              "competitorId": "523196",
              "providerListingUrls": {
                "GOOGLE": "https://maps.google.com/?cid=17654320774046061809",
                "YELP": "http://www.yelp.com/biz/alphas-auto-detail-portland"
              },
              "competitorAddress":"Alpha's Auto Detail, 2028 Hancock Street, San Diego, CA, 92110, US",
              "competitorPhone":"6192949590"
            }
          ],
          status: 200
        }
      end
    end
  end
end
