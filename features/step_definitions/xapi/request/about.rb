# encoding: UTF-8
module Request
  class About

    def self.build(lrs, type)
      request = {}
      case type
        when 'typical'
          request['resource'] = 'about'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
          }
          request['method'] = 'GET'
        when 'minimal'
          request['resource'] = 'about'
          request['method'] = 'GET'
      end
      request
    end
  end
end