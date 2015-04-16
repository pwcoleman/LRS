# encoding: UTF-8
Given(/^a \[typical\] saveState request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::SaveState.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^a \[JSON\] saveState request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::SaveState.build(@lrs, 'JSON')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^a \[withRegistration\] saveState request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::SaveState.build(@lrs, 'withRegistration')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^a typical saveState request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the \[stateId parameter\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end
