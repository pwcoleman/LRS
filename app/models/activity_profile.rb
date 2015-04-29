# encoding: UTF-8
class ActivityProfile < Document

  field :profile_id, type: String

  validates :activity_id, presence: true
  validate :check_activity_id

  # create a new activity profile - this is the preferred way to create a new ActivityProfile
  def self.create_from(lrs, content_type, params)
    profile = ActivityProfile.new(lrs: lrs, content_type: content_type)
    profile.activity_id = params['activityId']
    profile.profile_id = params['profileId']
    profile.content = params
    profile.save
    profile
  end

  private

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
