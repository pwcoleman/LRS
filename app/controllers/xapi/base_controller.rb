# encoding: UTF-8
class Xapi::BaseController < ApplicationController

  VALID_EXPERIENCE_API_VERSIONS = [
      X_EXPERIENCE_API_VERSION = '1.0.1',
      X_EXPERIENCE_API_VERSION_1_0_0 = '1.0.0']

  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

  before_action :set_default_api_response_headers
  before_action :authenticate
  before_action :validate_xapi_version
  before_action :fetch_lrs

  private

  def set_default_api_response_headers
    response.headers['X-Experience-API-Version'] = X_EXPERIENCE_API_VERSION
    response.headers['Content-Type'] = 'application/json'
  end

  def authenticate
    authenticate_basic_auth || render_unauthorized
  end

  def authenticate_basic_auth
    authenticate_with_http_basic do |username, password|
      # TODO: FIX THIS -- we need to be able to authenticate properly
      @lrs = Lrs.where(api: {'basic_key' => username, 'basic_secret' => password}).first
      @lrs.present?
    end
  end

  def render_unauthorized
    render json: {error: true, success: false, message: 'Unauthorised request', code: 401}.to_json, status: 401
  end

  def validate_xapi_version
    xapi_version = request.headers['X-Experience-API-Version']
    unless xapi_version && (VALID_EXPERIENCE_API_VERSIONS.include?(xapi_version))
      render json: {error: true, success: false, message: 'Invalid XAPI version', code: 400}.to_json, status: 400
    end
  end

  def fetch_lrs
    # TODO FIX THIS  -- need to be able to retrieve based upon credentials
    @lrs
  end

end
