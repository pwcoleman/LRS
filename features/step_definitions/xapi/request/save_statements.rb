# encoding: UTF-8
module Request
  class SaveStatements

    def self.build(lrs, type)
      request = {}
      case type
        when 'typical'
          request['resource']  = 'statements'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
              'Content-Type' => 'application/json'
          }
          request['method'] = 'POST'
          request['params'] = {}
          request['content'] = [
              Property::Statement.build('typical'),
              Property::Statement.build('minimal')]
      end
      request
    end
  end
end