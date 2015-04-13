# encoding: UTF-8
class Lrs
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :statements
  has_many :activity_states

  field :title
  field :description
  field :api, type: Hash

  validates :title, presence: true
  validates :description, presence: true

  set_callback(:validation, :before) do |document|
    unless document.api
      document.api = {
          basic_key: SecureRandom.hex(20),
          basic_secret: SecureRandom.hex(20)
      }
    end
  end

  def username
    api[:basic_key]
  end

  def password
    api[:basic_secret]
  end

end
