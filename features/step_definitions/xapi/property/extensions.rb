# encoding: UTF-8
module Property
  class Extensions
    def self.build(type)
      extensions = {}

      case type
        when 'typical'
          extensions['http://id.tincanapi.com/extension/topic'] = 'Conformance Testing'
        when 'withObjectValue'
          extensions['http://id.tincanapi.com/extension/color'] = {
              model: 'RGB',
              value: '#FFFFFF'
          }
        when 'withIntegerValue'
          extensions['http://id.tincanapi.com/extension/starting-position'] = 1
        when 'multiplePairs'
          extensions['http://id.tincanapi.com/extension/topic'] = 'Conformance Testing'
          extensions['http://id.tincanapi.com/extension/color'] = {
              model: 'RGB',
              value: '#FFFFFF'
          }
          extensions['http://id.tincanapi.com/extension/starting-position'] = 1
        when 'invalidNonIRI'
          extensions['test'] = 'key not an IRI'
      end
      extensions
    end
  end
end