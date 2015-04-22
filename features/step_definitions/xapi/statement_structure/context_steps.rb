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
  @context['content']['context'] = Property::Context.build('mboxAndTypeAgentInstructor')
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
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor\] is changed to '\[notAnAgent\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor mbox\] is changed to '\[conformancetest@tincanapi\.com\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor mbox\] is changed to '\[bad mbox\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor objectType\] is changed to '\[notAgent\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context is changed to a \[typicalGroupTeam\] context$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[team objectType\] is changed to '\[notAGroup\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[team mbox\] is changed to '\[conformancetest@tincanapi\.com\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[team mbox\] is changed to '\[bad mbox\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[language\] is changed to '\[bad language\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context is changed to a \[statementOnly\] context$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[statement id\] is changed to '\[bad id\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[statement objectType\] is changed to '\[notStatementRef\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[statement objectType\] is changed to '\[statementRef\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor openid\] is changed to '\[bad openid\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor account homePage\] is changed to '\[bad homePage\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context is changed to a \[typicalAgentInstructor\] context$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor objectType\] is changed to '\[agent\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[team objectType\] is changed to '\[group\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context is changed to a \[contextActivitiesAllPropertiesOnly\] context$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities category (\d+) objectType\] is changed to '\[notActivity\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities parent (\d+) objectType\] is changed to '\[notActivity\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities grouping (\d+) objectType\] is changed to '\[notActivity\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities other (\d+) objectType\] is changed to '\[notActivity\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities category (\d+) id\] is changed to '\[bad id\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities parent (\d+) id\] is changed to '\[bad id\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities grouping (\d+) id\] is changed to '\[bad id\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities other (\d+) id\] is changed to '\[bad id\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities category (\d+) objectType\] is changed to '\[activity\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities parent (\d+) objectType\] is changed to '\[activity\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities grouping (\d+) objectType\] is changed to '\[activity\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities other (\d+) objectType\] is changed to '\[activity\]'$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[extensions badkey\] is changed to '\[some value\]'$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor mbox\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor mbox_sha(\d+)sum\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor openid\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor account\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor account name\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[instructor account homePage\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[team mbox\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[statement id\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[team objectType\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[statement objectType\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities category (\d+) id\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities parent (\d+) id\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities grouping (\d+) id\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities other (\d+) id\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities category (\d+) objectType\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities parent (\d+) objectType\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities grouping (\d+) objectType\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the statement context \[contextActivities other (\d+) objectType\] is removed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

