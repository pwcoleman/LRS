# encoding: UTF-8
Given(/^the statement verb is changed to a \[idOnly\] verb$/) do
  @context['content']['verb'] = Property::Verb.build('idOnly')
end

Given(/^the statement verb is changed to a \[idAndDisplay\] verb$/) do
  @context['content']['verb'] = Property::Verb.build('idAndDisplay')
end

Given(/^the statement verb is changed to a \[idOnly verb\]$/) do
  @context['content']['verb'] = Property::Verb.build('idOnly')
end

Given(/^the statement verb \[id\] is changed to '\[bad id\]'$/) do
  @context['content']['verb']['id'] = 'bad id'
end

Given(/^the statement verb is changed to a \[idAndDisplay verb\]$/) do
  @context['content']['verb'] = Property::Verb.build('idAndDisplay')
end

Given(/^the statement verb \[display\] is changed to '\[bad display\]'$/) do
  @context['content']['verb']['display'] = 'bad display'
end

Given(/^the statement verb \[id\] is removed$/) do
  @context['content']['verb'].delete('id')
end

Given(/^the statement verb \[display\] is removed$/) do
  @context['content']['verb'].delete('display')
end
