require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Accounts endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "should return valid response for #accounts" do
      accounts = chatmeter.accounts
      expect(accounts[0]["accountName"]).to eq "Reseller 1"
    end
  end

end
