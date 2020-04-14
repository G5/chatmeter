
require "spec_helper"

RSpec.describe Chatmeter::API do
  let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

  context "errors handler" do

    it "raise BadRequest error 400" do
      expect{chatmeter.update_account("badrequest",{})}.to raise_error(Chatmeter::API::Errors::BadRequest)
    end

    it "raise Unauthorized error 401 generate new token " do
      response = double("response",
          "headers" => {
            'Content-Type': 'application/json'
          },
          "body" => "{\"id\":\"232323\",\"accountName\":\"New Account Name\",\"clientAccountId\":\"new-client-account-id\"}",
          "body=" => {"id":"232323", "accountName":"New Account Name","clientAccountId":"new-client-account-id"},
          status: 200
      )

      count=0
      allow_any_instance_of(Excon::Connection).to receive(:request) do
        if count == 0
          count +=1
          raise Excon::Errors::Unauthorized.new("error",nil, double("status", body:"error", :status => 401))
        else
          response
        end
      end

      expect(chatmeter).to receive(:post_login).and_return({token: "asdfasdfsadfsadfdsafsdf"})

      accounts =  chatmeter.update_account("232323",{accountName: "New Account Name", clientAccountId: "new-client-account-id"})
      expect(chatmeter.api_key).to eq("asdfasdfsadfsadfdsafsdf")
      expect(accounts[:id]).to eq "232323"

    end

    it "raise Forbidden error 403" do
      expect{chatmeter.update_account("forbidden",{})}.to raise_error(Chatmeter::API::Errors::Forbidden)
    end

    it "raise NotFound error 404" do
      expect{chatmeter.update_account("notfound",{})}.to raise_error(Chatmeter::API::Errors::NotFound)
    end

    it "raise RequestFailed error 500" do
      expect{chatmeter.update_account("requestfailed",{})}.to raise_error(Chatmeter::API::Errors::RequestFailed)
    end

    it "raise RequestFailed error 500" do
      expect{chatmeter.update_account("501",{})}.to raise_error(Chatmeter::API::Errors::RequestFailed)
    end

    it "raise ErrorWithResponse error 600" do
      expect{chatmeter.update_account("600",{})}.to raise_error(Chatmeter::API::Errors::ErrorWithResponse)
    end



  end
end
