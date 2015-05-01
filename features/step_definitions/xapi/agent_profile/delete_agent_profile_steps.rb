# encoding: UTF-8
Given(/^a typical deleteAgentProfile request cluster$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the deleteAgentProfile response is verified$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^all requests' agent parameter are set to an \[(\w+)\] agent$/) do |type|
  agent = Property::Agent.build(type)
  @cluster['primers'].each do |primer|
    primer.agent = agent
    primer.save
  end
  @cluster['main']['params']['agent'] = agent
end

# Given(/^all requests' agent parameter are set to an \[mboxSha1AndType\] agent$/) do
#   agent = Property::Agent.build('mboxSha1AndType')
#   @cluster['primers'].each do |primer|
#     primer.agent = agent
#     primer.save
#   end
#   @cluster['main']['params']['agent'] = agent
# end
#
# Given(/^all requests' agent parameter are set to an \[openidAndType\] agent$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^all requests' agent parameter are set to an \[accountAndType\] agent$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^all requests' agent parameter are set to an \[mboxOnly\] agent$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^all requests' agent parameter are set to an \[mboxSha(\d+)Only\] agent$/) do |arg1|
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^all requests' agent parameter are set to an \[openidOnly\] agent$/) do
#   pending # express the regexp above with the code you wish you had
# end
#
# Given(/^all requests' agent parameter are set to an \[accountOnly\] agent$/) do
#   pending # express the regexp above with the code you wish you had
# end

Given(/^a typical deleteAgentProfile request$/) do
  pending # express the regexp above with the code you wish you had
end

