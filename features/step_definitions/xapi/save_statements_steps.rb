# encoding: UTF-8
def create_save_statements_context
  context = {
      'resource' => 'statements',
      'method' => 'POST',
      'headers' => {
          'X-Experience-API-Version' => '1.0.1',
          'Content-Type' => 'application/json'
      },
      'params' => {},
      'content' => [
          create_minimal_statement,
          create_typical_statement(SecureRandom.uuid)
      ]
  }
end

Given(/^a \[(.*?)\] saveStatements request$/) do |type|
  @lrs = FactoryGirl.create(:lrs)
  @context = create_save_statements_context
  pp @context
  if @context['headers']
    @context['headers'].each_pair do |key, value|
      header(key, value) if value
    end
  end
  basic_authorize(@lrs.api['basic_key'], @lrs.api['basic_secret'])
end
