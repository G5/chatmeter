
require "spec_helper"

RSpec.describe Chatmeter::API do
  let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

  context "errors handler" do

    it "raise BadRequest error 400" do
      expect{chatmeter.update_account("badrequest",{})}.to raise_error(Chatmeter::API::Errors::BadRequest)
    end

    it "raise Unauthorized error 401" do
      expect{chatmeter.update_account("unauthorized",{})}.to raise_error(Chatmeter::API::Errors::Unauthorized)
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
