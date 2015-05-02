# encoding: UTF-8
module Request
  class DeleteAgentProfile

    def self.build(lrs, type)
      request = {}
      case type
        when 'typical'
          request['resource'] = 'agents/profile'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version
          }
          request['method'] = 'DELETE'
          request['params'] = {
              'agent' => Property::Agent.build('typical'),
              'profileId' =>  'Agent profileId'
          }
      end
      request
    end

  end
end