class ObjectValidator < ActiveModel::EachValidator
  INTERACTION_TYPES = ['choice', 'sequencing', 'likert', 'matching', 'performance', 'true-false', 'fill-in', 'long-fill-in', 'numeric', 'other']

  def validate_each(record, attribute, value)
    if value
      case value['objectType']
        when 'Activity', nil
          validate_activity(record, attribute, value)
        when 'Agent'
          validate_agent(record, attribute, value)
        when 'Group'
          validate_group(record, attribute, value)
        when 'SubStatement'
          validate_sub_statement(record, attribute, value)
        when 'StatementRef'
          validate_statement_ref(record, attribute, value)
        else
          record.errors[attribute] << (options[:message] || "Invalid objectType")
      end
    end
  end

  private


  def validate_activity(record, attribute, value)
    return unless value
    success = false
    success = validate_uri(value['id'])
    record.errors[attribute] << (options[:message] || "Invalid activity ID") unless success
    validate_activity_definition(record, attribute, value['definition'])
  end

  def validate_activity_definition(record, attribute, value)
    return if value.nil? or value.empty?
    if value['type']
      success = validate_uri(value['type'])
      record.errors[attribute] << (options[:message] || "Invalid activity definition type") unless success
    end
    if value['interactionType']
      record.errors[attribute] << (options[:message] || "Invalid activity definition interaction type") unless INTERACTION_TYPES.include?(value['interactionType'])
    end
    if value['moreInfo']
      success = validate_uri(value['moreInfo'])
      record.errors[attribute] << (options[:message] || "Invalid activity definition moreInfo") unless success
    end
  end

  def validate_agent(record, attribute, value)

  end

  def validate_group(record, attribute, value)

  end

  def validate_sub_statement(record, attribute, value)

  end

  def validate_statement_ref(record, attribute, value)

  end

  def validate_uri(value)
    success = false
    if value
      begin
        uri = Addressable::URI.parse(value)
        success = uri.scheme && uri.host && uri.to_s == value && uri
      rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
      end
    end
    success
  end

end
