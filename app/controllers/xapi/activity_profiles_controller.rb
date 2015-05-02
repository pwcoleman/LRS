class Xapi::ActivityProfilesController < Xapi::BaseController

  # GET /activities/profile
  # gets ids of all state data for this context
  def index
    errors = check_query_parameters
    if errors.empty?
      if params['profileId']
        @profile = ActivityProfile.where(activity_id: params['activityId'], profile_id: params['profileId']).first
        if @profile
          render status: :no_content
        else
          render status: :not_found
        end
      end
    else
      render json: {error: true, success: false, message: errors.join('. '), code: 400}, status: :bad_request
    end
  end

  # POST /activities/profile
  def create
    # TODO Check if it already exists
    # If exists and both JSON then merge
    # else create
    if request.content_type =~ /application\/json/
      profile = ActivityProfile.create_from(@lrs, request.content_type, profile_params)
      if profile.valid?
        render status: :no_content
      else
        render json: {error: true, success: false, message: profile.errors[:state].join('. '), code: 400}, status: :bad_request
      end
    else
      render json: {error: true, success: false, message: 'invalid header content type', code: 400}, status: :bad_request
    end
  end

  # PUT /activities/profile
  def update
    profile = ActivityProfile.create_from(@lrs, request.content_type, profile_params)
    if profile.valid?
      render status: :no_content
    else
      render json: {error: true, success: false, message: profile.errors[:state].join('. '), code: 400}, status: :bad_request
    end
  end

  # DELETE /activities/profile
  def destroy
    pp '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
    pp params
    pp '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    if params['activityId'] && params['profileId']
      @profile = ActivityProfile.where(activity_id: params['activityId'], profile_id: params['profileId']).first
      @profile.destroy if @profile
      render status: :no_content
    else
      errors = []
      errors << 'activityId is required' unless params['activityId']
      errors << 'profileId is required' unless params['profileId']
      if errors.any?
        render json: {error: true, success: false, message: errors.join('. '), code: 400}, status: :bad_request
      end
    end
  end

  private

  def profile_params
    params.reject {|k,v| ['format', 'controller', 'action'].include?(k) }
  end

  def check_query_parameters
    errors = []
    errors << 'Activity ID is missing' unless params['activityId']
    errors << 'Invalid activity id' unless validate_iri(params['activityId'])
    errors
  end
end
