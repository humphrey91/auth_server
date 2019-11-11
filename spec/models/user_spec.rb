require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "create" do
    let(:user) { FactoryBot.build(:user)}

    it "should set confirm_token" do
      expect(user).to receive(:confirmation_token)
      user.save
    end
  end

  describe "#json_data" do
    let(:user) { FactoryBot.build(:user)}
    let(:view_attributes) { [:email] }

    it 'should include view attributes' do
      expect(user.json_data.symbolize_keys).to include(*view_attributes)
    end
  end

  describe "#email_activate" do
    let(:user) { FactoryBot.create(:user, email_confirmed: false)}

    it "sets emailed_confirmed to true" do
      user.email_activate
      expect(user.email_confirmed).to eq true
    end
  end
end
