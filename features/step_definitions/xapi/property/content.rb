# encoding: UTF-8
module Property
  class Content
    def self.build(type)
      content = {}

      case type
        when 'JSON'
          content = {
              test: 'JSON content',
              obj: {
                  subObj: {
                      nested: 'content'
                  },
                  arr: [0, 1, 'str']
              },
              arr: [1.3, 'item', 3.1]
          }.to_json
        when 'string'
          content = 'some string of content'
        when 'emptyString'
          content = ''
        when 'languageMap'
          content['en-Us'] = 'Test Language Map'
      end

      content
    end
  end
end