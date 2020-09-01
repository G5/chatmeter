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
  end
end
