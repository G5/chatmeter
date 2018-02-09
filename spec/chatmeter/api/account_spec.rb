require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Accounts endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "should return valid response for #sso_token_for" do
      accounts = chatmeter.accounts
      expect(accounts.status).to eq 200
    end
  end

end
