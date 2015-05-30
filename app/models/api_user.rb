class ApiUser
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :lrs

  field :name
  field :email
  field :basic_key
  field :basic_secret

  set_callback(:validation, :before) do |document|
    generate_keys
  end

  def generate_keys
    self.basic_key = SecureRandom.hex(20) unless basic_key
    self.basic_secret = SecureRandom.hex(20) unless basic_secret
  end

  def username
    basic_key
  end

  def password
    basic_secret
  end

end