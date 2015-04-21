class AgentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    check_inverse_functional_identifier(record, attribute, value)
    check_mbox(record, attribute, value)
    check_mbox_sha1sum(record, attribute, value)
    check_object_type(record, attribute, value)
    check_openid(record, attribute, value)
    check_account(record, attribute, value)
    check_account_home_page(record, attribute, value)
    check_group_members(record, attribute, value)
  end

  private

  def check_inverse_functional_identifier(record, attribute, value)
    return if value && (value['mbox'] || value['mbox_sha1sum'] || value['openid'] || value['account'])
    record.errors[attribute] << (options[:message] || "Agent missing inverse functional identifier")
  end

  def check_mbox(record, attribute, value)
    return unless value && value['mbox']
    unless value['mbox'] =~ /\Amailto:([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "invalid agent mbox")
    end
  end

  def check_mbox_sha1sum(record, attribute, value)
    return unless value && value['mbox_sha1sum']
    unless value['mbox_sha1sum'] =~ /^[A-Fa-f0-9]{40}$/
      record.errors[attribute] << (options[:message] || "invalid agent mbox_sha1sum")
    end
  end

  # TODO: WHAT ARE THE RUKES FOR THIS??
  def check_object_type(record, attribute, value)
    return unless value && value['objectType']
    unless value && value['objectType'] && (value['objectType'] == 'Agent' || value['objectType'] == 'Group')
      record.errors[attribute] << (options[:message] || "invalid agent object type")
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

  def check_account(record, attribute, value)
    return unless value && value['account']
    unless value['account']['homePage']
      record.errors[attribute] << (options[:message] || "missing agent account home page")
    end

    unless value['account']['name']
      record.errors[attribute] << (options[:message] || "missing agent account name")
    end

  end

  def check_group_members(record, attribute, value)
    return unless value && value['objectType'] == 'Group'
    if value['member']
      value['member'].each do |member|
        check_mbox(record, attribute, member)
        check_mbox_sha1sum(record, attribute, value)
        check_openid(record, attribute, member)
        check_account_home_page(record, attribute, member)
      end
    end
  end
end