# encoding: UTF-8

When(/^the request is made$/) do
  perform_request
end

def perform_get
  get "/xapi/#{@context['resource']}", @context['params']
end

def perform_post
  if @context['content']
    body = @context['content']
    if @context['content'].is_a?(Hash)
      body = body.merge(@context['params'])
    end
  else
    body = @context['params']
  end
  post "/xapi/#{@context['resource']}#{build_url_parameters}", body.to_json
end

def perform_put
  if @context['content']
    body = @context['content']
    if body.is_a?(Hash)
      body = body.merge(@context['params'])
    end
  else
    body = @context['params']
  end
  put "/xapi/#{@context['resource']}#{build_url_parameters}", body.to_json
end

def perform_delete
  delete "/xapi/#{@context['resource']}", @context['params']
end

def perform_request
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

def build_url_parameters
  result = ''
  unless @context['params'] && @context['params'].empty?
    result = "?#{ @context['params'].to_param}"
  end
  result
end