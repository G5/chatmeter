require 'uri'

module Chatmeter
  class API

    # GET /listings
    def get_listings(params={})
      request(
        expects: 200,
        method:  :get,
        path:    "/listings",
        query:   params
      )
    end

  end
end
