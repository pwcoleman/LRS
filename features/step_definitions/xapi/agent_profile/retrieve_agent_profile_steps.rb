# encoding: UTF-8
Given(/^a typical retrieveAgentProfile request cluster$/) do
  @lrs = FactoryGirl.create(:lrs)
  @cluster = Cluster::RetrieveAgentProfile.build(@lrs, 'typical')
end

Then(/^the retrieveAgentProfile response is verified$/) do
  expect(JSON.parse(last_response.body)).to eq(agent_profile_to_hash(@cluster['primers'][0]))
end

Given(/^a typical retrieveAgentProfile request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::RetrieveAgentProfile.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

def agent_profile_to_hash(profile)
  hash = {}
  hash['agent'] = profile.agent
  hash['profileId'] = profile.profile_id
  hash
end