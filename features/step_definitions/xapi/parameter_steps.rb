# encoding: UTF-8
Given(/^the \[statementId parameter\] is set to '\[(.*?)\]'$/) do |value|
  @context['params']['statementId'] = value
end

Given(/^the \[statementId parameter\] is deleted$/) do
  @context['params'].delete('statementId')
end


