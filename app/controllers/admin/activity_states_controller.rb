class Admin::ActivityStatesController < Admin::BaseAdminController
  def index
    @store = Lrs.find(params[:lrs_id])
    @activity_states = @store.documents.where(_type: 'State').page(params[:page]).per(25)
  end
end
