require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Group" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "should return valid response for #list_all_groups" do
      group = chatmeter.list_all_groups
      expect(group.length).to eq 1
      expect(group.first[:id]).to eq "406ab658-7f13-11e4-b116-123b93f75cba"
      expect(group.first[:accountId]).to eq "232"
      expect(group.first[:groupName]).to eq "Coffee shop San Diego"
    end

    it "should return valid response for #create_new_group" do
      group = chatmeter.create_new_group({
        "accountId": "232",
        "groupName": "Coffee shop San Diego"
      })
      expect(group[:id]).to eq "406ab658-7f13-11e4-b116-123b93f75cba"
      expect(group[:accountId]).to eq "232"
      expect(group[:groupName]).to eq "Coffee shop San Diego"
      expect(group[:externalGroupId]).to eq "1x276bnh333"
    end

    it "should return valid response for #update_group" do
      group = chatmeter.update_group('23232', {
        "accountId": "232",
        "groupName": "New Coffee shop San Diego"
      })
      expect(group[:id]).to eq "406ab658-7f13-11e4-b116-123b93f75cba"
      expect(group[:accountId]).to eq "232"
      expect(group[:groupName]).to eq "New Coffee shop San Diego"
      expect(group[:externalGroupId]).to eq "1x276bnh333"
    end

    it "should return valid response for #delete_group" do
      group = chatmeter.delete_group('23232')
      expect(group).to eq ""
    end

    it "should return valid response for #update_group_locations" do
      user = chatmeter.update_group_locations('321', { "locationIds": ["26794", "99305"] })
      expect(user).to eq ""
    end

    it "should return valid response for #delete_group" do
      group = chatmeter.delete_group_locations('23232',[2233])
      expect(group).to eq ""
    end

  end
end
