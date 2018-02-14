require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Locations endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "should return valid response for #locations" do
      locations = chatmeter.locations
      expect(locations.length).to eq 1
    end
  end

end
