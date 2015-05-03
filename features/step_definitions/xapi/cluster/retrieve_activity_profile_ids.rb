# encoding: UTF-8
module Cluster
  class RetrieveActivityProfileIds

    def self.build(lrs, type)
      request = {}

      case type
        when 'typical'
          request['primers'] = {
              'order' => 'parallel',
              'list' => [
                  FactoryGirl.create(:typical_activity_profile, lrs: lrs, profile_id: 'Activity profileId/zero'),
                  FactoryGirl.create(:typical_activity_profile, lrs: lrs, profile_id: 'Activity profileId/one'),
                  FactoryGirl.create(:typical_activity_profile, lrs: lrs, profile_id: 'Activity profileId/two')
              ]
          }
          request['main'] = Request::RetrieveActivityProfileIds.build(lrs, 'typical')
      end

      request

    end
  end
end