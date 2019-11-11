class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  before_action :authenticate_user

  private
  
  def current_user
    @current_user ||= User.find(@current_user_id)
  end

  def authenticate_user
    jwt = cookies.signed[:jwt]
    begin
      jwt_payload = Auth.decode(jwt)

      @current_user_id = jwt_payload[:user]
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      head :unauthorized
    end
  end
end
