module CommonValidations

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