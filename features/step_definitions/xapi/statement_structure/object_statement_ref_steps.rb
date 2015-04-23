# encoding: UTF-8
Given(/^the statement object is changed to a \[allProperties statementRef\]$/) do
  @context['content']['object'] = Property::StatementRef.build('allProperties')
end

Given(/^the statement object \[objectType\] is changed to '\[notStatementRef\]'$/) do
  @context['content']['object']['objectType'] = 'notStatementRef'
end

Given(/^the statement object \[objectType\] is changed to '\[statementRef\]'$/) do
  @context['content']['object']['objectType'] = 'statementRef'
end
