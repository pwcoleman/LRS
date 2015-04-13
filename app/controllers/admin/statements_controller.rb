class Admin::StatementsController < Admin::BaseAdminController
  def index
    @store = Lrs.find(params[:lrs_id])
  end
end
