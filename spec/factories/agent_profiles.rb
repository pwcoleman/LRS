FactoryGirl.define do

  factory :typical_agent_profile, class: AgentProfile do
    lrs
    agent ({
              'mbox' => 'mailto:conformancetest@tincanapi.com',
              'objectType' => 'Agent'
          })
    profile_id 'Agent profileId'
  end
end
