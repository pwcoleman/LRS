# encoding: UTF-8
class Xapi::ErrorsController < Xapi::BaseController

  skip_before_action :authenticate
  skip_before_action :validate_xapi_version

  def error400
    render json: params['default'], status: :bad_request
  end

  def error403
    render :json, params['default'], status: :forbidden
  end

  def error404
    render :json, params['default'], status: :not_found
  end

  def error405
    render json: params['default'], status: :method_not_allowed
  end

  def error409
    render :json, params['default'], status: :conflict
  end

  def error412
    render :json, params['default'], status: :precondition_failed
  end

  def error413
    render :json, params['default'], status: :request_entity_too_large
  end

  def error500
    render :json, params['default'], status: :internal_server_error
  end


end
