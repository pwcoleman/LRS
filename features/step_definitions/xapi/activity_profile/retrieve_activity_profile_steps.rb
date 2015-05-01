# encoding: UTF-8
Given(/^a typical retrieveActivityProfile request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::RetrieveActivityProfile.build(@lrs, 'typical')
end

Then(/^the retrieveActivityProfile response is verified$/) do
  expect(JSON.parse(last_response.body)).to eq(activity_profile_to_hash(@cluster['primers'][0]))
end

Given(/^a typical retrieveActivityProfile request$/) do
  pending # express the regexp above with the code you wish you had
end


def activity_profile_to_hash(state)
  hash = {}
  hash['activityId'] = state.activity_id
  hash['profileId'] = state.profile_id
  hash
end