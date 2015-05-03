# encoding: UTF-8
Given(/^a typical retrieveAgentProfileIds request cluster$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the retrieveAgentProfileIds response is verified$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^all requests' agent parameter is set to an \[(\w+)\] agent$/) do |type|
  agent = Property::Agent.build(type)
  @cluster['primers'].each do |primer|
    primer.agent = agent
    primer.save
  end
  @cluster['main']['params']['agent'] = agent
end
#
# Given(/^all requests' agent parameter is set to an \[mboxAndType\] agent$/) do
#   pending # express the regexp above with the code you wish you had
# end


# Given(/^all requests' agent parameter is set to an \[mboxSha(\d+)AndType\] agent$/) do |arg1|
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^all requests' agent parameter is set to an \[openidAndType\] agent$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^all requests' agent parameter is set to an \[accountAndType\] agent$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Given(/^all requests' agent parameter is set to an \[mboxOnly\] agent$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^all requests' agent parameter is set to an \[mboxSha(\d+)Only\] agent$/) do |arg1|
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^all requests' agent parameter is set to an \[openidOnly\] agent$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^all requests' agent parameter is set to an \[accountOnly\] agent$/) do
#   pending # express the regexp above with the code you wish you had
# end

Given(/^a typical retrieveAgentProfileIds request$/) do
  pending # express the regexp above with the code you wish you had
end
