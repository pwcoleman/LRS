# encoding: UTF-8
module Cluster
  class RetrieveAgentProfileIds

    def self.build(lrs, type)
      request = {}

      case type
        when 'typical'
          request['primers'] = {
              'order' => 'parallel',
              'list' => [
                  FactoryGirl.create(:typical_agent_profile, lrs: lrs, profile_id: 'Agent profileId/zero'),
                  FactoryGirl.create(:typical_agent_profile, lrs: lrs, profile_id: 'Agent profileId/one'),
                  FactoryGirl.create(:typical_agent_profile, lrs: lrs, profile_id: 'Agent profileId/two')
              ]
          }
          request['main'] = Request::RetrieveAgentProfileIds.build(lrs, 'typical')
      end

      request
    end
  end
end