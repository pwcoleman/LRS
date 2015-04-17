# encoding: UTF-8
class State < Document

  def self.create(lrs, content_type, params)
    # TODO: ADD SOME VALIDATION
    state = State.new(lrs: lrs, content_type: content_type)
    state.identity_id = params['stateId']
    state.activity_id = params['activityId']
    if params['agent']
      begin
        state.agent = JSON.parse(params['agent'])
      rescue
        state.agent = params['agent']
      end
    end
    state.registration = params['registration']
    state.content = params
    state.save
    state
  end
end
