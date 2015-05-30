# encoding: UTF-8

Given(/^a \[(.*?)\] saveStatements request$/) do |type|
  @user = FactoryGirl.create(:api_user)
  @lrs = @user.lrs
  @context = Request::SaveStatements.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
end
