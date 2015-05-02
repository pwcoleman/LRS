# encoding: UTF-8
module Cluster
  class DeleteState

    def self.build(lrs, type)
      request = {}
      case type
        when 'typical'
          request['primers'] = [
              FactoryGirl.create(:typical_state, lrs: lrs)
          ]
          request['main'] = Request::DeleteState.build(lrs, 'typical')
          request['verify'] = Request::RetrieveState.build(lrs, 'typical')
        when 'withRegistration'
          uuid = Property::UUID.build('good')
          request['primers'] = [
              FactoryGirl.create(:state_with_registration, lrs: lrs, registration: uuid)
          ]
          request['main'] = Request::DeleteState.build(lrs, 'typical')
          request['main']['params']['registration'] = uuid
          request['verify'] = Request::RetrieveState.build(lrs, 'typical')
          request['verify']['params']['registration'] = uuid
      end
      request
    end
  end
end