# encoding: UTF-8
Transform /^(-?\d+)$/ do |number|
  number.to_i
end

def create_about_context(type)
  case type
    when 'typical'
       {
          'resource' => 'about',
          'headers' => {
              'X-Experience-API-Version' => '1.0.1',
              'Authorization' => ''
          },
          'method' => 'GET'
      }
    when 'minimal'
      {
          'resource' => 'about',
          'method' => 'GET'
      }
  end
end

Given(/^a \[(.*?)\] about request$/) do |type|
  @context = create_about_context(type)
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
end

Given(/^the \[authority header\] is set to '\[(.*?)\]'$/) do |value|
  header('Authorization', value)
end

Given(/^the \[version header\] is set to '\[(.*?)\]'$/) do |version|
  header('X-Experience-API-Version', version)
end

Given(/^the \[resource\] is set to '\[(.*?)\]'$/) do |resource|
  @context['resource'] = resource
end

Given(/^the \[method\] is set to '\[(.*?)\]'$/) do |method|
  @context['method'] = method
end

Given(/^the \[authority header\] is deleted$/) do
  header('Authorization', nil)
end

Given(/^the \[version header\] is deleted$/) do
  header('X-Experience-API-Version', nil)
end

When(/^the request is made$/) do
  case @context['method']
    when 'GET'
      get "/xapi/#{@context['resource']}"
    when 'PUT'
      put "/xapi/#{@context['resource']}"
    when 'POST'
      post "/xapi/#{@context['resource']}"
    when 'DELETE'
      delete  "/xapi/#{@context['resource']}"
  end
end

Then(/^the LRS responds with HTTP \[(\d+)\]$/) do |http|
  expect(last_response.status).to eq(http)
end

Then(/^the response is a valid about response$/) do
  body = JSON.parse(last_response.body)
  expect(body['X-Experience-API-Version']).to eq('1.0.1')
end
