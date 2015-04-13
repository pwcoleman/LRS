class Admin::ActivityProfilesController < Admin::BaseAdminController
  def index
    @store = Lrs.find(params[:lrs_id])
    @activity_profiles = @store.activity_profiles.page(params[:page]).per(25)
  end
end
