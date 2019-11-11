require 'rails_helper'

RSpec.describe UserController, type: :controller do
  let(:password) { "123456" }

  describe "POST #create" do
    it "returns http success" do
      post :create, params: { user: { email: "testemail@localhost.com", password: password } }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http unauthorized" do
      get :show
      expect(response).to have_http_status(:unauthorized)
    end
  end

end
