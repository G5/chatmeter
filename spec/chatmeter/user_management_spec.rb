require "spec_helper"

RSpec.describe Chatmeter::G5::UserManagement do
  let!(:user) { FactoryBot.create(:g5_authenticatable_client_viewer) }
  let(:user_manager) { described_class.new(user) }
  let(:all_users) { [chatmeter_user] }
  let(:chatmeter_user) do
    {
      "username": "#{user.first_name} #{user.last_name}",
      "firstName": user.first_name,
      "lastName": user.last_name,
      "phoneNumber": user.phone_number,
      "email":     user.email,
      "chatmeter_id": "id2"
    }
  end

  let(:chatmeter_api) do
    double(list_all_users:  all_users,
           create_new_user: chatmeter_user,
           update_user:     chatmeter_user,
           accounts: [{id: "234234234234"}]
           )
  end

  before do
    allow(Chatmeter::API).to receive(:new).and_return(chatmeter_api)
  end

  describe "change user" do
    it "return true if nothing change" do
      expect(user_manager.send(:change_user?,chatmeter_user)).to be_falsey
    end

    it "return false if email change" do
      chatmeter_user[:email] = "test@test.com"
      expect(user_manager.send(:change_user?,chatmeter_user)).to be_truthy
    end

    it "return false if first name change" do
      chatmeter_user[:firstName] = "Teo"
      expect(user_manager.send(:change_user?,chatmeter_user)).to be_truthy
    end

    it "return false if last_name change" do
      chatmeter_user[:lastName] = "Rose"
      expect(user_manager.send(:change_user?,chatmeter_user)).to be_truthy
    end

    it "return false if phone number change" do
      chatmeter_user[:phoneNumber] = ""
      expect(user_manager.send(:change_user?,chatmeter_user)).to be_truthy
    end
  end

  describe 'with chatmeter user that already exists' do
    let(:created_user) { JSON.parse(user_manager.chatmeter_user.to_json) }

    it 'returns a chatmeter user' do
      expect(created_user["username"]).to eq("#{user.first_name} #{user.last_name}")
      expect(created_user["email"]).to eq(user.email)
    end
  end

  describe 'with chatmeter user that does not already exists' do
    let(:all_users) { [] }
    let(:created_user) { JSON.parse(user_manager.chatmeter_user.to_json) }

    it 'creates a new user' do
      user_manager.chatmeter_user
      expect(chatmeter_api).to have_received(:create_new_user)
    end

    it 'returns a chatmeter user' do
      expect(created_user["username"]).to eq("#{user.first_name} #{user.last_name}")
      expect(created_user["email"]).to eq(user.email)
    end
  end

  describe 'user type setting' do
    let(:all_users) { [] }

    before { user_manager.chatmeter_user }

    context 'a client viewer' do
      it 'creates the user as external' do
        expect(chatmeter_api)
          .to have_received(:create_new_user)
          .with(hash_including(:userType => described_class::EXTERNAL_SOCIAL_USER))
      end
    end

    context 'a g5 user' do
      let!(:user) { FactoryGirl.create(:g5_authenticatable_admin) }

      it 'creates the user as external' do
        expect(chatmeter_api)
          .to have_received(:create_new_user)
          .with(hash_including(:userType => described_class::INTERNAL_SOCIAL_USER))
      end
    end
  end
end

