module Chatmeter
  class API

    # POST /reviewBuilder/form/create
    def create_new_form(params)
      request(
        expects:  201,
        method:   :post,
        path:     "/reviewBuilder/form/create",
        body:     params.to_json
      )
    end

    # GET /reviewBuilder/form/get/{formId}
    def get_form_by_id(form_id)
      request(
        expects:  200,
        method:   :get,
        path:     "/reviewBuilder/form/get/#{form_id}"
      )
    end

    # PUT /reviewBuilder/form/{formId}
    def update_form(form_id, params)
      request(
        expects:  200,
        method:   :put,
        path:     "/reviewBuilder/form/#{form_id}",
        body:     params.to_json
      )
    end
  end
end
