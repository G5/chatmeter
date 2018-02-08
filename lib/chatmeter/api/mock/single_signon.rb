module Chatmeter
  class API
    module Mock

      # GET /v5/singlesignon/generateLoginToken?username={username}
      Excon.stub(expects: 200, method: :get, path: %r{^/v5/singlesignon/generateLoginToken\?username=([^/]+)$}) do |params|
        request_params, mock_data = parse_stub_params(params)
        {
          body: '{
            "ssoToken":"284c4b1e-090c-420a-8479-c39617b264dc"
          }',
          status: 200
        }
      end

    end
  end
end
