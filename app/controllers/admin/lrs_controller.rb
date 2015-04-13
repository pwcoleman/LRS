class Admin::LrsController < Admin::BaseAdminController
  def index
    @stores = Lrs.all.page params[:page]
  end
end
