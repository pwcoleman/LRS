# encoding: UTF-8

Given(/^the statement result is changed to a \[(\w+)\] result$/) do |option|
  @context['content']['result'] = Property::Result.build(option)
end

Given(/^the statement result is changed to a durationOnly result$/) do
  @context['content']['result'] = Property::Result.build('durationOnly')
end

Given(/^the statement result duration is changed to '\[PT0H0M0.000S]'$/) do
  @context['content']['result']['duration'] = 'PT0H0M0.000S'
end

Given(/^the statement result \[success\] is changed to '\[not a boolean\]'$/) do
  @context['content']['result']['success'] = 'not a boolean'
end

Given(/^the statement result \[completion\] is changed to '\[not a boolean\]'$/) do
  @context['content']['result']['completion'] = 'not a boolean'
end

Given(/^the statement result \[duration\] is changed to '\[not ISO 8601 formatted\]'$/) do
  @context['content']['result']['duration'] = 'not ISO 8601 formatted'
end

Given(/^the statement result \[score\] is changed to '\[not a score object\]'$/) do
  @context['content']['result']['score'] = 'not a score object'
end

Given(/^the statement result \[score\] is removed$/) do
  @context['content']['result'].delete('score')
end

Given(/^the statement result \[success\] is removed$/) do
  @context['content']['result'].delete('success')
end

Given(/^the statement result \[completion\] is removed$/) do
  @context['content']['result'].delete('completion')
end

Given(/^the statement result \[response\] is removed$/) do
  @context['content']['result'].delete('response')
end

Given(/^the statement result \[duration\] is removed$/) do
  @context['content']['result'].delete('duration')
end
