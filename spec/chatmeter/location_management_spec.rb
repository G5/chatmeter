require "spec_helper"

RSpec.describe Chatmeter::G5::LocationManagement do


  let!(:user) { FactoryBot.create(:g5_authenticatable_client_viewer) }
  let!(:client_one) { FactoryBot.create(:client, uid: 'foo', urn: 'c-foo') }
  let!(:location_one) { FactoryBot.create(:location, urn: 'coffee-shop-10', client: client_one) }

  let!(:user_locations){
    [location_one]
  }

  let(:all_locations) {
    {
      "locations":[
        {
          "id": "392939",
          "accountId": "21",
          "resellerLocationId": "coffee-shop-10",
          "businessName": "Coffee Shop 2",
          "primaryKeyword": "Coffee",
          "website": "http://www.mycoffeeshop.com",
          "alternateWebsites": [
            {
              "website": "http://shop2.mycoffeeshop.com"
            }
          ],
          "email": "contact@mycoffeeshop.com",
          "alternateEmails": [
            {
              "email": "sales@mycoffeeshop.com"
            }
          ],
          "address": {
              "street": "234 Main Street",
              "city": "San Diego",
              "postalCode": "92101",
              "state": "CA",
              "country": "USA"
            },
          "primaryPhone": "5555551234",
          "alternatePhoneNumbers": [
            {
              "phoneNumber": "5555552341"
            }
          ],
          "auditOnly": false,
          "brandMonitoring": {
            "listingMonitoring": [
              {
                "name": "TenTen",
                "searchCriteria": []
              }
            ],
            "socialMonitoring": [
              {
                "name": "TenTen",
                "searchCriteria": []
              }
            ]
          },
          "rankingKeywords": [
            {
              "keyword": "Coffee",
              "localArea": "San Diego, CA"
            }
          ]
        }
      ],
      "hasMore": true
    }
  }
  let(:chatmeter_user) {
    double({
      chatmeter_id: "id2",
      username: "id2_user_name"
    })
  }

  let(:chatmeter_api) { double({
    get_all_locations: all_locations,
    accounts: [{id: "234234234234"}],
    locations_for_user: all_locations,
    get_user_locations: {locations: [id: "392939"]}
    }) }

    let(:user_manager) {
      double({
        platinum_client_locations: user_locations,
        global?: false,
        role_locations_platinum: [{id: "392939" }]
    })
  }

  before do
    user.roles.destroy_all
    user.roles.create(name: 'foo', resource_type: 'G5Updatable::Client', resource: client_one)
    user.roles.create(name: 'baz', resource_type: 'G5Updatable::Location', resource: location_one)

    allow(Chatmeter::API).to receive(:new).and_return(chatmeter_api)
    allow(UserManager).to receive(:new).and_return(user_manager)
    allow(chatmeter_api).to receive(:add_location_to_user)
    allow(chatmeter_api).to receive(:remove_location_access)
    allow(chatmeter_api).to receive(:get_accounts_for_user).and_return([])
    allow(chatmeter_api).to receive(:get_locations_by_reseller_location_id).and_return([ {id: "392939"} ])
    allow(chatmeter_api).to receive(:add_sub_account).and_return("")
  end

  describe 'with chatmeter user that does not already exists' do
    it 'returns a chatmeter user' do

      expect(chatmeter_api).to receive(:add_location_to_user).with("id2", ["392939"]).once

      Chatmeter::G5::LocationManagement.new(user, chatmeter_user).add_locations_to_user
    end
  end

end
