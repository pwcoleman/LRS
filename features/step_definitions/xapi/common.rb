MBOX = 'mailto:conformancetest@tincanapi.com'
MBOX_SHA1SUM = 'db77b9104b531ecbb0b967f6942549d0ba80fda1'
OPENID = 'http://openid.tincanapi.com'
MBOX_QUERY = 'mailto:conformancetest+query@tincanapi.com'
MBOX_SHA1SUM_QUERY = '6954e807cfbfc5b375d185de32f05de269f93d6f'
OPENID_QUERY = 'http://openid.tincanapi.com/query'


def create_agent(type)
  agent = {}

  case type
    when 'typical'
      agent['mbox'] = MBOX
      agent['objectType'] = 'Agent'
  end


  agent
end