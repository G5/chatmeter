module Chatmeter
    class API

      # GET /locations
      def get_all_locations(params={})
        request(
          expects: 200,
          method:  :get,
          path:    '/locations',
          params:  params
        )
      end

      # GET /locations/externalId/{resellerLocationId}
      def get_locations_by_reseller_location_id(reseller_location_id)
        request(
          expects: 200,
          method:  :get,
          path:    "/locations/externalId/#{reseller_location_id}"
        )
      end

      # POST /locations
      def add_new_location(fields)
        request(
          expects: 200,
          method:  :post,
          path:    '/locations',
          body:    fields.to_json
        )
      end

      # PUT /locations/{locationId}
      def update_location(location_id, fields)
        request(
          expects: 200,
          method:  :put,
          path:    "/locations/#{location_id}",
          body:    fields.to_json
        )
      end

      # DELETE /locations/{locationId}
      def delete_location(location_id)
        request(
          expects:  200,
          method:   :delete,
          path:     "/locations/#{location_id}"
        )
      end

      # PUT /locations/restore (array)
      def restore_location(location_ids)
        request(
          expects: 200,
          method:  :put,
          path:    '/locations/restore',
          body:    location_ids.to_json
        )
      end

    end
  end
