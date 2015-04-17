# encoding: UTF-8
Given(/^the \[statementId parameter\] is set to '\[(.*?)\]'$/) do |value|
  @context['params']['statementId'] = value
end

Given(/^the \[statementId parameter\] is deleted$/) do
  @context['params'].delete('statementId')
end

Given(/^the \[content\] is removed$/) do
  @context['content'] = nil
end

Given(/^the \[stateId parameter\] is removed$/) do
  @context['params'].delete('stateId')
end

Given(/^the \[activityId parameter\] is removed$/) do
  @context['params'].delete('activityId')
end

Given(/^the \[activityId parameter\] is set to '\[bad URI\]'$/) do
  @context['params']['activityId'] = 'bad URI'
end

Given(/^the \[agent parameter\] is removed$/) do
  @context['params'].delete('agent')
end

Given(/^the agent parameter is set to an empty agent$/) do
  @context['params']['agent'] = Property::Agent.build('empty')
end

Given(/^the \[registration parameter\] is set to '\[bad UUID\]'$/) do
  @context['params']['registration'] = Property::UUID.build('bad')
end

Given(/^the agent parameter is set to a \[(.*?)\] agent$/) do |agent_type|
  @context['params']['agent'] = Property::Agent.build(agent_type)
end

Given(/^the params agent \[mbox\] is set to '\[conformancetest@tincanapi\.com\]'$/) do
  @context['params']['agent']['mbox'] = 'conformancetest@tincanapi.com'
end

Given(/^the params agent \[mbox\] is set to '\[bad mbox\]'$/) do
  @context['params']['agent']['mbox'] = 'conformancetest@tincanapi.com'
end

Given(/^the params agent \[objectType\] is set to '\[notAgent\]'$/) do
  @context['params']['agent']['objectType'] = 'notAgent'
end

Given(/^the params agent \[objectType\] is set to '\[Activity\]'$/) do
  @context['params']['agent']['objectType'] = 'Activity'
end

Given(/^the params agent \[objectType\] is set to '\[agent\]'$/) do
  @context['params']['agent']['objectType'] = 'agent'
end

Given(/^the params agent \[openid\] is set to '\[bad URI\]'$/) do
  @context['params']['agent']['openid'] = 'bad URI'
end

Given(/^the params agent \[account homePage\] is set to '\[bad URI\]'$/) do
  @context['params']['agent']['account']['homePage'] = 'bad URI'
end

Given(/^the params agent \[mbox\] is removed$/) do
  @context['params']['agent'].delete('mbox')
end

Given(/^the params agent \[account homePage\] is removed$/) do
  @context['params']['agent']['account'].delete('homePage')
end

Given(/^the params agent \[account name\] is removed$/) do
  @context['params']['agent']['account'].delete('name')
end
