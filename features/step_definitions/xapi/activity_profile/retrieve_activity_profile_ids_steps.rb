# encoding: UTF-8
Given(/^a typical retrieveActivityProfileIds request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::RetrieveActivityProfileIds.build(@lrs, 'typical')
end

Then(/^the retrieveActivityProfileIds response is verified$/) do
  body = JSON.parse(last_response.body)
  expect(body.size).to eq(3)
  expect(body).to eq(@cluster['primers']['list'].map(&:profile_id))
end

Given(/^a typical retrieveActivityProfileIds request$/) do
  pending # express the regexp above with the code you wish you had
end
