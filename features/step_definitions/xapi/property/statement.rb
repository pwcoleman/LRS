# encoding: UTF-8
module Property
  class Statement

    def self.build(type)
      statement = {}

      case type
        when 'minimal'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
        when 'typical'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
          statement['id'] = Property::UUID.build('unique')
          statement['timestamp'] = '2014-07-23T12:34:02-05:00'
        when 'voiding'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('voiding')
          statement['id'] = Property::UUID.build('unique')
        when 'attachment'
          statement['actor'] = Property::Agent.build('typical')
          statement['verb'] = Property::Verb.build('typical')
          statement['object'] = Property::Activity.build('typical')
          statement['attachments'] = [Property::Attachment.build('text')['statementMetadata']]
      end
      statement
    end
  end
end