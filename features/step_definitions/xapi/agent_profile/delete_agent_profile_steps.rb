# encoding: UTF-8
Given(/^a typical deleteAgentProfile request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::DeleteAgentProfile.build(@lrs, 'typical')
end

Then(/^the deleteAgentProfile response is verified$/) do
  expect(AgentProfile.where(id: @cluster['primers'].first.id).exists?).to eq(false)
end

Given(/^all requests' agent parameter are set to an \[(\w+)\] agent$/) do |type|
  agent = Property::Agent.build(type)
  @cluster['primers'].each do |primer|
    primer.agent = agent
    primer.save
  end
  @cluster['main']['params']['agent'] = agent
end

Given(/^a typical deleteAgentProfile request$/) do
  pending # express the regexp above with the code you wish you had
end

