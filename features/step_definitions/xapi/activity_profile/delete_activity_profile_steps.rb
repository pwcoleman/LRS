# encoding: UTF-8
Given(/^a typical deleteActivityProfile request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::DeleteActivityProfile.build(@lrs, 'typical')
end

Then(/^the deleteActivityProfile response is verified$/) do
  expect(ActivityProfile.where(id: @cluster['primers'].first.id).exists?).to eq(false)
end

Given(/^a typical deleteActivityProfile request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the \[profileId parameter\] is removed$/) do
  @context['params'].delete('profileId')
end

Given(/^the version header is removed$/) do
  pending # express the regexp above with the code you wish you had
end
