class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    record.errors.add(attribute, :invalid_email_format) if record[attribute].split("@").last != 'getmainstreet.com'
  end
end
