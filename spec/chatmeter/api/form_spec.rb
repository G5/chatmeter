require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Forms endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "returns a valid response for #create_new_form" do
      form = chatmeter.create_new_form({})
      expect(form[:template]).to eq "<html>Form Template</html>"
      expect(form[:_id]).to eq "5f4e59df4d43d55c51a742a4"
    end
  end
end
