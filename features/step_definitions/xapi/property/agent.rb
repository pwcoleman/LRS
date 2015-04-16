# encoding: UTF-8
require_relative 'agent_account'
module Property
  class Agent
    MBOX = 'mailto:conformancetest@tincanapi.com'
    MBOX_SHA1SUM = 'db77b9104b531ecbb0b967f6942549d0ba80fda1'
    OPENID = 'http://openid.tincanapi.com'
    MBOX_QUERY = 'mailto:conformancetest+query@tincanapi.com'
    MBOX_SHA1SUM_QUERY = '6954e807cfbfc5b375d185de32f05de269f93d6f'
    OPENID_QUERY = 'http://openid.tincanapi.com/query'

    def self.build(type)
      agent = {}

      case type
        when 'typical'
          agent['mbox'] = MBOX
          agent['objectType'] = 'Agent'
        when 'mboxAndType'
          agent['mbox'] = MBOX
          agent['objectType'] = 'Agent'
        when 'mboxSha1AndType'
          agent['mbox_sha1sum'] = MBOX_SHA1SUM
          agent['objectType'] = 'Agent'
        when 'openidAndType'
          agent['openid'] = OPENID
          agent['objectType'] = 'Agent'
        when 'accountAndType'
          agent['account'] = Property::AgentAccount.build('typical')
          agent['objectType'] = 'Agent'
        when 'mboxOnly'
          agent['mbox'] = MBOX
        when 'mboxSha1Only'
          agent['mbox_sha1sum'] = MBOX_SHA1SUM
        when 'openidOnly'
          agent['openid'] = OPENID
        when 'accountOnly'
          agent['account'] = Property::AgentAccount.build('typical')
        when 'forQueryMbox'
          agent['mbox'] = MBOX_QUERY
        when 'forQueryMboxSha1'
          agent['mbox_sha1sum'] = MBOX_SHA1SUM_QUERY
        when 'forQueryOpenid'
          agent['openid'] = OPENID_QUERY
        when 'forQueryAccount'
          agent['account'] = Property::AgentAccount.build('forQuery')
      end
      agent
    end
  end
end