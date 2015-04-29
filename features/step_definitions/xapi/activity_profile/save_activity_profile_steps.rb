# encoding: UTF-8
Given(/^a \[typical\] saveActivityProfile request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::SaveActivityProfile.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^a \[JSON\] saveActivityProfile request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::SaveActivityProfile.build(@lrs, 'JSON')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end


Given(/^the \[content\] is set to '\[test content\]'$/) do
  @context['content'] = 'test content'
end

Given(/^a typical saveActivityProfile request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::SaveActivityProfile.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end
