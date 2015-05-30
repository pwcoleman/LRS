# encoding: UTF-8

Given(/^a \[(.*?)\] saveStatement request$/) do |type|
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::SaveStatement.build(@lrs, type)
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end

Given(/^the \[content\] is set to '\[null\]'$/) do
  @context['content'] = nil
end

