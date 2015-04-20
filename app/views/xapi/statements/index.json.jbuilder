if @result
  json.merge!(@result.statement) if @result
elsif @results
  json.array! @results do |result|
    json.merge!(result.statement)
  end
end
