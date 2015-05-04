# encoding: UTF-8

Given(/^a \[(.*?)\] saveStatements request$/) do |type|
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::SaveStatements.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end
