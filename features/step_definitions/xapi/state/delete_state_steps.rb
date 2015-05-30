# encoding: UTF-8
Given(/^a \[typical\] deleteState request cluster$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @cluster = Cluster::DeleteState.build(@lrs, 'typical')
end

Then(/^the deleteState response is verified$/) do
  expect(State.where(id: @cluster['primers'].first.id).exists?).to eq(false)
end

Given(/^a \[withRegistration\] deleteState request cluster$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @cluster = Cluster::DeleteState.build(@lrs, 'withRegistration')
end

Given(/^all requests' stateId parameter are set to 'test state id'$/) do
  state_id = 'test state id'
  @cluster['primers'].each do |primer|
    primer.state_id = state_id
    primer.save
  end
  @cluster['main']['params']['stateId'] = state_id
end

Given(/^a \[typical\] deleteState request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::DeleteState.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end

Given(/^a \[withRegistration\] deleteState request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::DeleteState.build(@lrs, 'withRegistration')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end

Given(/^a typical deleteState request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::DeleteState.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end
