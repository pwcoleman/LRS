# encoding: UTF-8
Given(/^a \[typical\] retrieveState request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::RetrieveState.build(@lrs, 'typical')
end

Given(/^a \[withRegistration\] retrieveState request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::RetrieveState.build(@lrs, 'withRegistration')
end

Given(/^a \[typical\] retrieveState request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a \[withRegistration\] retrieveState request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a typical retrieveState request$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the retrieveState response is verified$/) do
  expect(JSON.parse(last_response.body)).to eq(state_to_hash(@cluster['primers'][0]))
end


def state_to_hash(state)
  hash = {}
  hash['stateId'] = state.state_id
  hash['activityId'] = state.activity_id
  hash['agent'] = state.agent
  hash['registration'] = state.registration if state.registration
  hash
end