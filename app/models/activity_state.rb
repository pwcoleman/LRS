class ActivityState
  include Mongoid::Document

  belongs_to :lrs

  field :state, type: Hash, default: {}

end
