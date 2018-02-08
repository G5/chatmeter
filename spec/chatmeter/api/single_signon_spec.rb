require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Single Signon" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "should return valid response for #sso_token_for" do
      token = chatmeter.sso_token_for('levi.brown')
      expect(token).to eq "284c4b1e-090c-420a-8479-c39617b264dc"
    end
  end

end
