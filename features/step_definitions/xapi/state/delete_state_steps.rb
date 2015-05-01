# encoding: UTF-8
Given(/^a \[typical\] deleteState request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Cluster::DeleteState.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Then(/^the deleteState response is verified$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a \[withRegistration\] deleteState request cluster$/) do
  pending # express the regexp above with the code you wish you had
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
