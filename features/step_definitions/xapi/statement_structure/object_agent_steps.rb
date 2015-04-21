# encoding: UTF-8
Given(/^the statement object is changed to a \[mboxAndType agent\]$/) do
  @context['content']['object'] = Property::Agent.build('mboxAndType')
end

Given(/^the statement object is changed to a \[mboxSha1AndType agent\]$/) do
  @context['content']['object'] = Property::Agent.build('mboxSha1AndType')
end

Given(/^the statement object is changed to a \[openidAndType agent\]$/) do
  @context['content']['object'] = Property::Agent.build('openidAndType')
end

Given(/^the statement object is changed to a \[accountAndType agent\]$/) do
  @context['content']['object'] = Property::Agent.build('accountAndType')
end

Given(/^the statement object \[mbox\] is changed to '\[conformancetest@tincanapi\.com\]'$/) do
  @context['content']['object']['mbox'] = 'conformancetest@tincanapi.com'
end

Given(/^the statement object \[mbox\] is changed to '\[bad mbox\]'$/) do
  @context['content']['object']['mbox'] = 'bad mbox'
end

Given(/^the statement object \[objectType\] is changed to '\[notAgent\]'$/) do
  @context['content']['object']['objectType'] = 'notAgent'
end

Given(/^the statement object \[openid\] is changed to '\[bad openid\]'$/) do
  @context['content']['object']['openid'] = 'bad openid'
end

Given(/^the statement object \[objectType\] is changed to '\[agent\]'$/) do
  @context['content']['object']['objectType'] = 'agent'
end

Given(/^the statement object \[account homePage\] is changed to '\[bad homePage\]'$/) do
  @context['content']['object']['account']['homePage'] = 'bad homePage'
end

Given(/^the statement object \[mbox\] is removed$/) do
  @context['content']['object'].delete('mbox')
end

Given(/^the statement object \[mbox_sha1sum\] is removed$/) do
  @context['content']['object'].delete('mbox_sha1sum')
end

Given(/^the statement object \[openid\] is removed$/) do
  @context['content']['object'].delete('openid')
end

Given(/^the statement object \[account\] is removed$/) do
  @context['content']['object'].delete('account')
end

Given(/^the statement object \[account name\] is removed$/) do
  @context['content']['object']['account'].delete('name')
end

Given(/^the statement object \[account homePage\] is removed$/) do
  @context['content']['object']['account'].delete('homePage')
end

Given(/^the statement object is changed to a \[mboxOnly agent\]$/) do
  @context['content']['object'] = Property::Agent.build('mboxOnly')
end

Given(/^the statement object is changed to a \[mboxSha1Only agent\]$/) do
  @context['content']['object'] = Property::Agent.build('mboxSha1Only')
end

Given(/^the statement object is changed to a \[openidOnly agent\]$/) do
  @context['content']['object'] = Property::Agent.build('openidOnly')
end

Given(/^the statement object is changed to a \[accountOnly agent\]$/) do
  @context['content']['object'] = Property::Agent.build('accountOnly')
end

