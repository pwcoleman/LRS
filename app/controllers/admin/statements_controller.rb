class Admin::StatementsController < Admin::BaseAdminController
  def index
    @store = Lrs.find(params[:lrs_id])
    @statements = @store.statements.page(params[:page]).per(25)
  end
end
