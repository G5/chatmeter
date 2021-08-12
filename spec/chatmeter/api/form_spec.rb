require "spec_helper"

RSpec.describe Chatmeter::API do
  let(:update_params) do
    { 
      "_id": "574e182ed4c6c9beb42c4e14",
      "name": "Updated Form",
      "template":  "\n<!doctype html>\n<html>\n<body>New Form</body>\n</html>\n",
      "thankYouTemplate": "\n<!doctype html>\n<html>\n<body>Thanks!</body>\n</html>\n",
      "accountId": "56a184a6d4c61f5267b3f386",
      "dateAdded": 1464735790275,
      "deleted": false
    }
  end

  context "Forms endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "returns a valid response for #create_new_form" do
      form = chatmeter.create_new_form({})
      expect(form[:template]).to eq "<html>Form Template</html>"
      expect(form[:_id]).to eq "5f4e59df4d43d55c51a742a4"
    end
        
    it "should return valid response for #get_form_by_id" do
      form = chatmeter.get_form_by_id("1")
      
      expect(form[:template]).to eq "<html>Form Template</html>"
      expect(form[:_id]).to eq "5f4e59df4d43d55c51a742a4"
      expect(form[:name]).to eq "GMB Reviews - Karl Hungus Productions"
    end

    it "should return valid response for #update_form" do
      form = chatmeter.update_form("5f4e59e15d962523aaf562a1", update_params)

      expect(form[:accountId]).to eq "56a184a6d4c61f5267b3f386"
      expect(form[:_id]).to eq "574e182ed4c6c9beb42c4e14"
      expect(form[:name]).to eq "Updated Form"
    end
  end
end
