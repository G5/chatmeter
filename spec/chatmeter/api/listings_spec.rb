require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Listings endpoing" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }
    let(:params) { { locationId: "22121" } }

		it "should return valid response for #competitors" do
      listings = chatmeter.get_listings(params)
      expect(listings).to have_key(:listings)
      expect(listings[:listings]).to be_instance_of(Array)
      expect(listings[:listings].count).to eq(2)
    end

  end
end
