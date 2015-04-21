# encoding: UTF-8
Given(/^the statement object is changed to a \[mboxAndType group\]$/) do
  @context['content']['object'] = Property::Group.build('mboxAndType')
end

Given(/^the statement object is changed to a \[mboxSha1AndType group\]$/) do
  @context['content']['object'] = Property::Group.build('mboxSha1AndType')
end

Given(/^the statement object is changed to a \[openidAndType group\]$/) do
  @context['content']['object'] = Property::Group.build('openidAndType')
end

Given(/^the statement object is changed to a \[accountAndType group\]$/) do
  @context['content']['object'] = Property::Group.build('accountAndType')
end

Given(/^the statement object \[objectType\] is changed to '\[notGroup\]'$/) do
  @context['content']['object']['objectType'] = 'notGroup'
end

Given(/^the statement object is changed to a \[allPropertiesMboxAgentMember group\]$/) do
  @context['content']['object'] = Property::Group.build('allPropertiesMboxAgentMember')
end

Given(/^the statement object \[member 0 mbox\] is changed to '\[conformancetest@tincanapi\.com\]'$/) do
  @context['content']['object']['member'][0]['mbox'] = 'conformancetest@tincanapi.com'
end

Given(/^the statement object \[member 0 mbox\] is changed to '\[bad mbox\]'$/) do
  @context['content']['object']['member'][0]['mbox'] = 'bad mbox'
end

Given(/^the statement object \[objectType\] is changed to '\[group\]'$/) do
  @context['content']['object']['objectType'] = 'group'
end

Given(/^the statement object is changed to a \[allPropertiesOpenidAgentMember group\]$/) do
  @context['content']['object'] = Property::Group.build('allPropertiesOpenidAgentMember')
end

Given(/^the statement object \[member 0 openid\] is changed to '\[bad openid\]'$/) do
  @context['content']['object']['member'][0]['openid'] = 'bad openid'
end

Given(/^the statement object is changed to a \[allPropertiesAccountAgentMember group\]$/) do
  @context['content']['object'] = Property::Group.build('allPropertiesAccountAgentMember')
end

Given(/^the statement object \[member 0 account homePage\] is changed to '\[bad homePage\]'$/) do
  @context['content']['object']['member'][0]['account']['homePage'] = 'bad homePage'
end

Given(/^the statement object \[objectType\] is removed$/) do
  @context['content']['object'].delete('objectType')
end

