class Statement
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :lrs

  field :statement, type: Hash, default: {}
  field :active, type: Boolean, default: false
  field :voided, type: Boolean, default: false

  validates :lrs, presence: true

  set_callback(:validation, :before) do |document|
    unless document.statement[:id]
      document.statement[:id] = loop do
        token = SecureRandom.uuid
        break token unless Statement.where(:'statement.id' => token).any?
      end
    end
  end
end
