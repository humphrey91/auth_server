require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "#json_data" do
    let(:user) { FactoryBot.build(:user)}
    let(:view_attributes) { [:email] }
    it 'should include view attributes' do
      expect(user.json_data.symbolize_keys).to include(*view_attributes)
    end
  end
end
