MBOX = 'mailto:conformancetest@tincanapi.com' unless MBOX
MBOX_SHA1SUM = 'db77b9104b531ecbb0b967f6942549d0ba80fda1' unless MBOX_SHA1SUM
OPENID = 'http://openid.tincanapi.com'  unless OPENID
MBOX_QUERY = 'mailto:conformancetest+query@tincanapi.com' unless MBOX_QUERY
MBOX_SHA1SUM_QUERY = '6954e807cfbfc5b375d185de32f05de269f93d6f' unless MBOX_SHA1SUM_QUERY
OPENID_QUERY = 'http://openid.tincanapi.com/query' unless OPENID_QUERY


def create_agent(type)
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
      agent['account'] = create_agent_account('typical')
      agent['objectType'] = 'Agent'
    when 'mboxOnly'
      agent['mbox'] = MBOX
    when 'mboxSha1Only'
      agent['mbox_sha1sum'] = MBOX_SHA1SUM
    when 'openidOnly'
      agent['openid'] = OPENID
    when 'accountOnly'
      agent['account'] = create_agent_account('typical')
    when 'forQueryMbox'
      agent['mbox'] = MBOX_QUERY
    when 'forQueryMboxSha1'
      agent['mbox_sha1sum'] = MBOX_SHA1SUM_QUERY
    when 'forQueryOpenid'
      agent['openid'] = OPENID_QUERY
    when 'forQueryAccount'
      agent['account'] = create_agent_account('forQuery')
  end

  agent
end