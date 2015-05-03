# encoding: UTF-8
Given(/^a \[typical\] retrieveStateIds request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::RetrieveStateIds.build(@lrs, 'typical')
end

Then(/^the retrieveStateIds response is verified$/) do
  body = JSON.parse(last_response.body)
  expect(body.size).to eq(3)
  expect(body).to eq(@cluster['primers'].map(&:state_id))
end

Given(/^a \[withRegistration\] retrieveStateIds request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::RetrieveStateIds.build(@lrs, 'withRegistration')
end

Given(/^a \[typical\] retrieveStateIds request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a \[withRegistration\] retrieveStateIds request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a typical retrieveStateIds request$/) do
  pending # express the regexp above with the code you wish you had
end

