if @profile
  json.profileId @profile.profile_id
  json.agent @profile.agent
end
if @profiles
  json.array! @profiles.map(&:profile_id)
end