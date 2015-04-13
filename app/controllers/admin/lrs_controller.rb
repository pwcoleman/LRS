class Admin::LrsController < Admin::BaseAdminController
  def index
    @stores = Lrs.all
  end
end
