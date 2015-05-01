class Xapi::ActivityStatesController < Xapi::BaseController

  # GET /activities/state
  # gets ids of all state data for this context
  def index
    errors = check_query_parameters
    if errors.empty?
      if params['stateId']
        # single
        @state = State.where(state_id: params['stateId'], activity_id: params['activityId'], agent: params['agent']).first
      else

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
    pp '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    pp params
    pp '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
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
      if params['agent'].is_a?(Hash)
        validator.validate_each(state, :agent, params['agent'])
      else
        validator.validate_each(state, :agent, JSON.parse(params['agent']))
      end
      errors.concat(state.errors[:agent])
    end
    errors
  end

end
