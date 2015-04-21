# encoding: UTF-8
Given(/^the statement actor is changed to a \[mboxAndType agent\]$/) do
  @context['content']['actor'] = Property::Agent.build('mboxAndType')
end

Then(/^the request was successful$/) do
  expect(last_response.status).to eq(204)
end

Given(/^the statement actor is changed to a \[mboxSha1AndType agent\]$/) do
  @context['content']['actor'] = Property::Agent.build('mboxSha1AndType')
end

Given(/^the statement actor is changed to a \[openidAndType agent\]$/) do
  @context['content']['actor'] = Property::Agent.build('openidAndType')
end

Given(/^the statement actor is changed to a \[accountAndType agent\]$/) do
  @context['content']['actor'] = Property::Agent.build('accountAndType')
end

Given(/^the statement actor is changed to a \[mboxOnly agent\]$/) do
  @context['content']['actor'] = Property::Agent.build('mboxOnly')
end

Given(/^the statement actor is changed to a \[mboxSha1Only agent\]$/) do
  @context['content']['actor'] = Property::Agent.build('mboxSha1Only')
end

Given(/^the statement actor is changed to a \[openidOnly agent\]$/) do
  @context['content']['actor'] = Property::Agent.build('openidOnly')
end

Given(/^the statement actor is changed to a \[accountOnly agent\]$/) do
  @context['content']['actor'] = Property::Agent.build('accountOnly')
end

Given(/^the statement actor is changed to a \[mboxAndType group\]$/) do
  @context['content']['actor'] = Property::Group.build('mboxAndType')
end

Given(/^the statement actor is changed to a \[mboxSha1AndType group\]$/) do
  @context['content']['actor'] = Property::Group.build('mboxSha1AndType')
end

Given(/^the statement actor is changed to a \[openidAndType group\]$/) do
  @context['content']['actor'] = Property::Group.build('openidAndType')
end

Given(/^the statement actor is changed to a \[accountAndType group\]$/) do
  @context['content']['actor'] = Property::Group.build('accountAndType')
end

Given(/^the statement actor \[mbox\] is changed to '\[conformancetest@tincanapi\.com\]'$/) do
  @context['content']['actor']['mbox'] = 'conformancetest@tincanapi.com'
end

Given(/^the statement actor \[mbox\] is changed to '\[bad mbox\]'$/) do
  @context['content']['actor']['mbox'] = 'bad mbox'
end

Given(/^the statement actor \[objectType\] is changed to '\[notAgent\]'$/) do
  @context['content']['actor']['objectType'] = 'notAgent'
end

Given(/^the statement actor \[objectType\] is changed to '\[notGroup\]'$/) do
  @context['content']['actor']['objectType'] = 'notGroup'
end

Given(/^the statement actor is changed to a \[allPropertiesMboxAgentMember group\]$/) do
  @context['content']['actor'] = Property::Group.build('allPropertiesMboxAgentMember')
end

Given(/^the statement actor \[member 0 mbox\] is changed to '\[conformancetest@tincanapi\.com\]'$/) do
  @context['content']['actor']['member'][0]['mbox'] = 'conformancetest@tincanapi.com'
end

Given(/^the statement actor \[member 0 mbox\] is changed to '\[bad mbox\]'$/) do
  @context['content']['actor']['member'][0]['mbox'] = 'bad mbox'
end

Given(/^the statement actor \[openid\] is changed to '\[bad openid\]'$/) do
  @context['content']['actor']['openid'] = 'bad openid'
end

Given(/^the statement actor \[account homePage\] is changed to '\[bad homePage\]'$/) do
  @context['content']['actor']['account']['homePage'] = 'bad homePage'
end

Given(/^the statement actor \[objectType\] is changed to '\[agent\]'$/) do
  @context['content']['actor']['objectType'] = 'agent'
end

Given(/^the statement actor \[objectType\] is changed to '\[group\]'$/) do
  @context['content']['actor']['objectType'] = 'group'
end

Given(/^the statement actor is changed to a \[allPropertiesOpenidAgentMember group\]$/) do
  @context['content']['actor'] = Property::Group.build('allPropertiesOpenidAgentMember')
end

Given(/^the statement actor \[member 0 openid\] is changed to '\[bad openid\]'$/) do
  @context['content']['actor']['member'][0]['openid'] = 'bad openid'
end

Given(/^the statement actor is changed to a \[allPropertiesAccountAgentMember group\]$/) do
  @context['content']['actor'] = Property::Group.build('allPropertiesAccountAgentMember')
end

Given(/^the statement actor \[member 0 account homePage\] is changed to '\[bad homePage\]'$/) do
  @context['content']['actor']['member'][0]['account']['homePage'] = 'bad homePage'
end

Given(/^the statement actor \[openid\] is changed to '\[bad URI\]'$/) do
  @context['content']['actor']['openid'] = 'bad URI'
end

Given(/^the statement actor \[mbox\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement actor \[mbox_sha(\d+)sum\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement actor \[openid\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement actor \[account\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement actor \[account name\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement actor \[account homePage\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement actor \[objectType\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end
