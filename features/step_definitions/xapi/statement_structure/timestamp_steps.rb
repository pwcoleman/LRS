# encoding: UTF-8
Given(/^the statement timestamp is changed to '\[(.+)\]'$/) do |time|
  @context['content']['timestamp'] = time
end

Given(/^the statement timestamp is removed$/) do
  @context['content'].delete('timestamp')
end

