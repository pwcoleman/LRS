# encoding: UTF-8
class Statement
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :lrs

  field :statement, type: Hash, default: {}
  field :active, type: Boolean, default: false
  field :voided, type: Boolean, default: false

  validates :lrs, presence: true
  validate :check_actor
  validate :check_verb
  validate :check_object

  set_callback(:validation, :before) do |document|
    unless document.statement[:id]
      document.statement[:id] = loop do
        token = SecureRandom.uuid
        break token unless Statement.where(:'statement.id' => token).any?
      end
    end
  end

  def actor
    statement[:actor]
  end

  def actor=(value)
    statement[:actor] = value
  end

  def verb
    statement[:verb]
  end

  def verb=(value)
    statement[:verb] = value
  end

  def object
    statement[:object]
  end

  def object=(value)
    statement[:object] = value
  end

  private

  def check_actor
    errors.add(:statement, "Missing property actor in statement") if actor.nil?
  end

  def check_verb
    errors.add(:statement, "Missing property verb in statement") if verb.nil?
  end

  def check_object
    errors.add(:statement, "Missing property object in statement") if object.nil?
  end
end
