class Xapi::AgentProfilesController  < Xapi::BaseController

  # GET /agents/profile
  # gets ids of all state data for this context
  def index
    pp '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    pp params
    pp '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
  end

  # POST /agents/profile
  def create
    pp '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    pp params
    pp '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    # TODO Check if it already exists
    # If exists and both JSON then merge
    # else create
    profile = AgentProfile.create_from(@lrs, request.content_type, profile_params)
    if profile.valid?
      render status: :no_content
    else
      render json: {error: true, success: false, message: profile.errors[:state].join('. '), code: 400}, status: :bad_request
    end
  end

  # PUT /agents/profile
  def update
    pp '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    pp params
    pp '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    profile = AgentProfile.create_from(@lrs, request.content_type, profile_params)
    if profile.valid?
      render status: :no_content
    else
      render json: {error: true, success: false, message: profile.errors[:state].join('. '), code: 400}, status: :bad_request
    end
  end

  # DELETE /agents/profile
  def destroy
    pp '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    pp params
    pp '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
  end

  private

  def profile_params
    params.reject {|k,v| ['format', 'controller', 'action'].include?(k) }
  end

end
