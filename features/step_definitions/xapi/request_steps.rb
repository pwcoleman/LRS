# encoding: UTF-8

When(/^the request is made$/) do
  case @context['method']
    when 'GET'
      get "/xapi/#{@context['resource']}"
    when 'PUT'
      put "/xapi/#{@context['resource']}", @context['content'].to_json
    when 'POST'
      post "/xapi/#{@context['resource']}", @context['content'].to_json
    when 'DELETE'
      delete  "/xapi/#{@context['resource']}"
  end
end
