module Chatmeter
  class API
    module Mock

      # stub PUT /badrequest
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/\w*/badrequest}) do |params|
        params = JSON.parse(params[:body])
        {
          body: {

          },
          status: 400
        }
      end

      # stub PUT /unauthorized
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/\w*/unauthorized}) do |params|
        params = JSON.parse(params[:body])
        {
          body: {

          },
          status: 401
        }
      end

      # stub PUT /forbidden
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/\w*/forbidden}) do |params|
        params = JSON.parse(params[:body])
        {
          body: {

          },
          status: 403
        }
      end

      # stub PUT /notfound
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/\w*/notfound}) do |params|
        params = JSON.parse(params[:body])
        {
          body: {

          },
          status: 404
        }
      end

      # stub PUT /notfound
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/\w*/requestfailed}) do |params|
        params = JSON.parse(params[:body])
        {
          body: {

          },
          status: 500
        }
      end

      # stub PUT /notfound
      Excon.stub(expects: 200, method: :put, path: %r{^/v5/\w*/501}) do |params|
        params = JSON.parse(params[:body])
        {
          body: {

          },
          status: 501
        }
      end

       # stub PUT /notfound
       Excon.stub(expects: 200, method: :put, path: %r{^/v5/\w*/600}) do |params|
        params = JSON.parse(params[:body])
        {
          body: {

          },
          status: 600
        }
      end
    end
  end
end