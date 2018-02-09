require "spec_helper"

RSpec.describe Chatmeter::API do

  context "User Management" do
    let(:chatmeter) { Chatmeter::API.new(username: '123456@example.com', password: 'pw12345', mock: true) }

    it "should return valid response for #list_all_users" do
      users = chatmeter.list_all_users({username: 'TestUser'}).body[:users]
      expect(users.length).to eq 1
      expect(users.first[:id]).to eq "3233"
      expect(users.first[:accountId]).to eq "23232"
      expect(users.first[:username]).to eq "TestUser"
      expect(users.first[:email]).to eq "user@test.com"
      expect(users.first[:phoneNumber]).to eq "555555555"
      expect(users.first[:firstName]).to eq "test"
      expect(users.first[:lastName]).to eq "User"
      expect(users.first[:userType]).to eq "Standard"
    end

    it "should return valid response for #get_user" do
      user = chatmeter.get_user('5877d8e8b71466175f392449').body
      expect(user[:id]).to eq "5877d8e8b71466175f392449"
      expect(user[:username]).to eq "companyuser"
      expect(user[:phoneNumber]).to eq "8443245000"
      expect(user[:email]).to eq "billsmith@company.com"
      expect(user[:firstName]).to eq "Bill"
      expect(user[:lastName]).to eq "Smith"
      expect(user[:userType]).to eq "Standard"
      expect(user[:accountId]).to eq "5997d8bbee5427ff15007df1"
      expect(user[:enabled]).to be true
      expect(user[:alertEmails]).to be false
      expect(user[:permissionOverrides]).to eq []
    end

    it "should return valid response for #create_new_user" do
      user = chatmeter.create_new_user({
        "accountId": "23232",
        "username": "TestUser",
        "password": "secret",
        "email": "user@test.com",
        "phoneNumber": "555555555",
        "firstName": "Test",
        "lastName": "User",
        "userType": "Standard"
      }).body
      expect(user[:accountId]).to eq "23232"
      expect(user[:username]).to eq "TestUser"
      expect(user[:email]).to eq "user@test.com"
      expect(user[:phoneNumber]).to eq "555555555"
      expect(user[:firstName]).to eq "Test"
      expect(user[:lastName]).to eq "User"
      expect(user[:userType]).to eq "Standard"
    end

    it "should return valid response for #update_user" do
      user = chatmeter.update_user('23232', {
        "accountId": "23232",
        "username": "TestUser",
        "password": "secret",
        "email": "user@test.com",
        "phoneNumber": "555555555",
        "firstName": "Test",
        "lastName": "User",
        "userType": "Standard"
      }).body
      expect(user[:accountId]).to eq "23232"
      expect(user[:username]).to eq "TestUser"
      expect(user[:email]).to eq "user@test.com"
      expect(user[:phoneNumber]).to eq "555555555"
      expect(user[:firstName]).to eq "Test"
      expect(user[:lastName]).to eq "User"
      expect(user[:userType]).to eq "Standard"
    end

    it "should return valid response for #update_user_password" do
      user = chatmeter.update_user_password('23232', {})
      expect(user.body).to eq ""
      expect(user.status).to eq 200
    end

    it "should return valid response for #delete_user" do
      user = chatmeter.delete_user('23232')
      expect(user.body).to eq ""
      expect(user.status).to eq 200
    end

    it "should return valid response for #enable_user" do
      user = chatmeter.enable_user('321', { "enabled": true })
      expect(user.body).to eq ""
      expect(user.status).to eq 200
    end

  end

end
