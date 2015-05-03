class Xapi::ActivityStatesController < Xapi::BaseController

  # GET /activities/state
  # gets ids of all state data for this context
  def index
    pp '========================='
    pp params
    pp '========================='
    errors = check_query_parameters
    if errors.empty?
      if params['stateId']
        # single
        # TODO: USE registration parameter in query
        agent = params['agent'].is_a?(Hash) ? params['agent'] : JSON.parse(params['agent'])
        agent['objectType'] = 'Agent' unless agent['objectType']
        @state = State.where(state_id: params['stateId'], activity_id: params['activityId'], agent: agent).first
        if @state

        else
          render status: :not_found
        end
      else
        agent = params['agent'].is_a?(Hash) ? params['agent'] : JSON.parse(params['agent'])
        agent['objectType'] = 'Agent' unless agent['objectType']
        @states = State.where(activity_id: params['activityId'], agent: agent)
        pp @states
      end
    else
      render json: {error: true, success: false, message: errors.join('. '), code: 400}, status: :bad_request
    end
  end

  # POST /activities/state
  def create
    # TODO CHeck content type
    if request.content_type =~ /application\/json/
      errors = check_parameters
      if errors.empty?
        # TODO Check if it already exists
        # If exists and both JSON then merge
        # else create
        state = State.create_from(@lrs, request.content_type, state_params)
        if state.valid?
          render status: :no_content
        else
          render json: {error: true, success: false, message: state.errors[:state].join('. '), code: 400}, status: :bad_request
        end
      else
        render json: {error: true, success: false, message: errors.join('. '), code: 400}, status: :bad_request
      end
    else
      render json: {error: true, success: false, message: 'invalid header content type', code: 400}, status: :bad_request
    end
  end


  # PUT /activities/state
  def update
    errors = check_parameters
    if errors.empty?
      # TODO Check if it already exists
      state = State.create_from(@lrs, request.content_type, state_params)
      if state.valid?
        render status: :no_content
      else
        render json: {error: true, success: false, message: state.errors[:state].join('. '), code: 400}, status: :bad_request
      end
    else
      render json: {error: true, success: false, message: errors.join('. '), code: 400}, status: :bad_request
    end
  end

  # DELETE /activities/state
  def destroy
    errors = check_destroy_parameters
    if errors.empty?
      # TODO: USE registration parameter in query
      @state = State.where(activity_id: params['activityId'], agent: params['agent'], state_id: params['stateId']).first
      @state.destroy if @state
      render status: :no_content
    else
      render json: {error: true, success: false, message: errors.join('. '), code: 400}, status: :bad_request
    end
  end

  private

  def state_params
    params.reject {|k,v| ['format', 'controller', 'action', 'object', 'result', 'context', 'timestamp', 'stored', 'authority', 'version', 'attachments'].include?(k) }
  end

  def check_parameters
    errors = []
    errors << 'State ID is missing' unless params['stateId']
    errors << 'Activity ID is missing' unless params['activityId']
    errors << 'Agent is missing' unless params['agent']
    errors
  end

  def check_query_parameters
    errors = []
    errors << 'Agent is missing' unless params['agent']
    errors << 'Activity ID is missing' unless params['activityId']
    errors << 'Invalid activity id' unless validate_iri(params['activityId'])
    if params['registration']
      errors << 'Invalid registration' unless validate_uuid(params['registration'])
    end
    if params['agent']
      validator = AgentValidator.new({attributes: [:agent], class: State})
      state = State.new
      agent =  params['agent'].is_a?(Hash) ?params['agent'] : JSON.parse(params['agent'])
      validator.validate_each(state, :agent, agent)
      errors.concat(state.errors[:agent])
    end
    errors
  end

  def check_destroy_parameters
    errors = []
    errors << 'Activity ID is missing' unless params['activityId']
    errors << 'Agent is missing' unless params['agent']
    errors << 'Invalid activity id' unless validate_iri(params['activityId'])
    if params['registration']
      errors << 'Invalid registration' unless validate_uuid(params['registration'])
    end
    if params['agent']
      validator = AgentValidator.new({attributes: [:agent], class: State})
      state = State.new
      agent =  params['agent'].is_a?(Hash) ?params['agent'] : JSON.parse(params['agent'])
      validator.validate_each(state, :agent, agent)
      errors.concat(state.errors[:agent])
    end
    errors
  end

end
