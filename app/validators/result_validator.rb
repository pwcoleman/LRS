class ResultValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return unless value
    if value['success']
      record.errors[attribute] << (options[:message] || "Invalid success value (true/false)") unless [true, false, 'true', 'false'].include?(value['success'])
    end
    if value['completion']
      record.errors[attribute] << (options[:message] || "Invalid completion value (true/false)") unless [true, false, 'true', 'false'].include?(value['completion'])
    end
    if value['score']
      record.errors[attribute] << (options[:message] || "Invalid score object") unless value['score'].is_a?(Hash)
    end
    if value['duration']
      # TODO CHACK THIS REGEX!!
      unless value['duration'] =~ /^P((\d+([\.,]\d+)?Y)?(\d+([\.,]\d+)?M)?(\d+([\.,]\d+)?W)?(\d+([\.,]\d+)?D)?)?(T(\d+([\.,]\d+)?H)?(\d+([\.,]\d+)?M)?(\d+([\.,]\d+)?S)?)?$/i
        record.errors[attribute] << (options[:message] || "Invalid duration")
      end
    end
  end
end