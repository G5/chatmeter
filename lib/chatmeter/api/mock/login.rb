module Chatmeter
  class API
    module Mock

      # stub POST /login
      Excon.stub(:expects => 200, :method => :post, :path => '/v5/login') do |params|
        {
          body: '{
            "username":"example",
            "authenticated":true,
            "token":"dsdsdsd-6760-4621-93f0-6a08e579fdvd"
          }',
          status: 200
        }
      end
    end
  end
end
