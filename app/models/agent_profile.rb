# encoding: UTF-8
class AgentProfile < Document

  field :profile_id, type: String
  field :agent, type: Hash

  validates :profile_id, presence: true
  validates :agent, presence: true
  validates :agent, agent: true

  # create a new agent profile - this is the preferred way to create a new AgentProfile
  def self.create_from(lrs, content_type, params)
    profile = AgentProfile.new(lrs: lrs, content_type: content_type)
    profile.agent = params['agent'] if params['agent']
    profile.profile_id = params['profileId']
    profile.content = params

    profile.save
    profile
  end

end
