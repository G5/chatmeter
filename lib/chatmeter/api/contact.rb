module Chatmeter
  class API
    # POST /reviewBuilder/campaign/contact/create
    def create_new_contact(params)
      request(
        expects: 201,
        method: :post,
        path: "/reviewBuilder/campaign/contact/create",
        body: params.to_json
      )
    end

    # GET /reviewBuilder/campaign/contact/get/{contactId}
    def get_contact_by_id(contact_id)
      request(
        expects:  200,
        method:   :get,
        path:     "/reviewBuilder/campaign/contact/get/#{contact_id}"
      )
    end

    # PUT reviewBuilder/campaign/contact/update/{contactId}
    def update_contact(contact_id, params)
      request(
        expects:  200,
        method:   :put,
        path:     "/reviewBuilder/campaign/contact/update/#{contact_id}",
        body:     params.to_json
      )
    end
  end
end
