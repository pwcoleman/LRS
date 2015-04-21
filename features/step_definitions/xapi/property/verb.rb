# encoding: UTF-8
module Property
  class Verb
    def self.build(type)
      verb = {}
        case type
          when 'voiding'
            verb['id'] = 'http://adlnet.gov/expapi/verbs/voided'
            verb['display'] = {
                'en-US' => 'voided'
            }
          when 'typical'
            verb['id'] = 'http://tincanapi.com/conformancetest/verbid'
            verb['display'] = {
                'en-US' => 'test'
            }
          when 'idOnly'
            verb['id'] = 'http://tincanapi.com/conformancetest/verbid'
          when 'idAndDisplay'
            verb['id'] = 'http://tincanapi.com/conformancetest/verbid'
            verb['display'] = {
                'en-US' => 'test'
            }
          when 'forQuery'
            verb['id'] = 'http://tincanapi.com/conformancetest/verbid/forQuery'
            verb['display'] = {
                'en-US' => 'for query'
            }
        end
      verb
    end
  end
end