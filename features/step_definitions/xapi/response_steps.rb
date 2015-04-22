# encoding: UTF-8
Transform /^(-?\d+)$/ do |number|
  number.to_i
end

Then(/^the LRS responds with HTTP \[(\d+)\]$/) do |http|
  expect(last_response.status).to eq(http)
end

Then(/^the LRS responds with HTTP (\d+)$/) do |http|
  expect(last_response.status).to eq(http)
end

Then(/^the request was successful$/) do
  expect(last_response.status).to eq(200).or eq(204)
end

