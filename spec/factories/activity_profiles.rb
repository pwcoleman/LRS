FactoryGirl.define do

  factory :typical_activity_profile, class: ActivityProfile do
    lrs
    activity_id 'http://tincanapi.com/conformancetest/activityid'
    profile_id 'Activity profileId'
  end

end
