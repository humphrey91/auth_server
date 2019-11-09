class UserController < ApplicationController
  def create
  end

  def show
    render json: { user: current_user.json_data }, status: :ok
  end
end
