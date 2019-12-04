module Chatmeter
  class API

    # GET /reviewBuilder/campaign/get
    def list_all_campaigns
      request(
        expects: 200,
        method:  :get,
        path:    "/reviewBuilder/campaign/get"
      )
    end

    # POST /reviewBuilder/campaign/create
    def create_new_campaign(params)
      request(
        expects:  201,
        method:   :post,
        path:     "/reviewBuilder/campaign/create",
        body:     params.to_json
      )
    end

    # GET /reviewBuilder/campaign/get/{campaignId}
    def get_campaign_by_id(campaign_id)
      request(
        expects:  200,
        method:   :get,
        path:     "/reviewBuilder/campaign/get/#{campaign_id}"
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
    def search_campaign(params={})
      request(
        expects:  200,
        method:   :get,
        path:     "/reviewBuilder/campaign?#{params.to_query}"
      )
    end

    # DELETE /reviewBuilder/campaign/delete/{campaignId}
    def delete_campaign(campaign_id)
      request(
        expects:  200,
        method:   :delete,
        path:     "/reviewBuilder/campaign/delete/#{campaign_id}?deleteReviews=true"
      )
    end
  end
end
