# encoding: UTF-8
Given(/^a minimal saveStatement request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::SaveStatement.build(@lrs, 'minimal')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^the statement id is changed to a unique UUID$/) do
  @context['content']['id'] = SecureRandom.uuid
end

Given(/^the statement id is changed to '\[bad id\]'$/) do
  @context['content']['id'] = 'bad id'
end

Given(/^the statement id is changed to '\[7396683c-0759-e411-b974-a0d3c123d81f\]'$/) do
  @context['content']['id'] = '7396683c-0759-e411-b974-a0d3c123d81f'
end

Given(/^the statement id is changed to '\[7396683c-0759-1411-c974-a0d3c123d81f\]'$/) do
  @context['content']['id'] = '7396683c-0759-1411-c974-a0d3c123d81f'
end
