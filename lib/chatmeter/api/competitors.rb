module Chatmeter
  class API

    # GET /competitors
    def competitors(params)
      request(
        expects: 200,
        method:  :post,
        path:    "/competitors",
        body:    params.to_json
      )
    end

  end
end
