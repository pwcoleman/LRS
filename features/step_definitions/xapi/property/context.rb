# encoding: UTF-8
module Property
  class Context

    def self.build(type)
      context = {}

      case type
        when 'typicalAgentInstructor'
          context['instructor'] = Property::Agent.build('typical')
        when 'mboxAndTypeAgentInstructor'
          context['instructor'] = Property::Agent.build('mboxAndType')
        when 'mboxSha1AndTypeAgentInstructor'
          context['instructor'] = Property::Agent.build('mboxSha1AndType')
        when 'openidAndTypeAgentInstructor'
          context['instructor'] = Property::Agent.build('openidAndType')
        when 'accountAndTypeAgentInstructor'
          context['instructor'] = Property::Agent.build('accountAndType')
        when 'typicalGroupTeam'
          context['team'] = Property::Group.build('typical')
        when 'statementOnly'
          context['statement'] = Property::StatementRef.build('typical')
        when 'extensionsOnly'
          context['extensions'] = Property::Extensions.build('typical')
        when 'emptyExtensionsOnly'
          context['extensions'] = Property::Extensions.build('empty')
        when 'emptyContextActivities'
          context['contextActivities'] = Property::ContextActivities.build('empty')
        when 'emptyContextActivitiesAllPropertiesEmpty'
          context['contextActivities'] = Property::ContextActivities.build('allPropertiesEmpty')
        when 'contextActivitiesAllPropertiesOnly'
          context['contextActivities'] = Property::ContextActivities.build('allProperties')
        when 'allProperties'
          context['registration'] = '16fd2706-8baf-433b-82eb-8c7fada847da'
          context['instructor'] = Property::Agent.build('typical')
          context['team'] = Property::Group.build('typical')
          context['contextActivities'] = Property::ContextActivities.build('allProperties')
          context['revision'] = 'test'
          context['platform'] = 'test'
          context['language'] = 'en-US'
          context['statement'] = Property::StatementRef.build('typical')
          context['extensions'] = Property::Extensions.build('typical')
      end

      context
    end
  end
end