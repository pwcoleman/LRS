# encoding: UTF-8
require "addressable/uri"

class Statement
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :lrs

  field :statement, type: Hash, default: {}
  field :active, type: Boolean, default: false
  field :voided, type: Boolean, default: false
  field :statement_id, type: String
  field :actor, type: Hash
  field :verb, type: Hash
  field :object, type: Hash
  field :context, type: Hash
  field :result, type: Hash

  index({ statement_id: 1 }, { unique: true, name: "statement_id_index" })

  validates :lrs, presence: true
  validate :check_actor
  validate :check_verb
  validate :check_object
  validate :check_statement_id
  validate :check_timestamp
  validates :actor, actor: true
  validates :object, object: true
  validates :context, context: true
  validates :result, result: true

  scope :voided, ->{ where(voided: true) }
  scope :unvoided, ->{ where(voided: false) }
  scope :by_activity, ->(id) { where('object.objectType' => 'Activity', 'object.id' => id) }
  scope :by_verb, ->(id) { where('verb.id' => id) }
  scope :since_date, ->(date) { where(:created_at.gte => date) }
  scope :until_date, ->(date) { where(:created_at.lte => date) }


  set_callback(:validation, :before) do |document|
    unless document.statement[:id]
      document.statement[:id] = loop do
        token = SecureRandom.uuid
        break token unless Statement.where(:'statement.id' => token).any?
      end
    end
    unless statement_id
      document.statement[:id].downcase!
      document.statement_id = document.statement[:id]
    end
  end

  # create a new statement - this is the preferred way to create a new Statement
  def self.create_from(lrs, params)
    statement = Statement.new(lrs: lrs)
    statement.statement = params
    statement.statement['stored'] = Time.now
    statement.statement['timestamp'] = statement.statement['stored'].iso8601 unless statement.statement['timestamp']
    statement.actor = params['actor']
    statement.verb = params['verb']
    statement.object = params['object']
    statement.context = params['context'] if params['context']
    statement.result = params['result'] if params['result']

    statement.save
    statement
  end

  private

  def check_actor
    errors.add(:statement, "Missing property actor in statement") if actor.nil?
  end

  def check_verb
    errors.add(:statement, "Missing property verb in statement") if verb.nil?
    return if verb.nil?
    success = false
    if verb['id']
      begin
        uri = Addressable::URI.parse(verb['id'])
        success = uri.scheme && uri.host && uri.to_s == verb['id'] && uri
      rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
      end
    end
    errors.add(:statement, "Invalid verb ID") unless success
    #TODO: FIX THIS
    if verb['display']
      errors.add(:statement, "Invalid verb ID") unless verb['display'].is_a?(Hash)
    end
  end

  def check_object
    errors.add(:statement, "Missing property object in statement") if object.nil?
  end

  def check_statement_id
    errors.add(:statement, "Invalid statement ID") unless statement[:id] =~ /\A(urn:uuid:)?[\da-f]{8}-[\da-f]{4}-4[\da-f]{3}-[8 9 a b][\da-f]{3}-[\da-f]{12}\z/i
  end

  def check_timestamp
    errors.add(:statement, "Invalid timestamp in statement") if statement['timestamp'].nil?
    errors.add(:statement, "Invalid timestamp in statement: #{statement['timestamp']}") unless statement['timestamp'] =~ /^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24\:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|((?!-0{2}(:0{2})?)([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?)?$/
  end

end
