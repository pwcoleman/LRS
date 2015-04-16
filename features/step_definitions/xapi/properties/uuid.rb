def create_uuid(type)
  case type
    when 'good'
      '39e24cc4-69af-4b01-a824-1fdc6ea8a3af'
    when 'bad'
      'bad-uuid'
    when 'unique'
      SecureRandom.uuid
  end
end