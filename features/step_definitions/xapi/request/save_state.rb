# encoding: UTF-8
module Request
  class SaveState

    def self.build(lrs, type)
      request = {}

      case type
        when 'typical'
          request['resource'] = 'activities/state'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
              'Content-Type' => 'application/octet-stream'
          }
          request['method'] = 'PUT'
          request['params'] = {
              'stateId' => 'http://tincanapi.com/conformancetest/statedoc',
              'activityId' => Property::Activity.build('typical')['id'],
              'agent' =>  Property::Agent.build('typical')
          }
          request['content'] = 'some content'
        when 'JSON'
          request['resource'] = 'activities/state'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
              'Content-Type' => 'application/json'
          }
          request['method'] = 'PUT'
          request['params'] = {
              'stateId' => 'http://tincanapi.com/conformancetest/statedoc',
              'activityId' => Property::Activity.build('typical')['id'],
              'agent' =>  Property::Agent.build('typical')
          }
          request['content'] = Property::Content.build('JSON')
        when 'withRegistration'
          request['resource'] = 'activities/state'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
              'Content-Type' => 'application/octet-stream'
          }
          request['method'] = 'PUT'
          request['params'] = {
              'stateId' => 'http://tincanapi.com/conformancetest/statedoc',
              'activityId' => Property::Activity.build('typical')['id'],
              'agent' =>  Property::Agent.build('typical'),
              'registration' => Property::UUID.build('good')
          }
          request['content'] = 'some content'

      end
      request
    end
  end

end