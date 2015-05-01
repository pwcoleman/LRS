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
    validator = AgentValidator.new({attributes: [:agent], class: State})
    state = State.new
    validator.validate_each(state, :agent, params['agent'])
    errors.concat(state.errors[:agent])
    errors
  end

  def validate_uuid(value)
    value && value =~ /\A(urn:uuid:)?[\da-f]{8}-[\da-f]{4}-4[\da-f]{3}-[8 9 a b][\da-f]{3}-[\da-f]{12}\z/i
  end

  def validate_iri(value)
    success = false
    if value
      base_uri = value
      begin
        uri = Addressable::URI.parse(base_uri)
        success = uri.scheme && uri.host && uri.to_s == base_uri && uri
      rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
      end
    end
    success
  end
end
