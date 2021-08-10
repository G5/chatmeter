require "spec_helper"

RSpec.describe Chatmeter::API do

  context "Email Template endpoint" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }
    let(:update_params) do
      {  
        "_id": "574e330cd4c6c9beb42c4ebd",
        "name": "newEmailTemp",
        "content": "<html>Html is here</html>",
        "templateType": "email",
        "accountId": "56a184a6d4c61f5267b3f386",
        "deleted": false,
        "dateAdded": 1464742668274 
      } 
    end
    it "returns a valid response for #create_new_email_template" do
      email = chatmeter.create_new_email_template({})

      expect(email[:templateType]).to eq "email"
      expect(email[:accountId]).to eq "5a56bc4d01f0c9b909f3a82c"
      expect(email[:name]).to eq "GMB Reviews Email Template - Karl Hungus Productions"
    end
    
    it "should return valid response for #get_email_template_by_id" do
      email = chatmeter.get_email_template_by_id("1")
      
      expect(email[:templateType]).to eq "email"
      expect(email[:accountId]).to eq "5a56bc4d01f0c9b909f3a82c"
      expect(email[:name]).to eq "GMB Reviews Email Template - Karl Hungus Productions"
    end

    it "should return valid response for #update_account" do
      email = chatmeter.update_email_template("5f4e59e15d962523aaf562a1", update_params)

      expect(email[:templateType]).to eq "email"
      expect(email[:accountId]).to eq "56a184a6d4c61f5267b3f386"
      expect(email[:name]).to eq "newEmailTemp"
    end
  end
end
