# encoding: UTF-8

Given(/^a \[(.*?)\] about request$/) do |type|
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::About.build(@lrs, type)
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
end

Given(/^the \[resource\] is set to '\[(.*?)\]'$/) do |resource|
  @context['resource'] = resource
end

Given(/^the \[method\] is set to '\[(.*?)\]'$/) do |method|
  @context['method'] = method
end

Then(/^the response is a valid about response$/) do
  body = JSON.parse(last_response.body)
  expect(body['X-Experience-API-Version']).to eq('1.0.1')
end
