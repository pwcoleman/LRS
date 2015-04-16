# encoding: UTF-8
module Property
  class Timestamp

    def self.build(type)
      ts = ''
      case type
        when 'good'
          ts = '2014-07-23T12:34:02-05:00'
        when 'bad'
          ts = 'bad-timestamp'
      end
      ts
    end
  end
end