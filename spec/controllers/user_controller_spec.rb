require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      # get :create
      # expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http unauthorized" do
      get :show
      expect(response).to have_http_status(:unauthorized)
    end
  end

end
