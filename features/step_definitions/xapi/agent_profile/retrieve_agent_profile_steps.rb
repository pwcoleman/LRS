# encoding: UTF-8
Given(/^a typical retrieveAgentProfile request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::RetrieveAgentProfile.build(@lrs, 'typical')
end

Then(/^the retrieveAgentProfile response is verified$/) do
  expect(JSON.parse(last_response.body)).to eq(agent_profile_to_hash(@cluster['primers'][0]))
end

Given(/^a typical retrieveAgentProfile request$/) do
  pending # express the regexp above with the code you wish you had
end

def agent_profile_to_hash(profile)
  hash = {}
  hash['agent'] = profile.agent
  hash['profileId'] = profile.profile_id
  hash
end