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

  BadAuthorization = Class.new(StandardError)

  def set_default_api_response_headers
    response.headers['X-Experience-API-Version'] = X_EXPERIENCE_API_VERSION
    response.headers['Content-Type'] = 'application/json'
  end

  def authenticate
    begin
      authenticate_basic_auth || render_unauthorized
    rescue BadAuthorization
      render json: {error: true, success: false, message: 'Bad Auth', code: 400}.to_json, status: 400
    rescue Exception
      render json: {error: true, success: false, message: 'Unauthorised request', code: 401}.to_json, status: 401
    end
  end

  def authenticate_basic_auth
    authenticate_with_http_basic do |username, password|
      if username.nil? || password.nil?
        raise BadAuthorization
      end
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

  private

  def validate_iri(value)
    success = false
    if value
      base_uri = value
      begin
        uri = Addressable::URI.parse(base_uri)
        success = uri.scheme && uri.host && uri.to_s == base_uri && uri
      rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
      end
    end
    success
  end

  def validate_uuid(value)
    value && value =~ /\A(urn:uuid:)?[\da-f]{8}-[\da-f]{4}-4[\da-f]{3}-[8 9 a b][\da-f]{3}-[\da-f]{12}\z/i
  end


end
