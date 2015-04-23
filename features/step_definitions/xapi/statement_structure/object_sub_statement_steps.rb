# encoding: UTF-8

Given(/^the statement object is changed to a \[(\w+)\] subStatement$/) do |option|
  @context['content']['object'] = Property::SubStatement.build(option)
end

Given(/^the statement object \[objectType\] is set to '\[notSubStatement\]'$/) do
  @context['content']['object']['objectType'] = 'notSubStatement'
end

Given(/^the statement object \[objectType\] is set to '\[subStatement\]'$/) do
  @context['content']['object']['objectType'] = 'subStatement'
end

Given(/^the statement object \[actor mbox\] is set to '\[conformancetest@tincanapi\.com\]'$/) do
  @context['content']['object']['actor']['mbox'] = 'conformancetest@tincanapi.com'
end

Given(/^the statement object \[actor mbox\] is set to '\[badMbox\]'$/) do
  @context['content']['object']['actor']['mbox'] = 'badMbox'
end

Given(/^the statement object \[actor openid\] is set to '\[bad openid\]'$/) do
  @context['content']['object']['actor']['openid'] = 'bad openid'
end

Given(/^the statement object \[actor account homePage\] is set to '\[bad homePage\]'$/) do
  @context['content']['object']['actor']['account']['homePage'] = 'bad homePage'
end

Given(/^the statement object \[actor objectType\] is set to '\[notAgent\]'$/) do
  @context['content']['object']['actor']['objectType'] = 'notAgent'
end

Given(/^the statement object \[actor objectType\] is set to '\[agent\]'$/) do
  @context['content']['object']['actor']['objectType'] = 'agent'
end

Given(/^the statement object \[verb id\] is set to '\[bad id\]'$/) do
  @context['content']['object']['verb']['id'] = 'bad id'
end

Given(/^the statement object \[object mbox\] is set to '\[conformancetest@tincanapi\.com\]'$/) do
  @context['content']['object']['object']['mbox'] = 'conformancetest@tincanapi.com'
end

Given(/^the statement object \[object mbox\] is set to '\[badMbox\]'$/) do
  @context['content']['object']['object']['mbox'] = 'badMbox'
end

Given(/^the statement object \[object openid\] is set to '\[bad openid\]'$/) do
  @context['content']['object']['object']['openid'] = 'bad openid'
end

Given(/^the statement object \[object account homePage\] is set to '\[bad homePage\]'$/) do
  @context['content']['object']['object']['account']['homePage'] = 'bad homePage'
end

Given(/^the statement object \[object objectType\] is set to '\[notAgent\]'$/) do
  @context['content']['object']['object']['objectType'] = 'notAgent'
end

Given(/^the statement object \[objectType\] is set to '\[agent\]'$/) do
  @context['content']['object']['object']['objectType'] = 'agent'
end

Given(/^the statement object \[object member 0 mbox\] is set to '\[conformancetest@tincanapi\.com\]'$/) do
  @context['content']['object']['object']['member'][0]['mbox'] = 'conformancetest@tincanapi.com'
end

Given(/^the statement object \[object member 0 mbox\] is set to '\[bad mbox\]'$/) do
  @context['content']['object']['object']['member'][0]['mbox'] = 'bad mbox'
end

Given(/^the statement object \[object member (\d+) objectType\] is set to '\[notAgent\]'$/) do |arg1|
  @context['content']['object']['object']['member'][0]['objectType'] = 'notAgent'
end

Given(/^the statement object \[object member (\d+) objectType\] is set to '\[agent\]'$/) do |arg1|
  @context['content']['object']['object']['member'][0]['objectType'] = 'agent'
end

Given(/^the statement object \[object objectType\] is set to '\[statementRef\]'$/) do
  @context['content']['object']['object']['objectType'] = 'statementRef'
end

Given(/^the statement object \[object objectType\] is set to '\[notStatementRef\]'$/) do
  @context['content']['object']['object']['objectType'] = 'notStatementRef'
end

Given(/^the statement object \[object id\] is set to '\[bad id\]'$/) do
  @context['content']['object']['object']['id'] = 'bad id'
end

Given(/^the statement object \[actor mbox\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[actor mbox_sha(\d+)sum\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[actor openid\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[actor account\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[actor account name\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[actor account homePage\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[verb id\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[object mbox\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[object mbox_sha(\d+)sum\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[object openid\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[object account\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[object account name\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[object account homePage\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object is changed to a \[mboxSha(\d+)OnlyAgentObject\] subStatement$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[object id\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement object \[object objectType\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end
