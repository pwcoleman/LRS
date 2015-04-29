# encoding: UTF-8
module Request
  class SaveActivityProfile

    def self.build(lrs, type)
      request = {}
      case type
        when 'typical'
          request['resource'] = 'activities/profile'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
              'Content-Type' => 'application/octet-stream'
          }
          request['method'] = 'PUT'
          request['params'] = {
              'activityId' => Property::Activity.build('typical')['id'],
              'profileId' =>  'Activity profileId'
          }
          request['content'] = 'some content'
        when 'JSON'
          request['resource'] = 'activities/profile'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
              'Content-Type' => 'application/json'
          }
          request['method'] = 'PUT'
          request['params'] = {
              'activityId' => Property::Activity.build('typical')['id'],
              'profileId' =>  'Activity profileId'
          }
          request['content'] = Property::Content.build('JSON')
        when 'ifNoneMatch'
          request = SaveActivityProfile.build(lrs, 'typical')
          request['headers']['If-None-Match'] = '*'
      end
      request
    end

  end
end