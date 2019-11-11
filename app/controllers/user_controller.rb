class UserController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      render json: {}, status: :ok
    else
      render json: { error: @user.errors }
    end
  end

  def show
    render json: { user: current_user.json_data }, status: :ok
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      render json: "Email is confirmed, you may now log in user.", status: :ok
    else
      render json: "Sorry. User does not exist.", status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
