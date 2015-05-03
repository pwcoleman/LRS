# encoding: UTF-8
Given(/^a typical retrieveAgentProfileIds request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::RetrieveAgentProfileIds.build(@lrs, 'typical')
end

Then(/^the retrieveAgentProfileIds response is verified$/) do
  body = JSON.parse(last_response.body)
  expect(body.size).to eq(3)
  expect(body).to eq(@cluster['primers']['list'].map(&:profile_id))
end

Given(/^all requests' agent parameter is set to an \[(\w+)\] agent$/) do |type|
  agent = Property::Agent.build(type)
  primers = @cluster['primers'].is_a?(Array) ? @cluster['primers'] : @cluster['primers']['list']
  primers.each do |primer|
    primer.agent = agent
    primer.save
  end
  @cluster['main']['params']['agent'] = agent
end

Given(/^a typical retrieveAgentProfileIds request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::RetrieveAgentProfileIds.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end
