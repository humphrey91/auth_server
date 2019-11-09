class AuthController < ApplicationController
  skip_before_action :authenicate_user

  def create
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      jwt = Auth.issue({user: user.id})
      cookies.signed[:jwt] = {
        value:  jwt,
        httponly: true,
        expires: 1.hour.from_now
      }
      render json: {username: user.email}
    else
      render json: {
        error: 'Username or password incorrect'
      }, status: 401
    end
  end

  def destroy
    cookies.delete(:jwt)
  end

  private 

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
