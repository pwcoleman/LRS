# encoding: UTF-8
module Cluster
  class RetrieveState

    def self.build(lrs, type)
      request = {}
      case type
        when 'typical'
          request['type'] = State
          request['primers'] = [
              # Request::SaveState.build(lrs, 'typical')
            FactoryGirl.create(:typical_state, lrs: lrs)
          ]
          request['main'] = Request::RetrieveState.build(lrs, 'typical')
        when 'withRegistration'
          uuid = Property::UUID.build('good')
          request['type'] = State
          request['primers'] = [
              # Request::SaveState.build(lrs, 'typical')
              FactoryGirl.create(:state_with_registration, lrs: lrs, registration: uuid)
          ]
          request['main'] = Request::RetrieveState.build(lrs, 'typical')
          # request['primers'][0]['params']['registration'] = uuid
          request['main']['params']['registration'] = uuid
      end

      request
    end
  end
end