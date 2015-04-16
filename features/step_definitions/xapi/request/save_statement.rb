# encoding: UTF-8
module Request
  class SaveStatement
    def self.build(lrs, type)
      request = {}

      case type
        when 'minimal'
          request['resource']  = 'statements'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
              'Content-Type' => 'application/json'
          }
          request['method'] = 'POST'
          request['params'] = {}
          request['content'] = Property::Statement.build('minimal')
        when 'typical'
          statement =  Property::Statement.build('typical')
          request['resource']  = 'statements'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
              'Content-Type' => 'application/json'
          }
          request['method'] = 'PUT'
          request['params'] = {'statementId' => statement['id']}
          request['content'] = statement
        when 'voiding'
          statement =  Property::Statement.build('voiding')
          request['resource']  = 'statements'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
              'Content-Type' => 'application/json'
          }
          request['method'] = 'PUT'
          request['params'] = {}
          request['content'] = statement
          # TODO COMPLETE THIS
      end
      request
    end
  end
end