require "spec_helper"

RSpec.describe Chatmeter::API do

  context "User Group Access" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "should return valid response for #groups_for_user" do
      group = chatmeter.groups_for_user('123')[:groups]
      expect(group.length).to eq 1
      expect(group.first[:id]).to eq "406ab658-7f13-11e4-b116-123b93f75cba"
      expect(group.first[:accountId]).to eq "232"
      expect(group.first[:groupName]).to eq "Coffee shop San Diego"
    end

    it "should return valid response for #add_group_to_user" do
      group = chatmeter.add_group_to_user('123', {
        "accountId": "232",
        "groupName": "Coffee shop San Diego"
      })
      expect(group).to eq ""
    end

    it "should return valid response for #delete_group" do
      group = chatmeter.delete_group_access('123', ['123', '321'])
      expect(group).to eq ""
    end

  end
end
