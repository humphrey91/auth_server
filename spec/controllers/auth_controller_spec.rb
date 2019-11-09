require 'rails_helper'

RSpec.describe AuthController, type: :controller do

  describe "POST #create" do
    let(:password) { '12345' }
    let(:user) { FactoryBot.create(:user, password: password) }

    it "returns http unauthorized" do
      post :create, params: { auth: {email: '', password: ''} }
      expect(response).to have_http_status(:unauthorized)
    end

    context "correct email and password" do
      it "returns http success" do
        post :create, params: { auth: {email: user.email, password: password} }
        expect(response).to have_http_status(:success)
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
