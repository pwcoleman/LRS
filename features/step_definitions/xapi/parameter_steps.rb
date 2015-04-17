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
  pending # express the regexp above with the code you wish you had
end