require "spec_helper"
require "pry"

RSpec.describe Chatmeter::API do

  it "should return valid response for #list_all_users" do
    chatmeter = Chatmeter::API.new(:username => '123456@example.com', :password => 'pw12345', :mock => true)
    expect(chatmeter.list_all_users.body[:users].length).to eq 1
    expect(chatmeter.list_all_users.body[:users].first[:id]).to eq "3233"
    expect(chatmeter.list_all_users.body[:users].first[:accountId]).to eq "23232"
    expect(chatmeter.list_all_users.body[:users].first[:username]).to eq "TestUser"
    expect(chatmeter.list_all_users.body[:users].first[:email]).to eq "user@test.com"
    expect(chatmeter.list_all_users.body[:users].first[:phoneNumber]).to eq "555555555"
    expect(chatmeter.list_all_users.body[:users].first[:firstName]).to eq "test"
    expect(chatmeter.list_all_users.body[:users].first[:lastName]).to eq "User"
    expect(chatmeter.list_all_users.body[:users].first[:userType]).to eq "Standard"
  end
end
