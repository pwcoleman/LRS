# encoding: UTF-8
Given(/^a typical deleteAgentProfile request cluster$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the deleteAgentProfile response is verified$/) do
  pending # express the regexp above with the code you wish you had
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

