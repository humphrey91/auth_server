require 'rails_helper'

RSpec.describe AuthController, type: :controller do

  describe "POST #create" do
    let(:password) { '12345' }
    let(:user) { FactoryBot.create(:user, password: password, password_confirmation: password) }

    it "returns http unauthorized" do
      post :create, params: { auth: {email: '', password: ''} }
      expect(response).to have_http_status(:unauthorized)
    end

    context "with a valid login and activated user" do
      it "returns http success" do
        post :create, params: { auth: {email: user.email, password: password} }
        expect(response).to have_http_status(:success)
      end
    end

    context "with an unactivated user" do      
      it "returns http unauthorized" do
        user.update(email_confirmed: false)
        post :create, params: { auth: {email: user.email, password: password} }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy
      expect(response).to have_http_status(:success)
    end
  end
end
