class Xapi::ActivityStatesController < Xapi::BaseController

  # GET /activities/state
  # gets ids of all state data for this context
  def index
    pp '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    pp params
    pp '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
  end

  # POST /activities/state
  def create
    # TODO Check if it already exists
    # If exists and both JSON then merge
    # else create
    state = State.create(@lrs, request.content_type, state_params)
    if state.valid?
      render status: :no_content
    else
      render json: {error: true, success: false, message: state.errors[:state].join('. '), code: 400}, status: :bad_request
    end
  end


  # PUT /activities/state
  def update
    # TODO Check if it already exists
    state = State.create(@lrs, request.content_type, state_params)
    if state.valid?
      render status: :no_content
    else
      render json: {error: true, success: false, message: state.errors[:state].join('. '), code: 400}, status: :bad_request
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
end
