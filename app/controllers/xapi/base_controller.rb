class Xapi::BaseController < ApplicationController

  before_action :set_default_api_response_headers
  before_action :authenticate

  private

  def set_default_api_response_headers
    response.headers['X-Experience-API-Version'] = '1.0.1'
    response.headers['Content-Type'] = 'application/json'
  end

  def authenticate
    authenticate_basic_auth || render_unauthorized
  end

  def authenticate_basic_auth
    authenticate_with_http_basic do |username, password|
      # TODO: FIX THIS -- we need to be able to authenticate properly
      username == 'username' && password == 'password'
    end
  end

  def render_unauthorized
    render json: {error: true, success: false, message: 'Unauthorised request', code: 401}.to_json, status: 401
  end

end
