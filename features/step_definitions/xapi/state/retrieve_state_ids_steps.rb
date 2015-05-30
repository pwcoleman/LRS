# encoding: UTF-8
Given(/^a \[typical\] retrieveStateIds request cluster$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @cluster = Cluster::RetrieveStateIds.build(@lrs, 'typical')
end

Then(/^the retrieveStateIds response is verified$/) do
  body = JSON.parse(last_response.body)
  expect(body.size).to eq(3)
  expect(body).to eq(@cluster['primers'].map(&:state_id))
end

Given(/^a \[withRegistration\] retrieveStateIds request cluster$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @cluster = Cluster::RetrieveStateIds.build(@lrs, 'withRegistration')
end

Given(/^a \[typical\] retrieveStateIds request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::RetrieveStateIds.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end

Given(/^a \[withRegistration\] retrieveStateIds request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::RetrieveStateIds.build(@lrs, 'withRegistration')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end

Given(/^a typical retrieveStateIds request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::RetrieveStateIds.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end

