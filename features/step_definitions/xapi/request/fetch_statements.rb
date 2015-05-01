# encoding: UTF-8
module Request
  class FetchStatements
    def self.build(lrs, type)
      request = {}

      case type
        when 'getStatement'
          request['resource'] = 'statements'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
          }
          request['method'] = 'GET'
          request['params'] = {
              'statementId' => nil
          }
        when 'getVoidedStatement'
          request['resource'] = 'statements'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
          }
          request['method'] = 'GET'
          request['params'] = {
              'voidedStatementId' => nil
          }
        when 'query'
          request['resource'] = 'statements'
          request['headers'] = {
              'X-Experience-API-Version' => lrs.version,
          }
          request['method'] = 'GET'
          request['params'] = {}
      end

      request
    end
  end
end