class AgentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    check_inverse_functional_identifier(record, attribute, value)
    check_mbox(record, attribute, value)
    check_object_type(record, attribute, value)
    check_openid(record, attribute, value)
    check_account(record, attribute, value)
    check_account_home_page(record, attribute, value)
  end

  private

  def check_inverse_functional_identifier(record, attribute, value)
    return if value['mbox'] || value['mbox_sha1sum'] || value['openid'] || value['account']
    record.errors[attribute] << (options[:message] || "Agent missing inverse functional identifier")
  end

  def check_mbox(record, attribute, value)
    return unless value['mbox']
    unless value['mbox'] =~ /\Amailto:([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "invalid agent mbox")
    end
  end

  def check_object_type(record, attribute, value)
    unless value['objectType'] && value['objectType'] == 'Agent'
      record.errors[attribute] << (options[:message] || "invalid agent object type")
    end
  end

  def check_openid(record, attribute, value)
    return unless value['openid']
    unless value['openid'] =~ /\A(urn:uuid:)?[\da-f]{8}-([\da-f]{4}-){3}[\da-f]{12}\z/i
      record.errors[attribute] << (options[:message] || "invalid agent openid")
    end
  end

  def check_account_home_page(record, attribute, value)
    return unless value['account'] && value['account']['homePage']
    success = false
    uri = value['account']['homePage']
    begin
      uri = Addressable::URI.parse(uri)
      success = uri.scheme && uri.host && uri.to_s == uri && uri
    rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
    end
    record.errors[attribute] << (options[:message] || "invalid agent home page") unless success
  end

  def check_account(record, attribute, value)
    return unless value['account']
    unless value['account']['homePage']
      record.errors[attribute] << (options[:message] || "missing agent account home page")
    end

    unless value['account']['name']
      record.errors[attribute] << (options[:message] || "missing agent account name")
    end

  end
end