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

  private

  def check_actor
    errors.add(:statement, "Missing property actor in statement") if statement[:actor].nil?
  end

  def check_verb
    errors.add(:statement, "Missing property verb in statement") if statement[:verb].nil?
  end

  def check_object
    errors.add(:statement, "Missing property object in statement") if statement[:object].nil?
  end
end
