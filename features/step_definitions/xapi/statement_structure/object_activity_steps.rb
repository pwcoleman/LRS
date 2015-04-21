# encoding: UTF-8
Given(/^the statement object is changed to a \[idOnly\] activity$/) do
  @context['content']['object'] = Property::Activity.build('idOnly')
end

Given(/^the statement object is changed to a \[idAndObjectType\] activity$/) do
  @context['content']['object'] = Property::Activity.build('idAndObjectType')
end

Given(/^the statement object is changed to a \[idAndDefinition\] activity$/) do
  @context['content']['object'] = Property::Activity.build('idAndDefinition')
end

Given(/^the statement object is changed to a \[allProperties\] activity$/) do
  @context['content']['object'] = Property::Activity.build('allProperties')
end

Given(/^the statement object \[id\] is changed to '\[bad id\]'$/) do
  @context['content']['object']['id'] = 'bad id'
end

Given(/^the statement object \[objectType\] is changed to '\[notActivity\]'$/) do
  @context['content']['object']['objectType'] = 'notActivity'
end

Given(/^the statement object \[objectType\] is changed to '\[activity\]'$/) do
  @context['content']['object']['objectType'] = 'activity'
end

Given(/^the statement object \[definition type\] is changed to '\[bad IRI\]'$/) do
  @context['content']['object']['definition']['type'] = 'bad IRI'
end

Given(/^the statement object \[definition interactionType\] is changed to '\[bad interaction\]'$/) do
  @context['content']['object']['definition']['interactionType'] = 'bad interaction'
end

Given(/^the statement object \[definition moreInfo\] is changed to '\[bad IRL\]'$/) do
  @context['content']['object']['definition']['moreInfo'] = 'bad IRL'
end

Given(/^the statement object \[id\] is removed$/) do
  @context['content']['object'].delete('id')
end

Given(/^an activity saveStatement request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = Request::SaveStatement.build(@lrs, 'typical')
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^the statement object definition is set to a \[nameOnly\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('nameOnly')
end

Given(/^the statement object definition is set to a \[descriptionOnly\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('descriptionOnly')
end

Given(/^the statement object definition is set to a \[typeOnly\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('typeOnly')
end

Given(/^the statement object definition is set to a \[moreInfoOnly\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('moreInfoOnly')
end

Given(/^the statement object definition is set to a \[extensionsOnly\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('extensionsOnly')
end

Given(/^the statement object definition is set to a \[emptyExtensionsOnly\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('emptyExtensionsOnly')
end

Given(/^the statement object definition is set to a \[allProperties\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('allProperties')
end

Given(/^the statement object definition is set to a \[trueFalse\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('trueFalse')
end

Given(/^the statement object definition is set to a \[fillIn\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('fillIn')
end

Given(/^the statement object definition is set to a \[numeric\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('numeric')
end

Given(/^the statement object definition is set to a \[other\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('other')
end

Given(/^the statement object definition is set to a \[otherWithCorrectResponsesPattern\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('otherWithCorrectResponsesPattern')
end

Given(/^the statement object definition is set to a \[choice\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('choice')
end

Given(/^the statement object definition is set to a \[sequencing\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('sequencing')
end

Given(/^the statement object definition is set to a \[likert\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('likert')
end

Given(/^the statement object definition is set to a \[matching\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('matching')
end

Given(/^the statement object definition is set to a \[performance\] activityDefinition$/) do
  @context['content']['object']['definition'] = Property::ActivityDefinition.build('performance')
end
