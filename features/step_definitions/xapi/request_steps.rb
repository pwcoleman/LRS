# encoding: UTF-8

def perform_get
  get "/xapi/#{@context['resource']}"
end

def perform_post
  if @context['content']
    body = @context['content'].merge(@context['params']).to_json
  else
    body = @context['params'].to_json
  end
  post "/xapi/#{@context['resource']}", body
end

def perform_put
  if @context['content']
    body = @context['content'].merge(@context['params']).to_json
  else
    body = @context['params'].to_json
  end
  put "/xapi/#{@context['resource']}", body
end

def perform_delete
  delete "/xapi/#{@context['resource']}"
end


When(/^the request is made$/) do
  case @context['method']
    when 'GET'
      perform_get
    when 'PUT'
      perform_put
    when 'POST'
      perform_post
    when 'DELETE'
      perform_delete
  end
end
