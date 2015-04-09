api = {
    'basic_key' => 'username',
    'basic_secret' => 'password'
}
FactoryGirl.define do
  factory :lrs do
    title 'First LRS'
    description 'This is the first LRS in the system'
    api api
  end

end
