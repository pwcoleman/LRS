# encoding: UTF-8
module Property
  class UUID

    def self.build(type)
      case type
        when 'good'
          return '39e24cc4-69af-4b01-a824-1fdc6ea8a3af'
        when 'bad'
          return 'bad-uuid'
        when 'unique'
          return SecureRandom.uuid
      end
    end
  end
end