# encoding: UTF-8
Given(/^a \[typical\] saveState request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::SaveState.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end

Given(/^a \[JSON\] saveState request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::SaveState.build(@lrs, 'JSON')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end

Given(/^a \[withRegistration\] saveState request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::SaveState.build(@lrs, 'withRegistration')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end

Given(/^a typical saveState request$/) do
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::SaveState.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end

