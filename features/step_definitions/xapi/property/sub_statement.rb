# encoding: UTF-8
module Property
  class SubStatement

    def self.build(type)
      statement = {}

      case type
        when 'typical'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'mboxOnlyAgentActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('mboxOnly')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'mboxSha1OnlyAgentActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('mboxSha1Only')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'openidOnlyAgentActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('openidOnly')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'accountOnlyAgentActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('accountOnly')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'mboxAndTypeAgentActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('mboxAndType')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'mboxSha1AndTypeAgentActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('mboxSha1AndType')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'openidAndTypeAgentActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('openidAndType')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'accountAndTypeAgentActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('accountAndType')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'mboxAndTypeGroupActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Group.build('mboxAndType')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'mboxSha1AndTypeGroupActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Group.build('mboxSha1AndType')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'openidAndTypeGroupActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Group.build('openidAndType')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'accountAndTypeGroupActor'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Group.build('accountAndType')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'idOnlyVerb'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('idOnly')
          statement['object'] = Property::Activity.build('typical')
        when 'mboxOnlyAgentObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Agent.build('mboxOnly')
        when 'mboxSha1OnlyAgentObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Agent.build('mboxSha1Only')
        when 'openidOnlyAgentObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Agent.build('openidOnly')
        when 'accountOnlyAgentObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Agent.build('accountOnly')
        when 'mboxAndTypeAgentObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Agent.build('mboxAndType')
        when 'mboxSha1AndTypeAgentObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Agent.build('mboxSha1AndType')
        when 'openidAndTypeAgentObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Agent.build('openidAndType')
        when 'accountAndTypeAgentObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Agent.build('accountAndType')
        when 'mboxAndTypeGroupObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Group.build('mboxAndType')
        when 'mboxSha1AndTypeGroupObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Group.build('mboxSha1AndType')
        when 'openidAndTypeGroupObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Group.build('openidAndType')
        when 'accountAndTypeGroupObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Group.build('accountAndType')
        when 'allPropertiesTypicalAgentMemberGroupObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Group.build('allPropertiesTypicalAgentMember')
        when 'allPropertiesActivityObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('allProperties')
        when 'typicalStatementRefObject'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::StatementRef.build('typical')
        when 'allProperties'
          statement['objectType'] = 'SubStatement'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
          statement['result'] = Property::Result.build('typical')
          statement['context'] = Property::Context.build('typical')
      end
      statement
    end
  end
end