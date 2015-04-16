# encoding: UTF-8
module Property
  class ActivityDefinition
    def self.build(type)
      definition = {}

      case type
        when 'nameOnly'
          definition['name'] = {
              'en-US' => 'test'
          }
        when 'descriptionOnly'
          definition['description'] = {
              'en-US' => 'test'
          }
        when 'typeOnly'
          definition['type'] = 'http://id.tincanapi.com/activitytype/unit-test'
        when 'moreInfoOnly'
          definition['moreInfo'] = 'https://github.com/adlnet/xAPI_LRS_Test'
        when 'extensionsOnly'
          definition['extensions'] = Property::Extensions.build('multiplePairs')
        when 'emptyExtensionsOnly'
          definition['extensions'] = Property::Extensions.build('empty')
        when 'allProperties'
          definition['name'] = {
              'en-US' => 'test'
          }
          definition['description'] = {
              'en-US' => 'test'
          }
          definition['type'] = 'http://id.tincanapi.com/activitytype/unit-test'
          definition['moreInfo'] = 'https://github.com/adlnet/xAPI_LRS_Test'
          definition['extensions'] = Property::Extensions.build('typical')

        # need individual interaction type definitions, we can't
        # use allProperties because not all types use all component lists
        when 'trueFalse'
          definition['interactionType'] = 'true-false'
        when 'fillIn'
          definition['interactionType'] = 'fill-in'
        when 'numeric'
          definition['interactionType'] = 'numeric'
        when 'other'
          definition['interactionType'] = 'other'
        when 'otherWithCorrectResponsesPattern'
          definition['interactionType'] = 'other'
          definition['correctResponsesPattern'] = ['test']
        when 'choice'
          definition['interactionType'] = 'choice'
          definition['choices'] = [Property::InteractionComponent.build('typical')]
        when 'sequencing'
          definition['interactionType'] = 'sequencing'
          definition['choices'] = [Property::InteractionComponent.build('typical')]
        when 'likert'
          definition['interactionType'] = 'likert'
          definition['scale'] = [Property::InteractionComponent.build('typical')]
        when 'matching'
          definition['interactionType'] = 'matching'
          definition['source'] = [Property::InteractionComponent.build('typical')]
          definition['target'] = [Property::InteractionComponent.build('typical')]
        when 'performance'
          definition['interactionType'] = 'performance'
          definition['steps'] = [Property::InteractionComponent.build('typical')]
        when 'forQuery'
          definition['name'] = {
              'en-US' => 'test'
          }
      end

      definition
    end
  end
end