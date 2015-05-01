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
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::RetrieveState.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^a \[withRegistration\] retrieveState request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::RetrieveState.build(@lrs, 'withRegistration')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^a typical retrieveState request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::RetrieveState.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
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