# encoding: UTF-8
Given(/^the \[authority header\] is set to '\[(.*?)\]'$/) do |value|
  header('Authorization', value)
end

Given(/^the \[version header\] is set to '\[(.*?)\]'$/) do |version|
  header('X-Experience-API-Version', version)
end

Given(/^the \[Content\-Type header\] is set to '\[(.*?)\]'$/) do |value|
  pending # express the regexp above with the code you wish you had
end

Given(/^the \[authority header\] is deleted$/) do
  header('Authorization', nil)
end

Given(/^the \[version header\] is deleted$/) do
  header('X-Experience-API-Version', nil)
end

Given(/^the \[Content\-Type header\] is deleted$/) do
  pending # express the regexp above with the code you wish you had
end

