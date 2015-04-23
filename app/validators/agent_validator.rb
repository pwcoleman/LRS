class AgentValidator < ActiveModel::EachValidator
  include CommonValidations

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

  # TODO: WHAT ARE THE RUKES FOR THIS??
  def check_object_type(record, attribute, value)
    return unless value && value['objectType']
    unless value && value['objectType'] && (value['objectType'] == 'Agent' || value['objectType'] == 'Group')
      record.errors[attribute] << (options[:message] || "invalid agent object type")
    end
  end

end