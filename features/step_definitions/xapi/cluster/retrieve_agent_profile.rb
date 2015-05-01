# encoding: UTF-8
module Cluster
  class RetrieveAgentProfile

    def self.build(lrs, type)
      request = {}

      case type
        when 'typical'
          request['primers'] = [
              FactoryGirl.create(:typical_agent_profile, lrs: lrs)
          ]
          request['main'] = Request::RetrieveAgentProfile.build(lrs, 'typical')
      end

      request
    end
  end
end