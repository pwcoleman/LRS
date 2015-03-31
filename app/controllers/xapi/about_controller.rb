class Xapi::AboutController < Xapi::BaseController

  skip_before_action :authenticate

  def index
  end
end
