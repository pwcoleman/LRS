# encoding: UTF-8
module Property
  class Activity

    def self.build(type)
      activity = {}

      case type
        when 'typical'
          activity['id'] = 'http://tincanapi.com/conformancetest/activityid'
          activity['objectType'] = 'Activity'
        when 'idOnly'
          activity['id'] = 'http://tincanapi.com/conformancetest/activityid'
        when 'idAndObjectType'
          activity['id'] = 'http://tincanapi.com/conformancetest/activityid'
          activity['objectType'] = 'Activity'
        when 'idAndDefinition'
          activity['id'] = 'http://tincanapi.com/conformancetest/activityid'
          activity['definition'] = Property::ActivityDefinition.build('typical')
        when 'allProperties'
          activity['id'] = 'http://tincanapi.com/conformancetest/activityid'
          activity['objectType'] = 'Activity'
          activity['definition'] = Property::ActivityDefinition.build('typical')
        when 'forQuery'
          activity['id'] = 'http://tincanapi.com/conformancetest/activityid'
          activity['definition'] = Property::ActivityDefinition.build('forQuery')
      end
      activity
    end
  end
end