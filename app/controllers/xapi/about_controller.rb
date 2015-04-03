# encoding: UTF-8
class Xapi::AboutController < Xapi::BaseController

  skip_before_action :authenticate
  skip_before_action :validate_xapi_version

  def index
  end
end
