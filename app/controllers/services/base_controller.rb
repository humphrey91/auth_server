module Services
  class BaseController < ActionController::API
    include ::ActionController::Cookies
  end
end