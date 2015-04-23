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
      success = false
      if value['id']
        begin
          uri = Addressable::URI.parse(value['id'])
          success = uri.scheme && uri.host && uri.to_s == value['id'] && uri
        rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
        end
      end
      record.errors[attribute] << (options[:message] || "Invalid verb ID") unless success
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
    unless value['id'] && value['id'] =~ /\A(urn:uuid:)?[\da-f]{8}-[\da-f]{4}-4[\da-f]{3}-[8 9 a b][\da-f]{3}-[\da-f]{12}\z/i
      record.errors[attribute] << (options[:message] || "Invalid StatementRef ID")
    end
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

  def check_inverse_functional_identifier(record, attribute, value)
    ids = value.select{|k, v| ['mbox', 'mbox_sha1sum', 'openid', 'account'].include?(k) }
    record.errors[attribute] << (options[:message] || "One and only one of mbox, mbox_sha1sum, openid, account may be suplied with an agent") unless ids.count == 1
  end

  def check_mbox(record, attribute, value)
    return unless value && value['mbox']
    unless value['mbox'] =~ /\Amailto:([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "mbox value [#{value['mbox']}] did not start with mailto:")
    end
  end

  def check_mbox_sha1sum(record, attribute, value)
    return unless value && value['mbox_sha1sum']
    unless value['mbox_sha1sum'] =~ /^[A-Fa-f0-9]{40}$/
      record.errors[attribute] << (options[:message] || "invalid agent mbox_sha1sum")
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
    unless value['account']['homePage']
      record.errors[attribute] << (options[:message] || "missing agent account home page")
    end

    unless value['account']['name']
      record.errors[attribute] << (options[:message] || "missing agent account name")
    end
  end

  def check_account_home_page(record, attribute, value)
    return unless value && value['account'] && value['account']['homePage']
    success = false
    base_uri = value['account']['homePage']
    begin
      uri = Addressable::URI.parse(base_uri)
      success = uri.scheme && uri.host && uri.to_s == base_uri && uri
    rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
    end
    record.errors[attribute] << (options[:message] || "invalid agent home page") unless success
  end

  def check_group_members(record, attribute, value)
    return unless value && value['objectType'] == 'Group'
    if value['member']
      value['member'].each do |member|
        check_mbox(record, attribute, member)
        check_mbox_sha1sum(record, attribute, value)
        check_openid(record, attribute, member)
        check_account_home_page(record, attribute, member)
        record.errors[attribute] << (options[:message] || "Invalid objectType") unless (['Agent', 'Group'].include?(member['objectType']))
      end
    end
  end

end
