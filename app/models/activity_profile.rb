class ActivityProfile
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :lrs

  field :profile, type: Hash, default: {}
end
