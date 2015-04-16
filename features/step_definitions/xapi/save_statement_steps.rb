# encoding: UTF-8

Given(/^a \[(.*?)\] saveStatement request$/) do |type|
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::SaveStatement.build(@lrs, type)
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^the \[content\] is set to '\[null\]'$/) do
  @context['content'] = nil
end

