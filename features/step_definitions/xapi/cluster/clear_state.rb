# encoding: UTF-8
module Cluster
  class ClearState

    def self.build(lrs, type)
      request = {}

      case type
        when 'typical'
          request['type'] = :state
          request['primers'] = [
              FactoryGirl.create(:typical_state, lrs: lrs, state_id: 'http://tincanapi.com/conformancetest/statedoc/zero'),
              FactoryGirl.create(:typical_state, lrs: lrs, state_id: 'http://tincanapi.com/conformancetest/statedoc/one'),
              FactoryGirl.create(:typical_state, lrs: lrs, state_id: 'http://tincanapi.com/conformancetest/statedoc/two')
          ]
          request['main'] = Request::ClearState.build(lrs, 'typical')
          request['verify'] = Request::RetrieveStateIds.build(lrs, 'typical')
        when 'withRegistration'
          uuid = Property::UUID.build('good')
          request['type'] = :state
          request['primers'] = [
              FactoryGirl.create(:state_with_registration, lrs: lrs, registration: uuid, state_id: 'http://tincanapi.com/conformancetest/statedoc/zero'),
              FactoryGirl.create(:state_with_registration, lrs: lrs, registration: uuid, state_id: 'http://tincanapi.com/conformancetest/statedoc/one'),
              FactoryGirl.create(:state_with_registration, lrs: lrs, registration: uuid, state_id: 'http://tincanapi.com/conformancetest/statedoc/two')
          ]
          request['main'] = Request::ClearState.build(lrs, 'typical')
          request['verify'] = Request::RetrieveStateIds.build(lrs, 'typical')
      end

      request
    end

  end
end