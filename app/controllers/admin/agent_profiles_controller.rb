class Admin::AgentProfilesController < Admin::BaseAdminController
  def index
    @store = Lrs.find(params[:lrs_id])
    @agent_profiles = @store.agent_profiles.page(params[:page]).per(25)
  end
end
