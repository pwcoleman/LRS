# encoding: UTF-8
module Request
  class ClearState

    def self.build(lrs, type)
      request = {}
      case type
        when 'typical'
          request['resource'] = 'activities/state'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
          }
          request['method'] = 'DELETE'
          request['params'] = {
            'activityId' => Property::Activity.build('typical')['id'],
            'agent' => Property::Agent.build('typical')
          }
        when 'withRegistration'
          request['resource'] = 'activities/state'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
          }
          request['method'] = 'DELETE'
          request['params'] = {
              'activityId' => Property::Activity.build('typical')['id'],
              'agent' => Property::Agent.build('typical'),
              'registration' => Property::UUID.build('good')
          }
      end

      request
    end
  end
end