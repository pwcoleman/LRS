# encoding: UTF-8
Given(/^a \[typical\] clearState request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::ClearState.build(@lrs, 'typical')
end

Then(/^the clearState response is verified$/) do
  expect(last_response.body).to be_empty
end

Given(/^a \[withRegistration\] clearState request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::ClearState.build(@lrs, 'withRegistration')
end

Given(/^a \[typical\] clearState request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a \[withRegistration\] clearState request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^a typical clearState request$/) do
  pending # express the regexp above with the code you wish you had
end
