require "spec_helper"

RSpec.describe Chatmeter::API do

  context "User Location Access" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "should return valid response for #locations_for_user" do
      location = chatmeter.locations_for_user('123')
      expect(location.body).to eq ""
      expect(location.status).to eq 200
    end

    it "should return valid response for #add_location_to_user" do
      location = chatmeter.add_location_to_user('123', { "locationIds": ["{location1}"] })
      expect(location.body).to eq ""
      expect(location.status).to eq 200
    end

    it "should return valid response for #remove_location_access" do
      location = chatmeter.remove_location_access('123', ['123', '321'])
      expect(location.body).to eq ""
      expect(location.status).to eq 200
    end

  end
end
