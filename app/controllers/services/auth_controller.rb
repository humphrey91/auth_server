module Services
  class AuthController < BaseController
    before_action :authenicate_service

    private

    def current_service
      @current_service ||= Service.find(@current_service_id)
    end

    def authenicate_service
      jwt = cookies.signed[:jwt]
      begin
        jwt_payload = Auth.decode(jwt)

        @current_service_id = jwt_payload[:service]
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end
    end
  end
end