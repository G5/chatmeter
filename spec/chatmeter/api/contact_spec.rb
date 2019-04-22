require "spec_helper"

RSpec.describe Chatmeter::API do
  contact_body = {
    "name": "Lucy Diamond",
    "email": "lucy.diamond@testemail.com",
    "phone": "5412345678",
    "campaignId": "5be1d1121ad2341fbca4e45a",
    "locationId": "100497362",
  }

  context "Contact endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }
    it "should return valid response for #create_new_contact" do
      contact = chatmeter.create_new_contact({})
      expect(contact[:name]).to eq "Lucy Diamond"
      expect(contact[:email]).to eq "lucy.diamond@testemail.com"
      expect(contact[:phone]).to eq "5412345678"
      expect(contact[:campaignId]).to eq "5be1d1121ad2341fbca4e45a"
      expect(contact[:locationId]).to eq "100497362"
    end
  end
end
