# encoding: UTF-8
module Request
  class RetrieveActivityProfile
    def self.build(lrs, type)
      request = {}
      request['resource'] = 'activities/profile'
      request['headers'] = {
          'X-Experience-API-Version' => lrs.version
      }
      request['method'] = 'GET'
      request['params'] = {
          'activityId' => Property::Activity.build('typical')['id'],
          'profileId' =>  'Activity profileId'
      }
      request
    end
  end
end