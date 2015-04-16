# encoding: UTF-8
class State < Document

  def self.create(lrs, content_type, params)
    state = State.new(lrs: lrs, content_type: content_type)
    state.identity_id = params['stateId']
    state.activity_id = params['activityId']
    state.agent = params['agent'] if params['agent']
    state.registration = params['registration']
    state.content = params
    state.save
    state
  end
end
