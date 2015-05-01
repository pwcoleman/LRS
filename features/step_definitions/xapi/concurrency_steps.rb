# encoding: UTF-8

When(/^the request is made on the primed LRS$/) do

  @context = @cluster['main']
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
  perform_request
end

