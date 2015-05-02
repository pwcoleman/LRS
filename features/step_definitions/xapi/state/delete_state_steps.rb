# encoding: UTF-8
Given(/^a \[typical\] deleteState request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::DeleteState.build(@lrs, 'typical')
end

Then(/^the deleteState response is verified$/) do
  expect(State.where(id: @cluster['primers'].first.id).exists?).to eq(false)
end

Given(/^a \[withRegistration\] deleteState request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::DeleteState.build(@lrs, 'withRegistration')
end

Given(/^all requests' stateId parameter are set to 'test state id'$/) do
  state_id = 'test state id'
  @cluster['primers'].each do |primer|
    primer.state_id = state_id
    primer.save
  end
  @cluster['main']['params']['stateId'] = state_id
end

Given(/^a \[typical\] deleteState request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a \[withRegistration\] deleteState request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a typical deleteState request$/) do
  pending # express the regexp above with the code you wish you had
end
