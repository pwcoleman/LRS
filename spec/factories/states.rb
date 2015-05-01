FactoryGirl.define do
  factory :typical_state, class: State do
    lrs
    state_id 'http://tincanapi.com/conformancetest/statedoc'
    activity_id 'http://tincanapi.com/conformancetest/activityid'
    identity_id 'http://tincanapi.com/conformancetest/activityid'
    agent ({
              'mbox' => 'mailto:conformancetest@tincanapi.com',
              'objectType' => 'Agent'
          })
  end

  factory :state_with_registration, class: State do
    lrs
    state_id 'http://tincanapi.com/conformancetest/statedoc'
    activity_id 'http://tincanapi.com/conformancetest/activityid'
    identity_id 'http://tincanapi.com/conformancetest/activityid'
    agent ({
              'mbox' => 'mailto:conformancetest@tincanapi.com',
              'objectType' => 'Agent'
          })
  end

end
