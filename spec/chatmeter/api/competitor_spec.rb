require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Campaigns endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }
    let(:params) { { locationIds: ["26794"], providers: ["YELP", "GOOGLE"] } }

		it "should return valid response for #competitors" do
			competitors = chatmeter.competitors(params)
      expect(competitors).to be_instance_of(Array)
      expect(competitors[0][:providerListingUrls]).to have_key(:GOOGLE)
      expect(competitors[0][:providerListingUrls]).to have_key(:YELP)
      expect(competitors[0]).to have_key(:competitorPhone)
      expect(competitors[0]).to have_key(:competitorAddress)
    end

  end
end
