# encoding: UTF-8
Given(/^a typical saveStatement request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::SaveStatement.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^the statement context is changed to a \[empty\] context$/) do
  @context['content']['context'] = Property::Context.build('empty')
end

Given(/^the statement context is changed to a \[typical\] context$/) do
  @context['content']['context'] = Property::Context.build('typical')
end

Given(/^the statement context is changed to a \[mboxAndTypeAgentInstructor\] context$/) do
  @context['content']['context'] = Property::Context.build('mboxAndTypeAgentInstructor')
end

Given(/^the statement context is changed to a \[mboxSha1AndTypeAgentInstructor\] context$/) do
  @context['content']['context'] = Property::Context.build('mboxSha1AndTypeAgentInstructor')
end

Given(/^the statement context is changed to a \[openidAndTypeAgentInstructor\] context$/) do
  @context['content']['context'] = Property::Context.build('openidAndTypeAgentInstructor')
end

Given(/^the statement context is changed to a \[accountAndTypeAgentInstructor\] context$/) do
  @context['content']['context'] = Property::Context.build('accountAndTypeAgentInstructor')
end

Given(/^the statement context is changed to a \[extensionsOnly\] context$/) do
  @context['content']['context'] = Property::Context.build('extensionsOnly')
end

Given(/^the statement context is changed to a \[emptyExtensionsOnly\] context$/) do
  @context['content']['context'] = Property::Context.build('emptyExtensionsOnly')
end

Given(/^the statement context is changed to a \[emptyContextActivities\] context$/) do
  @context['content']['context'] = Property::Context.build('emptyContextActivities')
end

Given(/^the statement context is changed to a \[emptyContextActivitiesAllPropertiesEmpty\] context$/) do
  @context['content']['context'] = Property::Context.build('emptyContextActivitiesAllPropertiesEmpty')
end

Given(/^the statement context is changed to a \[allProperties\] context$/) do
  @context['content']['context'] = Property::Context.build('allProperties')
end

Given(/^the statement context \[instructor\] is changed to \[an empty agent\]$/) do
  @context['content']['context']['instructor'] = Property::Agent.build('empty')
end

Given(/^the statement context \[team\] is changed to \[an empty group\]$/) do
  @context['content']['context']['instructor'] = Property::Group.build('empty')
end

Given(/^the statement context \[language\] is changed to \[an emptyString content\]$/) do
  @context['content']['context']['language'] = ''
end

Given(/^the statement context \[statement\] is changed to \[an empty statementRef\]$/) do
  @context['content']['context']['statement'] = Property::StatementRef.build('empty')
end

Given(/^the statement context \[registration\] is changed to '\[bad id\]'$/) do
  @context['content']['context']['registration'] = 'bad id'
end

Given(/^the statement context \[instructor\] is changed to '\[notAnAgent\]'$/) do
  @context['content']['context']['instructor'] = 'notAnAgent'
end

Given(/^the statement context \[instructor mbox\] is changed to '\[conformancetest@tincanapi\.com\]'$/) do
  @context['content']['context']['instructor']['mbox'] = 'conformancetest@tincanapi.com'
end

Given(/^the statement context \[instructor mbox\] is changed to '\[bad mbox\]'$/) do
  @context['content']['context']['instructor']['mbox'] = 'bad mbox'
end

Given(/^the statement context \[instructor objectType\] is changed to '\[notAgent\]'$/) do
  @context['content']['context']['instructor']['objectType'] = 'notAgent'
end

Given(/^the statement context is changed to a \[typicalGroupTeam\] context$/) do
  @context['content']['context'] = Property::Context.build('typicalGroupTeam')
end

Given(/^the statement context \[team objectType\] is changed to '\[notAGroup\]'$/) do
  @context['content']['context']['team']['objectType'] = 'notAGroup'
end

Given(/^the statement context \[team mbox\] is changed to '\[conformancetest@tincanapi\.com\]'$/) do
  @context['content']['context']['team']['mbox'] = 'conformancetest@tincanapi.com'
end

Given(/^the statement context \[team mbox\] is changed to '\[bad mbox\]'$/) do
  @context['content']['context']['team']['mbox'] = 'bad mbox'
end

Given(/^the statement context \[language\] is changed to '\[bad language\]'$/) do
  @context['content']['context']['language'] = 'bad language'
end

Given(/^the statement context is changed to a \[statementOnly\] context$/) do
  @context['content']['context'] = Property::Context.build('statementOnly')
end

Given(/^the statement context \[statement id\] is changed to '\[bad id\]'$/) do
  @context['content']['context']['statement']['id'] = 'bad id'
end

Given(/^the statement context \[statement objectType\] is changed to '\[notStatementRef\]'$/) do
  @context['content']['context']['statement']['objectType'] = 'notStatementRef'
end

Given(/^the statement context \[statement objectType\] is changed to '\[statementRef\]'$/) do
  @context['content']['context']['statement']['objectType'] = 'statementRef'
end

Given(/^the statement context \[instructor openid\] is changed to '\[bad openid\]'$/) do
  @context['content']['context']['instructor']['openid'] = 'bad openid'
end

Given(/^the statement context \[instructor account homePage\] is changed to '\[bad homePage\]'$/) do
  @context['content']['context']['instructor']['account']['homePage'] = 'bad homePage'
end

Given(/^the statement context is changed to a \[typicalAgentInstructor\] context$/) do
  @context['content']['context'] = Property::Context.build('typicalAgentInstructor')
end

Given(/^the statement context \[instructor objectType\] is changed to '\[agent\]'$/) do
  @context['content']['context']['instructor']['objectType'] = 'agent'
