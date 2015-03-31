class Lrs
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String


  validates :title, presence: true
  validates :description, presence: true
end
