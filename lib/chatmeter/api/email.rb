module Chatmeter
  class API

    # POST /reviewBuilder/emailTemplate
    def create_new_email_template(params)
      request(
        expects:  201,
        method:   :post,
        path:     "/reviewBuilder/emailTemplate",
        body:     params.to_json
      )
    end
    
    # GET /reviewBuilder/emailTemplate/{templateId}
    def get_email_template_by_id(template_id)
      request(
        expects:  200,
        method:   :get,
        path:     "/reviewBuilder/emailTemplate/#{template_id}"
      )
    end

    # POST /reviewBuilder/emailTemplate/{templateId}
    def update_email_template(template_id, params)
      request(
        expects:  200,
        method:   :post,
        path:     "/reviewBuilder/emailTemplate/#{template_id}",
        body:     params.to_json
      )
    end
  end
end
