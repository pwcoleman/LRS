# encoding: UTF-8

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

Given(/^the \[resource\] is set to '\[(.*?)\]'$/) do |resource|
  @context['resource'] = resource
end

Given(/^the \[method\] is set to '\[(.*?)\]'$/) do |method|
  @context['method'] = method
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


Then(/^the response is a valid about response$/) do
  body = JSON.parse(last_response.body)
  expect(body['X-Experience-API-Version']).to eq('1.0.1')
end
