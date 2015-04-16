# encoding: UTF-8
module Property
  class Score

    def self.build(type)
      score = {}

      case type
        when 'typical'
          score['scaled '] = 1
        when 'scaledOnly'
          score['scaled '] = 1
        when 'rawOnly'
          score['raw '] = 100
        when 'minOnly'
          score['min'] = 0
        when 'maxOnly'
          score['max'] = 100
        when 'scaledAndRaw'
          score['scaled '] = 1
          score['raw '] = 100
        when 'scaledAndMin'
          score['scaled '] = 1
          score['min'] = 0
        when 'scaledAndMax'
          score['scaled '] = 1
          score['max'] = 100
        when 'rawAndMin'
          score['raw '] = 100
          score['min'] = 0
        when 'rawAndMax'
          score['raw '] = 100
          score['max'] = 100
        when 'minAndMax'
          score['min'] = 0
          score['max'] = 100
        when 'scaledRawAndMin'
          score['scaled '] = 1
          score['raw '] = 100
          score['min'] = 0
        when 'scaledRawAndMax'
          score['scaled '] = 1
          score['raw '] = 100
          score['max'] = 100
        when 'rawMinAndMax'
          score['raw '] = 100
          score['min'] = 0
          score['max'] = 100
        when 'allProperties'
          score['scaled '] = 1
          score['raw '] = 100
          score['min'] = 0
          score['max'] = 100
      end

      score
    end
  end
end