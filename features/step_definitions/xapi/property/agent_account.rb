# encoding: UTF-8
module Property
  class AgentAccount

    HOMEPAGE = 'https://tincanapi.com'

    def self.build(type)
      agent_account = {}
      case type
        when 'typical'
          agent_account['name'] = 'test'
          agent_account['homePage'] = HOMEPAGE
        when 'consumer'
          agent_account['homePage'] = HOMEPAGE + '/OAuth/Token'
          agent_account['name'] = 'oauth_consumer_x75db'
        when 'allProperties'
          agent_account['name'] = 'test'
          agent_account['homePage'] = HOMEPAGE
        when 'forQuery'
          agent_account['name'] = 'forQuery'
          agent_account['homePage'] = HOMEPAGE
      end
      agent_account
    end
  end
end