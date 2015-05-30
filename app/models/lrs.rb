# encoding: UTF-8
class Lrs
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :api_users
  has_many :statements
  has_many :documents
  has_many :states
  has_many :activity_profiles
  has_many :agent_profiles

  field :title
  field :description
  field :version, type: String, default: '1.0.1'

  validates :title, presence: true
  validates :description, presence: true

end
