class ContextValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    check_instructor(record, attribute, value)
    check_team(record, attribute, value)
    check_statement(record, attribute, value)
    check_language(record, attribute, value)
  end

  private

  def check_instructor(record, attribute, value)
    return unless value && value['instructor']
    # TODO: THIS SHOULD BE VALIDATED AS AN AGENT OR GROUP
    check_inverse_functional_identifier(record, attribute, value['instructor'])
  end

  def check_team(record, attribute, value)
    return unless value && value['team']
    # TODO: THIS SHOULD BE VALIDATED AS A GROUP
    check_inverse_functional_identifier(record, attribute, value['team'])
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
    unless value['language'].length > 1
      record.errors[attribute] << (options[:message] || "Invalid language")
    end
  end

  def check_inverse_functional_identifier(record, attribute, value)
    ids = value.select{|k, v| ['mbox', 'mbox_sha1sum', 'openid', 'account'].include?(k) }
    record.errors[attribute] << (options[:message] || "One and only one of mbox, mbox_sha1sum, openid, account may be suplied with an agent") unless ids.count == 1
  end
end