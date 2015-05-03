# encoding: UTF-8
module Request
  class RetrieveAgentProfileIds

    def self.build(lrs, type)
      request = {}

      case type
        when 'typical'
          request['resource'] = 'agents/profile'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
          }
          request['method'] = 'GET'
          request['params'] = {
              'agent' => Property::Agent.build('typical')
          }
      end

      request
    end
  end
end