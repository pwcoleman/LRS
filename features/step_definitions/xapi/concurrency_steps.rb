# encoding: UTF-8

When(/^the request is made on the primed LRS$/) do
  @context = @cluster['main']
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@user.username, @user.password)
  perform_request
end