end

Given(/^the statement context \[team objectType\] is changed to '\[group\]'$/) do
  @context['content']['context']['team']['objectType'] = 'group'
end

Given(/^the statement context is changed to a \[contextActivitiesAllPropertiesOnly\] context$/) do
  @context['content']['context'] = Property::Context.build('contextActivitiesAllPropertiesOnly')
end

Given(/^the statement context \[contextActivities category 0 objectType\] is changed to '\[notActivity\]'$/) do
  @context['content']['context']['contextActivities']['category'][0]['objectType'] = 'notActivity'
end

Given(/^the statement context \[contextActivities parent 0 objectType\] is changed to '\[notActivity\]'$/) do
  @context['content']['context']['contextActivities']['parent'][0]['objectType'] = 'notActivity'
end

Given(/^the statement context \[contextActivities grouping 0 objectType\] is changed to '\[notActivity\]'$/) do
  @context['content']['context']['contextActivities']['grouping'][0]['objectType'] = 'notActivity'
end

Given(/^the statement context \[contextActivities other 0 objectType\] is changed to '\[notActivity\]'$/) do
  @context['content']['context']['contextActivities']['other'][0]['objectType'] = 'notActivity'
end

Given(/^the statement context \[contextActivities category 0 id\] is changed to '\[bad id\]'$/) do
  @context['content']['context']['contextActivities']['category'][0]['id'] = 'bad id'
end

Given(/^the statement context \[contextActivities parent 0 id\] is changed to '\[bad id\]'$/) do
  @context['content']['context']['contextActivities']['parent'][0]['id'] = 'bad id'
end

Given(/^the statement context \[contextActivities grouping 0 id\] is changed to '\[bad id\]'$/) do
  @context['content']['context']['contextActivities']['grouping'][0]['id'] = 'bad id'
end

Given(/^the statement context \[contextActivities other 0 id\] is changed to '\[bad id\]'$/) do
  @context['content']['context']['contextActivities']['other'][0]['id'] = 'bad id'
end

Given(/^the statement context \[contextActivities category 0 objectType\] is changed to '\[activity\]'$/) do
  @context['content']['context']['contextActivities']['category'][0]['objectType'] = 'activity'
end

Given(/^the statement context \[contextActivities parent 0 objectType\] is changed to '\[activity\]'$/) do
  @context['content']['context']['contextActivities']['parent'][0]['objectType'] = 'activity'
end

Given(/^the statement context \[contextActivities grouping 0 objectType\] is changed to '\[activity\]'$/) do
  @context['content']['context']['contextActivities']['grouping'][0]['objectType'] = 'activity'
end

Given(/^the statement context \[contextActivities other 0 objectType\] is changed to '\[activity\]'$/) do
  @context['content']['context']['contextActivities']['other'][0]['objectType'] = 'activity'
end

Given(/^the statement context \[extensions badkey\] is changed to '\[some value\]'$/) do
  @context['content']['context']['extensions']['badkey'] = 'some value'
end

Given(/^the statement context \[instructor mbox\] is removed$/) do
  @context['content']['context']['instructor'].delete('mbox')
end

Given(/^the statement context \[instructor mbox_sha1sum\] is removed$/) do
  @context['content']['context']['instructor'].delete('mbox_sha1sum')
end

Given(/^the statement context \[instructor openid\] is removed$/) do
  @context['content']['context']['instructor'].delete('openid')
end

Given(/^the statement context \[instructor account\] is removed$/) do
  @context['content']['context']['instructor'].delete('account')
end

Given(/^the statement context \[instructor account name\] is removed$/) do
  @context['content']['context']['instructor']['account'].delete('name')
end

Given(/^the statement context \[instructor account homePage\] is removed$/) do
  @context['content']['context']['instructor']['account'].delete('homePage')
end

Given(/^the statement context \[team mbox\] is removed$/) do
  @context['content']['context']['team'].delete('mbox')
end

Given(/^the statement context \[statement id\] is removed$/) do
  @context['content']['context']['statement'].delete('id')
end

Given(/^the statement context \[team objectType\] is removed$/) do
  @context['content']['context']['team'].delete('objectType')
end

Given(/^the statement context \[statement objectType\] is removed$/) do
  @context['content']['context']['statement'].delete('objectType')
end

Given(/^the statement context \[contextActivities category 0 id\] is removed$/) do
  @context['content']['context']['contextActivities']['category'][0].delete('id')
end

Given(/^the statement context \[contextActivities parent 0 id\] is removed$/) do
  @context['content']['context']['contextActivities']['parent'][0].delete('id')
end

Given(/^the statement context \[contextActivities grouping 0 id\] is removed$/) do
  @context['content']['context']['contextActivities']['grouping'][0].delete('id')
end

Given(/^the statement context \[contextActivities other 0 id\] is removed$/) do
  @context['content']['context']['contextActivities']['other'][0].delete('id')
end

Given(/^the statement context \[contextActivities category 0 objectType\] is removed$/) do
  @context['content']['context']['contextActivities']['category'][0].delete('objectType')
end

Given(/^the statement context \[contextActivities parent 0 objectType\] is removed$/) do
  @context['content']['context']['contextActivities']['parent'][0].delete('objectType')
end

Given(/^the statement context \[contextActivities grouping 0 objectType\] is removed$/) do
  @context['content']['context']['contextActivities']['grouping'][0].delete('objectType')
end

Given(/^the statement context \[contextActivities other 0 objectType\] is removed$/) do
  @context['content']['context']['contextActivities']['other'][0].delete('objectType')
end

