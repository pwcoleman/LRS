# encoding: UTF-8
Given(/^a typical retrieveActivityProfileIds request cluster$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @cluster = Cluster::RetrieveActivityProfileIds.build(@lrs, 'typical')
end

Then(/^the retrieveActivityProfileIds response is verified$/) do
  body = JSON.parse(last_response.body)
  expect(body.size).to eq(3)
  expect(body).to eq(@cluster['primers']['list'].map(&:profile_id))
end

Given(/^a typical retrieveActivityProfileIds request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::RetrieveActivityProfileIds.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end
