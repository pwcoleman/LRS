# encoding: UTF-8
Given(/^the \[statementId parameter\] is set to '\[(.*?)\]'$/) do |value|
  pending # express the regexp above with the code you wish you had
end

Given(/^the \[statementId parameter\] is deleted$/) do
  @context['params'].delete('statementId')
end


