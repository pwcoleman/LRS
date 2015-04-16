# encoding: UTF-8
module Property
  class InteractionComponent
    def self.build(type)
      component = {}

      case type
        when 'typical'
          component['id'] = 'test'
        when 'idOnly'
          component['id'] = 'test'
        when 'allProperties'
          component['id'] = 'test'
          component['description'] = {
              'en-US' => 'test'
          }
      end
      component
    end
  end
end