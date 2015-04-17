# encoding: UTF-8
require "addressable/uri"

class State < Document

  field :state_id, type: String

  validates :activity_id, presence: true
  validates :agent, presence: true
  validates :agent, agent: true
  validates :identity_id, presence: true
  validates :agent, presence: true
  validate :check_registration
  validate :check_activity_id

  def self.create(lrs, content_type, params)
    # TODO: ADD SOME VALIDATION
    state = State.new(lrs: lrs, content_type: content_type)
    state.state_id = params['stateId']
    state.identity_id = params['stateId']
    state.activity_id = params['activityId']
    if params['agent']
      begin
        state.agent = JSON.parse(params['agent'])
      rescue
        state.agent = params['agent']
      end
    end
    state.registration = params['registration']
    state.content = params
    state.save
    state
  end

  private

  def check_registration
    if registration
      errors.add(:state, "Invalid registration") unless registration =~ /\A(urn:uuid:)?[\da-f]{8}-([\da-f]{4}-){3}[\da-f]{12}\z/i
    end
  end

  def check_activity_id
    if activity_id
      success = false
      begin
        uri = Addressable::URI.parse(activity_id)
        success = uri.scheme && uri.host && uri.to_s == activity_id && uri
      rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
      end
      errors.add(:state, "Invalid activity ID") unless success
    end
  end
end
