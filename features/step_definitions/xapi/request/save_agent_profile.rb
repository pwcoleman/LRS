# encoding: UTF-8
module Request
  class SaveAgentProfile

    def self.build(lrs, type)
      request = {}
      case type
        when 'typical'
          request['resource'] = 'agents/profile'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
              'Content-Type' => 'application/octet-stream'
          }
          request['method'] = 'PUT'
          request['params'] = {
              'agent' => Property::Agent.build('typical'),
              'profileId' =>  'Agent profileId'
          }
          request['content'] = 'some content'
        when 'JSON'
          request['resource'] = 'agents/profile'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
              'Content-Type' => 'application/json'
          }
          request['method'] = 'PUT'
          request['params'] = {
              'agent' => Property::Agent.build('typical'),
              'profileId' =>  'Agent profileId'
          }
          request['content'] = Property::Content.build('JSON')
        when 'ifNoneMatch'
          request = SaveAgentProfile.build(lrs, 'typical')
          request['headers']['If-None-Match'] = '*'
      end
      request
    end

  end
end