require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Email Template endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "returns a valid response for #create_new_email_template" do
      email = chatmeter.create_new_email_template({})

      expect(email[:templateType]).to eq "email"
      expect(email[:accountId]).to eq "5a56bc4d01f0c9b909f3a82c"
      expect(email[:name]).to eq "GMB Reviews Email Template - Karl Hungus Productions"
    end
  end
end
