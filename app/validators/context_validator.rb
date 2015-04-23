class ContextValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    check_registration(record, attribute, value)
    check_instructor(record, attribute, value)
    check_team(record, attribute, value)
    check_statement(record, attribute, value)
    check_language(record, attribute, value)
    check_context_activites(record, attribute, value)
    check_extensions(record, attribute, value)
  end

  private

  def check_registration(record, attribute, value)
    return unless value && value['registration']
    unless value['registration'] && value['registration'] =~ /\A(urn:uuid:)?[\da-f]{8}-[\da-f]{4}-4[\da-f]{3}-[8 9 a b][\da-f]{3}-[\da-f]{12}\z/i
      record.errors[attribute] << (options[:message] || "Invalid registration")
    end
  end

  def check_instructor(record, attribute, value)
    return unless value && value['instructor']
    if value['instructor'].is_a?(Hash)
      # TODO: THIS SHOULD BE VALIDATED AS AN AGENT OR GROUP
      check_inverse_functional_identifier(record, attribute, value['instructor'])
      check_agent_object_type(record, attribute, value['instructor'])
      check_mbox(record, attribute, value['instructor'])
      check_openid(record, attribute, value['instructor'])
      check_account(record, attribute, value['instructor'])
      check_account_home_page(record, attribute, value['instructor'])
    else
      record.errors[attribute] << (options[:message] || "Agent in Context instructor is not a properly formatted dictionary")
    end
  end

  def check_team(record, attribute, value)
    return unless value && value['team']
    # TODO: THIS SHOULD BE VALIDATED AS A GROUP
    check_inverse_functional_identifier(record, attribute, value['team'])
    check_group_object_type(record, attribute, value['team'])
    check_mbox(record, attribute, value['team'])
  end

  def check_statement(record, attribute, value)
    return unless value && value['statement']
    unless value['statement']['objectType'] && value['statement']['objectType'] == 'StatementRef'
      record.errors[attribute] << (options[:message] || "objectType must be set to StatementRef")
    end
    unless value['statement']['id'] && value['statement']['id'] =~ /\A(urn:uuid:)?[\da-f]{8}-[\da-f]{4}-4[\da-f]{3}-[8 9 a b][\da-f]{3}-[\da-f]{12}\z/i
      record.errors[attribute] << (options[:message] || "Invalid statement ID")
    end
  end

  def check_language(record, attribute, value)
    # TODO: CHECK LANGUAGE VALUES
    return unless value && value['language']
    languages = ['en-us']
    unless languages.include?(value['language'].downcase)
      record.errors[attribute] << (options[:message] || "Invalid language")
    end
  end

  def check_context_activites(record, attribute, value)
    return unless value && value['contextActivities']
    types = ['parent', 'grouping', 'category', 'other']
    types.each do |type|
      activities = value['contextActivities'][type]
      if activities
        activities.each do |activity|
          record.errors[attribute] << (options[:message] || "#{type} objectType must be set to Activity") unless activity['objectType'] == 'Activity'
          success = false
          base_uri = activity['id']
          begin
            uri = Addressable::URI.parse(base_uri)
            success = uri.scheme && uri.host && uri.to_s == base_uri && uri
          rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
          end
          record.errors[attribute] << (options[:message] || "#{type} : invalid activity ID") unless success
        end
      end
    end
  end

  def check_extensions(record, attribute, value)
    return unless value && value['extensions']
    value['extensions'].keys.each do |key|
      success = false
      base_uri = key
      begin
        uri = Addressable::URI.parse(base_uri)
        success = uri.scheme && uri.host && uri.to_s == base_uri && uri
      rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
      end
      record.errors[attribute] << (options[:message] || "context with value key was not a valid URI") unless success
    end
  end

  def check_inverse_functional_identifier(record, attribute, value)
    return unless value and value.is_a?(Hash)
    ids = value.select{|k, v| ['mbox', 'mbox_sha1sum', 'openid', 'account'].include?(k) }
    record.errors[attribute] << (options[:message] || "One and only one of mbox, mbox_sha1sum, openid, account may be suplied with an agent") unless ids.count == 1
  end

  def check_mbox(record, attribute, value)
    return unless value && value['mbox']
    unless value['mbox'] =~ /\Amailto:([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "mbox value [#{value['mbox']}] did not start with mailto:")
    end
  end

  def check_agent_object_type(record, attribute, value)
    return unless value && value['objectType']
    unless value && value['objectType'] && value['objectType'] == 'Agent'
      record.errors[attribute] << (options[:message] || "invalid agent object type")
    end
  end

  def check_group_object_type(record, attribute, value)
    return unless value && value['objectType']
    unless value && value['objectType'] && value['objectType'] == 'Group'
      record.errors[attribute] << (options[:message] || "invalid group object type")
    end
  end

  def check_openid(record, attribute, value)
    return unless value && value['openid']
    success = false
    base_uri = value['openid']
    begin
      uri = Addressable::URI.parse(base_uri)
      success = uri.scheme && uri.host && uri.to_s == base_uri && uri
    rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
    end
    record.errors[attribute] << (options[:message] || "invalid agent openid") unless success
  end

  def check_account(record, attribute, value)
    return unless value && value['account']
    unless value['account']['name']
      record.errors[attribute] << (options[:message] || "missing agent account name")
    end
  end

  def check_account_home_page(record, attribute, value)
    return unless value && value['account']
    unless value['account']['homePage']
      record.errors[attribute] << (options[:message] || "missing agent account home page")
      return
    end
    success = false
    base_uri = value['account']['homePage']
    begin
      uri = Addressable::URI.parse(base_uri)
      success = uri.scheme && uri.host && uri.to_s == base_uri && uri
    rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
    end
    record.errors[attribute] << (options[:message] || "invalid agent home page") unless success
  end
end