# encoding: UTF-8
Given(/^a \[typical\] saveAgentProfile request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a \[JSON\] saveAgentProfile request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a typical saveAgentProfile request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the \[agent parameter\] is set to \[an mboxAndType agent\]$/) do
  @context['params']['agent'] = Property::Agent.build('mboxAndType')
end

Given(/^the \[agent parameter\] is set to \[an mboxSha1AndType agent\]$/) do
  @context['params']['agent'] = Property::Agent.build('mboxSha1AndType')
end

Given(/^the \[agent parameter\] is set to \[an openidAndType agent\]$/) do
  @context['params']['agent'] = Property::Agent.build('openidAndType')
end

Given(/^the \[agent parameter\] is set to \[an accountAndType agent\]$/) do
  @context['params']['agent'] = Property::Agent.build('accountAndType')
end

Given(/^the \[agent parameter\] is set to \[an mboxOnly agent\]$/) do
  @context['params']['agent'] = Property::Agent.build('mboxOnly')
end

Given(/^the \[agent parameter\] is set to \[an mboxSha1Only agent\]$/) do
  @context['params']['agent'] = Property::Agent.build('mboxSha1Only')
end

Given(/^the \[agent parameter\] is set to \[an openidOnly agent\]$/) do
  @context['params']['agent'] = Property::Agent.build('openidOnly')
end

Given(/^the \[agent parameter\] is set to \[an accountOnly agent\]$/) do
  @context['params']['agent'] = Property::Agent.build('accountOnly')
end

Given(/^the \[content\] is set to \[a typical statement\]$/) do
  @context['content'] = Property::Statement.build('typical')
end

Given(/^the \[stateId parameter\] is set to '\[test state id\]'$/) do
  pending # express the regexp above with the code you wish you had
end
