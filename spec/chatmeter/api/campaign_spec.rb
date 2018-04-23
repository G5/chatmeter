require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Campaigns endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

		it "should return valid response for #list_all_campaigns" do
			campaigns = chatmeter.list_all_campaigns
      expect(campaigns[:campaigns].length).to eq 3
    end

    it "should return valid response for #create_new_campaign" do
      campaign = chatmeter.create_new_campaign({})
      expect(campaign[:name]).to eq "anotherCampaign"
      expect(campaign[:accountId]).to eq "56a184a6d4c61f5267b3f386"
      expect(campaign[:isActive]).to eq false
      expect(campaign[:formId]).to eq "574ddfdcd4c6e2402ff37e0c"
    end

    it "should return valid response for #get_campaign_by_id" do
      campaign = chatmeter.get_campaign_by_id("1")
      expect(campaign[:name]).to eq "anotherCampaign"
      expect(campaign[:accountId]).to eq "56a184a6d4c61f5267b3f386"
      expect(campaign[:isActive]).to eq false
      expect(campaign[:formId]).to eq "574ddfdcd4c6e2402ff37e0c"
    end

    it "should return valid response for #delete_campaign" do
      campaign = chatmeter.delete_campaign("1")
      expect(campaign).to eq ""
    end
  end
end
