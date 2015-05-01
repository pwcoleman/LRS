class Xapi::AgentProfilesController  < Xapi::BaseController

  # GET /agents/profile
  # gets ids of all state data for this context
  def index
    pp '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    pp params
    pp '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    errors = check_query_parameters
    if errors.empty?
      if params['profileId']
        @profile = AgentProfile.where(agent: params['agent'], profile_id: params['profileId']).first
      end
    else
      render json: {error: true, success: false, message: errors.join('. '), code: 400}, status: :bad_request
    end
  end

  # POST /agents/profile
  def create
    pp '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    pp params
    pp '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    # TODO Check if it already exists
    # If exists and both JSON then merge
    # else create
    if request.content_type =~ /application\/json/
      profile = AgentProfile.create_from(@lrs, request.content_type, profile_params)
      if profile.valid?
        render status: :no_content
      else
        render json: {error: true, success: false, message: profile.errors[:state].join('. '), code: 400}, status: :bad_request
      end
    else
      render json: {error: true, success: false, message: 'invalid header content type', code: 400}, status: :bad_request
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

  def check_query_parameters
    errors = []
    errors << 'Agent is missing' unless params['agent']
    errors
  end

end
