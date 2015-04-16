# encoding: UTF-8
module Property
  class Result

    def self.build(type)
      result = {}

      case type
        when 'scoreOnly'
          result['score'] = Property::Score.build('typical')
        when 'emptyScoreOnly'
          result['score'] = Property::Score.build('empty')
        when 'successOnly'
          result['success'] = true
        when 'completionOnly'
          result['completion'] = true
        when 'responseOnly'
          result['response'] = 'test'
        when 'durationOnly'
          result['duration'] = 'PT2H'
        when 'extensionsOnly'
          result['extensions'] = Property::Extensions.build('multiplePairs')
        when 'emptyExtensionsOnly'
          result['extensions'] = Property::Extensions.build('empty')
        when 'scoreAndSuccess'
          result['score'] = Property::Score.build('typical')
          result['success'] = true
        when 'scoreAndCompletion'
          result['score'] = Property::Score.build('typical')
          result['completion'] = true
        when 'scoreAndResponse'
          result['score'] = Property::Score.build('typical')
          result['response'] = 'test'
        when 'scoreAndDuration'
          result['score'] = Property::Score.build('typical')
          result['duration'] = 'PT2H'
        when 'successAndCompletion'
          result['success'] = true
          result['completion'] = true
        when 'successAndResponse'
          result['success'] = true
          result['response'] = 'test'
        when 'successAndDuration'
          result['success'] = true
          result['duration'] = 'PT2H'
        when 'completionAndResponse'
          result['completion'] = true
          result['response'] = 'test'
        when 'completionAndDuration'
          result['completion'] = true
          result['duration'] = 'PT2H'
        when 'responseAndDuration'
          result['response'] = 'test'
          result['duration'] = 'PT2H'
        when 'scoreSuccessAndCompletion'
          result['score'] = Property::Score.build('typical')
          result['success'] = true
          result['completion'] = true
        when 'scoreSuccessAndResponse'
          result['score'] = Property::Score.build('typical')
          result['success'] = true
          result['response'] = 'test'
        when 'scoreSuccessAndDuration'
          result['score'] = Property::Score.build('typical')
          result['success'] = true
          result['duration'] = 'PT2H'
        when 'scoreCompletionAndResponse'
          result['score'] = Property::Score.build('typical')
          result['completion'] = true
          result['response'] = 'test'
        when 'scoreCompletionAndDuration'
          result['score'] = Property::Score.build('typical')
          result['completion'] = true
          result['duration'] = 'PT2H'
        when 'scoreResponseAndDuration'
          result['score'] = Property::Score.build('typical')
          result['response'] = 'test'
          result['duration'] = 'PT2H'
        when 'successCompletionAndResponse'
          result['success'] = true
          result['completion'] = true
          result['response'] = 'test'
        when 'successCompletionAndDuration'
          result['success'] = true
          result['completion'] = true
          result['duration'] = 'PT2H'
        when 'successResponseAndDuration'
          result['success'] = true
          result['response'] = 'test'
          result['duration'] = 'PT2H'
        when 'completionResponseAndDuration'
          result['completion'] = true
          result['response'] = 'test'
          result['duration'] = 'PT2H'
        when 'scoreSuccessCompletionAndResponse'
          result['score'] = Property::Score.build('typical')
          result['success'] = true
          result['completion'] = true
          result['response'] = 'test'
        when 'scoreSuccessCompletionAndDuration'
          result['score'] = Property::Score.build('typical')
          result['success'] = true
          result['completion'] = true
          result['duration'] = 'PT2H'
        when 'successCompletionResponseAndDuration'
          result['success'] = true
          result['completion'] = true
          result['response'] = 'test'
          result['duration'] = 'PT2H'
        when 'allProperties'
          result['score'] = Property::Score.build('typical')
          result['success'] = true
          result['completion'] = true
          result['response'] = 'test'
          result['duration'] = 'PT2H'
          result['extensions'] = Property::Extensions.build('empty')
      end
      result
    end
  end
end
