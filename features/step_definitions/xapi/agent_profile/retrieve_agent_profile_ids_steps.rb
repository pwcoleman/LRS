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
  primers = @cluster['primers']['list'] ? @cluster['primers']['list'] : @cluster['primers']
  primers.each do |primer|
    primer.agent = agent
    primer.save
  end
  @cluster['main']['params']['agent'] = agent
end

Given(/^a typical retrieveAgentProfileIds request$/) do
  pending # express the regexp above with the code you wish you had
end
