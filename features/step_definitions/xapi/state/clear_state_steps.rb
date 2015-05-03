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
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::ClearState.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^a \[withRegistration\] clearState request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::ClearState.build(@lrs, 'withRegistration')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^a typical clearState request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::ClearState.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end
