module CommonValidations

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
    record.errors[attribute] << (options[:message] || "invalid agent openid") unless validate_iri(value['openid'])
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
    record.errors[attribute] << (options[:message] || "invalid agent home page") unless validate_iri(value['account']['homePage'])
  end

  def check_inverse_functional_identifier(record, attribute, value)
    return unless value and value.is_a?(Hash)
    ids = value.select{|k, v| ['mbox', 'mbox_sha1sum', 'openid', 'account'].include?(k) }
    record.errors[attribute] << (options[:message] || "One and only one of mbox, mbox_sha1sum, openid, account may be suplied with an agent") unless ids.count == 1
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

  def validate_uuid(value)
    value && value =~ /\A(urn:uuid:)?[\da-f]{8}-[\da-f]{4}-4[\da-f]{3}-[8 9 a b][\da-f]{3}-[\da-f]{12}\z/i
  end

  def validate_iri(value)
    success = false
    if value
      base_uri = value
      begin
        uri = Addressable::URI.parse(base_uri)
        success = uri.scheme && uri.host && uri.to_s == base_uri && uri
      rescue URI::InvalidURIError, Addressable::URI::InvalidURIError, TypeError
      end
    end
    success
  end
end