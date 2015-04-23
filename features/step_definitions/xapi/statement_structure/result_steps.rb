# encoding: UTF-8

Given(/^the statement result is changed to a \[(\w+)\] result$/) do |option|
  @context['content']['result'] = Property::Result.build(option)
end


# Given(/^the statement result is changed to a \[empty\] result$/) do
#   @context['content']['result'] = Property::Result.build('empty')
# end
#
# Given(/^the statement result is changed to a \[typical\] result$/) do
#   @context['content']['result'] = Property::Result.build('typical')
# end
#
# Given(/^the statement result is changed to a \[scoreOnly\] result$/) do
#   @context['content']['result'] = Property::Result.build('scoreOnly')
# end
#
# Given(/^the statement result is changed to a \[emptyScoreOnly\] result$/) do
#   @context['content']['result'] = Property::Result.build('emptyScoreOnly')
# end
#
# Given(/^the statement result is changed to a \[successOnly\] result$/) do
#   @context['content']['result'] = Property::Result.build('successOnly')
# end
#
# Given(/^the statement result is changed to a \[completionOnly\] result$/) do
#   @context['content']['result'] = Property::Result.build('completionOnly')
# end
#
# Given(/^the statement result is changed to a \[responseOnly\] result$/) do
#   @context['content']['result'] = Property::Result.build('responseOnly')
# end
#
# Given(/^the statement result is changed to a \[durationOnly\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[extensionsOnly\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[emptyExtensionsOnly\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Given(/^the statement result is changed to a \[scoreAndSuccess\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[scoreAndResponse\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[scoreAndDuration\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[successAndCompletion\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[successAndResponse\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[successAndDuration\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[completionAndResponse\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[completionAndDuration\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[responseAndDuration\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Given(/^the statement result is changed to a \[scoreSuccessAndCompletion\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[scoreSuccessAndResponse\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[scoreSuccessAndDuration\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[scoreCompletionAndResponse\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Given(/^the statement result is changed to a \[scoreResponseAndDuration\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[successCompletionAndResponse\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[successCompletionAndDuration\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[successResponseAndDuration\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[completionResponseAndDuration\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Given(/^the statement result is changed to a \[scoreSuccessCompletionAndDuration\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[scoreSuccessCompletionAndResponse\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[successCompletionResponseAndDuration\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^the statement result is changed to a \[allProperties\] result$/) do
#   pending # express the regexp above with the code you wish you had
# end

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
