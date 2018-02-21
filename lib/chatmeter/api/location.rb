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
      def get_locations_by_reseller_location_id(reseller_location_id, params={})
        request(
          expects: 200,
          method:  :get,
          path:    '/locations/externalId/#{reseller_location_id}',
          params:  params
        )
      end

      # GET /locations/externalId/{resellerLocationId}
      def add_new_location(fields)
        request(
          expects: 200,
          method:  :post,
          path:    '/locations',
          body:    fields.to_json
        )
      end

    end
  end
