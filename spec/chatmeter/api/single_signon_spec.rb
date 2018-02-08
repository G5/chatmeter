require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Single Signon" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "should return valid response for #get_user" do
      user = chatmeter.signin_user('levi.brown').body
      expect(user[:ssoToken]).to eq "284c4b1e-090c-420a-8479-c39617b264dc"
    end
  end

end
