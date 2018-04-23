module Chatmeter
  class API

    # GET /reviewBuilder/campaign/get
    def list_all_campaigns
      request(
        expects: 200,
        method:  :get,
        path:    "/"
      )
    end

    # POST /reviewBuilder/campaign/create
    def create_new_campaign(params)
      request(
        expects:  200,
        method:   :post,
        path:     "/reviewBuilder/campaign/create",
        body:    params.to_json
      )
    end

    # GET /reviewBuilder/campaign/get/{campaignId}
    def get_campaign(campaign_id)
      request(
        expects:  200,
        method:   :put,
        path:     "/reviewBuilder/campaign/get/#{campaign_id}",
        body:     params.to_json
      )
		end
		
		# PUT /reviewBuilder/campaign/{campaignId}
		def update_campaign(campaign_id, params)
			request(
				expects:  200,
				method:   :put,
				path:     "/reviewBuilder/campaign/#{campaign_id}",
				body:     params.to_json
			)
		end
		
		# GET /reviewBuilder/campaign
		def search_campaign(params)
			request(
				expects:  200,
				method:   :get,
				path:     "/reviewBuilder/campaign",
				body:     params
			)
		end
		# DELETE /reviewBuilder/campaign/delete/{campaignId}
		def search_campaign(campaign_id)
			request(
				expects:  200,
				method:   :delete,
				path:     "/reviewBuilder/campaign/delete/#{campaign_id}"
			)
		end
  end
end
