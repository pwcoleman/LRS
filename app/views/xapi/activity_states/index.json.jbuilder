if @state
  json.stateId @state.state_id
  json.activityId @state.activity_id
  json.agent @state.agent
  json.registration @state.registration if @state.registration
end