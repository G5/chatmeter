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
  end
end
