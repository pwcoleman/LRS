# encoding: UTF-8
module Cluster
  class RetrieveStateIds

    def self.build(lrs, type)
      request = {}

      case type
        when 'typical'
          request['type'] = State
          request['primers'] = [
              FactoryGirl.create(:typical_state, lrs: lrs, state_id: 'http://tincanapi.com/conformancetest/statedoc/zero'),
              FactoryGirl.create(:typical_state, lrs: lrs, state_id: 'http://tincanapi.com/conformancetest/statedoc/one'),
              FactoryGirl.create(:typical_state, lrs: lrs, state_id: 'http://tincanapi.com/conformancetest/statedoc/two')
          ]
          request['main'] = Request::RetrieveStateIds.build(lrs, 'typical')
        when 'withRegistration'
          uuid = Property::UUID.build('good')
          request['type'] = State
          request['primers'] = [
              FactoryGirl.create(:state_with_registration, lrs: lrs, registration: uuid, state_id: 'http://tincanapi.com/conformancetest/statedoc/zero'),
              FactoryGirl.create(:state_with_registration, lrs: lrs, registration: uuid, state_id: 'http://tincanapi.com/conformancetest/statedoc/one'),
              FactoryGirl.create(:state_with_registration, lrs: lrs, registration: uuid, state_id: 'http://tincanapi.com/conformancetest/statedoc/two')
          ]
          request['main'] = Request::RetrieveStateIds.build(lrs, 'typical')
          request['main']['params']['registration'] = uuid
      end

      request
    end

  end
end