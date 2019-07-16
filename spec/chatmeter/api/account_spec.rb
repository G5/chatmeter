require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Accounts endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "should return valid response for #accounts" do
      accounts = chatmeter.accounts
      expect(accounts[0][:accountName]).to eq "Reseller 1"
    end

    it "should return valid response for #add_new_account" do
      account = chatmeter.add_new_account({ accountName: "Reseller 1" })
      expect(account[:id]).to eq "23232"
      expect(account[:accountName]).to eq "Reseller 1"
    end

    it "should return valid response for #get_accounts_for_user" do
      accounts = chatmeter.get_accounts_for_user("UserId_1")
      expect(accounts).to include "232323"
    end

    it "shold return valid response for #update_account" do
      accounts = chatmeter.update_account("232323",{accountName: "New Account Name", clientAccountId: "new-client-account-id"})
      expect(accounts[:id]).to eq "232323"
      expect(accounts[:accountName]).to eq "New Account Name"
      expect(accounts[:clientAccountId]).to eq "new-client-account-id"
    end

  end
end
