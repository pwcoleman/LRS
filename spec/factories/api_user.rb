FactoryGirl.define do
  factory :api_user do
    lrs
    basic_key 'username'
    basic_secret 'password'
  end

end
