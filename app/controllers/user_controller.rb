class UserController < ApplicationController
  def create
  end

  def show
    render json: { user: current_user }, status: :ok
  end
end
