class ObjectValidator < ActiveModel::EachValidator
  include CommonValidations

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
    success = validate_iri(value['id'])
    record.errors[attribute] << (options[:message] || "Invalid activity ID") unless success
    validate_activity_definition(record, attribute, value['definition'])
  end

  def validate_activity_definition(record, attribute, value)
    return if value.nil? or value.empty?
    if value['type']
      success = validate_iri(value['type'])
      record.errors[attribute] << (options[:message] || "Invalid activity definition type") unless success
    end
    if value['interactionType']
      record.errors[attribute] << (options[:message] || "Invalid activity definition interaction type") unless INTERACTION_TYPES.include?(value['interactionType'])
    end
    if value['moreInfo']
      success = validate_iri(value['moreInfo'])
      record.errors[attribute] << (options[:message] || "Invalid activity definition moreInfo") unless success
    end
  end

  def validate_agent(record, attribute, value)
    check_inverse_functional_identifier(record, attribute, value)
    check_mbox(record, attribute, value)
    check_mbox_sha1sum(record, attribute, value)
    check_openid(record, attribute, value)
    check_account(record, attribute, value)
    check_account_home_page(record, attribute, value)
  end

  def validate_group(record, attribute, value)
    check_inverse_functional_identifier(record, attribute, value)
    check_mbox(record, attribute, value)
    check_mbox_sha1sum(record, attribute, value)
    check_openid(record, attribute, value)
    check_account(record, attribute, value)
    check_account_home_page(record, attribute, value)
    check_group_members(record, attribute, value)
  end

  def validate_sub_statement(record, attribute, value)
    validate_sub_statement_actor(record, attribute, value['actor'])
    validate_sub_statement_verb(record, attribute, value['verb'])
    validate_sub_statement_object(record, attribute, value['object'])
  end

  def validate_sub_statement_actor(record, attribute, value)
    if value
      record.errors[attribute] << (options[:message] || "Invalid objectType") unless (value['objectType'].nil? || ['Agent', 'Group'].include?(value['objectType']))
      if value['objectType'] == 'Group'
        validate_group(record, attribute, value)
      else
        validate_agent(record, attribute, value)
      end
    else
      record.errors[attribute] << (options[:message] || "SubStatement missing actor")
    end
  end

  def validate_sub_statement_verb(record, attribute, value)
    if value
      record.errors[attribute] << (options[:message] || "Invalid verb ID") unless validate_iri(value['id'])
      #TODO: FIX THIS
      if value['display']
        record.errors[attribute] << (options[:message] || "Invalid verb display") unless value['display'].is_a?(Hash)
      end
    else
      record.errors[attribute] << (options[:message] || "SubStatement missing verb")
    end
  end

  def validate_sub_statement_object(record, attribute, value)
    if value
      record.errors[attribute] << (options[:message] || "Invalid objectType") unless (value['objectType'].nil? || ['Activity', 'Agent', 'Group', 'StatementRef'].include?(value['objectType']))
      case value['objectType']
        when 'Agent'
          validate_agent(record, attribute, value)
        when 'Group'
          validate_group(record, attribute, value)
        when 'StatementRef'
          validate_statement_ref(record, attribute, value)
        when 'Activity', nil
          validate_activity(record, attribute, value)
      end
    else
      record.errors[attribute] << (options[:message] || "SubStatement missing object")
    end
  end

  def validate_statement_ref(record, attribute, value)
    unless validate_uuid(value['id'])
      record.errors[attribute] << (options[:message] || "Invalid StatementRef ID")
    end
  end



end
