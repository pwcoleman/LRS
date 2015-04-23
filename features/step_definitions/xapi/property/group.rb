# encoding: UTF-8
module Property
  class Group
    MBOX = 'mailto:conformancetest-group@tincanapi.com'
    MBOX_SHA1SUM = '4e271041e78101311fb37284ef1a1d35c3f1db35'
    OPENID = 'http://group.openid.tincanapi.com'

    def self.build(type)
      group = {}

      case type
        when 'typical'
          group['mbox'] = MBOX
          group['objectType'] = 'Group'
        when 'mboxAndType'
          group['mbox'] = MBOX
          group['objectType'] = 'Group'
        when 'mboxSha1AndType'
          group['mbox_sha1sum'] = MBOX_SHA1SUM
          group['objectType'] = 'Group'
        when 'openidAndType'
          group['openid'] = OPENID
          group['objectType'] = 'Group'
        when 'accountAndType'
          group['account'] = Property::AgentAccount.build('typical')
          group['objectType'] = 'Group'
        when 'mboxTypeAndName'
          group['mbox'] = MBOX
          group['objectType'] = 'Group'
          group['name'] = 'test group'
        when 'mboxSha1TypeAndName'
          group['mbox_sha1sum'] = MBOX_SHA1SUM
          group['objectType'] = 'Group'
          group['name'] = 'test group'
        when 'openidTypeAndName'
          group['openid'] = OPENID
          group['objectType'] = 'Group'
          group['name'] = 'test group'
        when 'accountTypeAndName'
          group['account'] = Property::AgentAccount.build('typical')
          group['objectType'] = 'Group'
          group['name'] = 'test group'
        when 'mboxTypeAndMember'
          group['mbox'] = MBOX
          group['objectType'] = 'Group'
          group['member'] = [Property::Agent.build('typical')]
        when 'mboxSha1TypeAndMember'
          group['mbox_sha1sum'] = MBOX_SHA1SUM
          group['objectType'] = 'Group'
          group['member'] = [Property::Agent.build('typical')]
        when 'openidTypeAndMember'
          group['openid'] = OPENID
          group['objectType'] = 'Group'
          group['member'] = [Property::Agent.build('typical')]
        when 'accountTypeAndMember'
          group['account'] = Property::AgentAccount.build('typical')
          group['objectType'] = 'Group'
          group['member'] = [Property::Agent.build('typical')]
        when 'allPropertiesMboxAgentMember'
          group['mbox'] = MBOX
          group['objectType'] = 'Group'
          group['name'] = 'test group'
          group['member'] = [Property::Agent.build('mboxOnly')]
        when 'allPropertiesMboxSha1AgentMember'
          group['mbox'] = MBOX
          group['objectType'] = 'Group'
          group['name'] = 'test group'
          group['member'] = [Property::Agent.build('mboxSha1Only')]
        when 'allPropertiesOpenidAgentMember'
          group['mbox'] = MBOX
          group['objectType'] = 'Group'
          group['name'] = 'test group'
          group['member'] = [Property::Agent.build('openidOnly')]
        when 'allPropertiesAccountAgentMember'
          group['mbox'] = MBOX
          group['objectType'] = 'Group'
          group['name'] = 'test group'
          group['member'] = [Property::Agent.build('accountOnly')]
        when 'allPropertiesTypicalAgentMember'
          group['mbox'] = MBOX
          group['objectType'] = 'Group'
          group['name'] = 'test group'
          group['member'] = [Property::Agent.build('typical'), Property::Agent.build('typical')]
        when 'allPropertiesTwoTypicalAgentsMember'
          group['mbox'] = MBOX
          group['objectType'] = 'Group'
          group['name'] = 'test group'
          group['member'] = [Property::Agent.build('typical'), Property::Agent.build('typical')]
      end

      group
    end
  end
end