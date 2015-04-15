class Document
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :lrs

  field :document_type, type: String
  field :identity_id, type: String
  field :activity_id, type: String
  field :agent, type: Hash
  field :registration, type: String
  field :sha, type: String
  field :content_type, type: String
  field :content, type: Hash
end
