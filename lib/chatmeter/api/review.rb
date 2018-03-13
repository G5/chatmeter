module Chatmeter
  class API

    # GET /dashboard/reviewReport
    def get_review_metrics(params)
      request(
        expects: 200,
        method:  :get,
        path:    "/dashboard/reviewReport",
        query:    params
      )
    end

    # GET /reviews
    def get_all_reviews(params)
      request(
        expects: 200,
        method:  :get,
        path:    "/reviews",
        query:    params
      )
    end

    # GET /reviews/{reviewId}
    def get_single_review(review_id)
      request(
        expects: 200,
        method:  :get,
        path:    "/reviews/#{review_id}"
      )
    end

    # POST /reviews/{ReviewId}/responses
    def respond_to_review(review_id, params)
      request(
        expects:  200,
        method:   :post,
        path:     "/reviews/#{review_id}/responses",
        body:     params.to_json
      )
    end

    # GET /reviews/reports/{ReportId}
    def aggregate_reports(review_id, params)
      request(
        expects: 200,
        method:  :get,
        path:    "/reviews/reports/{report_id}",
        query:    params
      )
    end

    # POST /v5/reviews
    def add_reviews(params)
      request(
        expects:  [200, 201],
        method:   :post,
        path:     "/reviews",
        body:     params.to_json
      )
    end

    # POST /reviews/{reviewId}/notMine
    def review_not_mine(review_id, params)
      request(
        expects:  200,
        method:   :post,
        path:     "/reviews/#{review_id}/notMine",
        body:     params.to_json
      )
    end

    # DELETE /reviews/{review_id}
    def delete_review(review_id, params)
      request(
        expects:  200,
        method:   :delete,
        path:     "/reviews/#{review_id}",
        query:    params
      )
    end

  end
end
