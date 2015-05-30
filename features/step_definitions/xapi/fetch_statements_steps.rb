# encoding: UTF-8
Given(/^a query fetchStatements request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::FetchStatements.build(@lrs, 'query')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end

Given(/^the \[statementId\] parameter is set to good UUID$/) do
  @context['params']['statementId'] = Property::UUID.build('good')
end

Given(/^the \[voidedStatementId\] parameter is set to \[a good UUID\]$/) do
  @context['params']['voidedStatementId'] = Property::UUID.build('good')
end

Given(/^the \[agent\] parameter is set to \[a forQueryMbox agent\]$/) do
  @context['params']['agent'] = Property::Agent.build('forQueryMbox')
end

Given(/^the \[verb\] parameter is set to \[a forQuery verb\]$/) do
  @context['params']['verb'] = Property::Verb.build('forQuery')
end

Given(/^the \[activity\] parameter is set to \['http:\/\/tincanapi\.com\/conformancetest\/activityid\/forQuery'\]$/) do
  @context['params']['activity'] = 'http://tincanapi.com/conformancetest/activityid/forQuery'
end

Given(/^the \[registration\] parameter is set to \[a good UUID\]$/) do
  @context['params']['registration'] = Property::UUID.build('good')
end

Given(/^the \[related_activities\] parameter is set to \['true'\]$/) do
  @context['params']['related_activities'] = true
end

Given(/^the \[related_agents\] parameter is set to \['true'\]$/) do
  @context['params']['related_agents'] = true
end

Given(/^the \[since\] parameter is set to \['2014\-07\-23T12\:34\:02Z'\]$/) do
  @context['params']['since'] = '2014-07-23T12:34:02Z'
end

Given(/^the \[until\] parameter is set to \['2014\-07\-23T12\:34\:02Z'\]$/) do
  @context['params']['until'] = '2014-07-23T12:34:02Z'
end

Given(/^the \[limit\] parameter is set to \['(\d+)'\]$/) do |limit|
  @context['params']['limit'] = limit
end

Given(/^the \[ascending\] parameter is set to \['true'\]$/) do
  @context['params']['ascending'] = true
end

Given(/^the \[voidedStatementId\] parameter is set to good UUID$/) do
  @context['params']['voidedStatementId'] = Property::UUID.build('good')
end

Given(/^the \[agent parameter\] is set to '\[test agent\]'$/) do
  @context['params']['agent'] = 'test agent'
end

Given(/^the \[verb parameter\] is set to '\[test verb id\]'$/) do
  @context['params']['verb'] = 'test verb id'
end

Given(/^the \[activity parameter\] is set to '\[test activity id\]'$/) do
  @context['params']['activity'] = 'test activity id'
end

Given(/^the \[registration parameter\] is set to '\[test registration\]'$/) do
  @context['params']['registration'] = 'test registration'
end

Given(/^the \[related_activities parameter\] is set to '\[not a bool\]'$/) do
  @context['params']['related_activities'] = 'not a bool'
end

Given(/^the \[related_activities parameter\] is set to '\[(\d+)\]'$/) do |value|
  @context['params']['related_activities'] = value
end

Given(/^the \[related_activities parameter\] is set to '\["(.*?)"\]'$/) do |value|
  @context['params']['related_activities'] = value
end

Given(/^the \[related_agents parameter\] is set to '\[not a bool\]'$/) do
  @context['params']['related_agents'] = 'not a bool'
end

Given(/^the \[related_agents parameter\] is set to '\[(\d+)\]'$/) do |value|
  @context['params']['related_agents'] = value
end

Given(/^the \[related_agents parameter\] is set to '\["(.*?)"\]'$/) do |value|
  @context['params']['related_agents'] = value
end

Given(/^the \[since parameter\] is set to '\[bad timestamp\]'$/) do
  @context['params']['since'] = 'bad timestamp'
end

Given(/^the \[until parameter\] is set to '\[bad timestamp\]'$/) do
  @context['params']['until'] = 'bad timestamp'
end

Given(/^the \[limit parameter\] is set to '\[not an integer\]'$/) do
  @context['params']['limit'] = 'not an integer'
end

Given(/^the \[limit parameter\] is set to '\[(\-\d+)\]'$/) do |value|
  @context['params']['limit'] = value
end

Given(/^the \[format parameter\] is set to '\[unrecognized\]'$/) do
  @context['params']['format'] = 'unrecognized'
end

Given(/^the \[attachments parameter\] is set to '\[not a bool\]'$/) do
  @context['params']['attachments'] = 'not a bool'
end

Given(/^the \[attachments parameter\] is set to '\[(\d+)\]'$/) do |value|
  @context['params']['attachments'] = value
end

Given(/^the \[attachments parameter\] is set to '\["(.*?)"\]'$/) do |value|
  @context['params']['attachments'] = value
end

Given(/^the \[ascending parameter\] is set to '\[not a bool\]'$/) do
  @context['params']['ascending'] = 'not a bool'
end

Given(/^the \[ascending parameter\] is set to '\[(\d+)\]'$/) do |value|
  @context['params']['ascending'] = value
end

Given(/^the \[ascending parameter\] is set to '\["(.*?)"\]'$/) do |value|
  @context['params']['ascending'] = value
end


