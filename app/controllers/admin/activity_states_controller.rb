class Admin::ActivityStatesController < Admin::BaseAdminController
  def index
    @store = Lrs.find(params[:lrs_id])
    @activity_states = @store.activity_states.page(params[:page]).per(25)
  end
end
