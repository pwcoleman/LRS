# encoding: UTF-8
Given(/^a \[typical\] saveState request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = {
      'resource' => 'activities/state',
      'method' => 'PUT',
      'headers' => {
          'X-Experience-API-Version' => '1.0.1',
          'Content-Type' => 'application/octet-stream'
      },
      'params' => {
          'stateId' => 'http://tincanapi.com/conformancetest/statedoc',
          'activityId' => 'http://tincanapi.com/conformancetest/activityid',
          'agent' => create_agent('typical')
      },
      'content' => {}
  }
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^a \[JSON\] saveState request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = {
      'resource' => 'activities/state',
      'method' => 'PUT',
      'headers' => {
          'X-Experience-API-Version' => '1.0.1',
          'Content-Type' => 'application/json'
      },
      'params' => {
          'stateId' => 'http://tincanapi.com/conformancetest/statedoc',
          'activityId' => 'http://tincanapi.com/conformancetest/activityid',
          'agent' => create_agent('typical').to_json
      },
      'content' => {
          test: 'JSON content',
          obj: {
              subObj: {
                  nested: 'content'
              },
              arr: [0, 1, 'str']
          },
          arr: [1.3, 'item', 3.1]
      }
  }
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^a \[withRegistration\] saveState request$/) do
  @lrs = FactoryGirl.create(:lrs)
  @context = {
      'resource' => 'activities/state',
      'method' => 'PUT',
      'headers' => {
          'X-Experience-API-Version' => '1.0.1',
          'Content-Type' => 'application/octet-stream'
      },
      'params' => {
          'stateId' => 'http://tincanapi.com/conformancetest/statedoc',
          'activityId' => 'http://tincanapi.com/conformancetest/activityid',
          'agent' => create_agent('typical'),
          'registration' => '39e24cc4-69af-4b01-a824-1fdc6ea8a3af'
      },
      'content' => {}
  }
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end

Given(/^a typical saveState request$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the \[stateId parameter\] is removed$/) do
  pending # express the regexp above with the code you wish you had
end
