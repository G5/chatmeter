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
    # def get_contact_by_id(contact_id)
      # request(
        # expects:  200,
        # method:   :get,
        # path:     "/reviewBuilder/contact/get/#{contact_id}"
      # )
    # end

    # PUT reviewBuilder/campaign/contact/update/{contactId}
    # def update_contact(contact_id, params)
      # request(
        # expects:  200,
        # method:   :get,
        # path:     "/reviewBuilder/contact/update/#{contact_id}",
        # body: params.to_json
      # )
    # end

    # GET /reviewBuilder/campaign/contact
    # def search_contact(params={})
      # request(
        # expects:  200,
        # method:   :get,
        # path:     "/reviewBuilder/campaign/contact?#{params.to_query}"
      # )
    # end

    # DELETE /reviewBuilder/campaign/contact/delete/{List(contactIds)}
    # def delete_contact(contact_ids)
      # request(
        # expects:  200,
        # method:   :delete,
        # path:     "/reviewBuilder/campaign/contact/delete/#{contact_id}"
      # )
    # end
   end
end
