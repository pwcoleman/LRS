# encoding: UTF-8
module Property
  class StatementRef

    def self.build(type)
      ref = {}

      case type
        when 'typical'
          ref['objectType'] = 'StatementRef'
          ref['id'] = '16fd2706-8baf-433b-82eb-8c7fada847da'
        when 'allProperties'
          ref['objectType'] = 'StatementRef'
          ref['id'] = '16fd2706-8baf-433b-82eb-8c7fada847da'
      end
      ref
    end
  end
end