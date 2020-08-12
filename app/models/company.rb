class Company < ApplicationRecord
  has_rich_text :description
  validates :email, email: true, allow_blank: true

  before_save :assign_city_and_state, if: :zip_code

  private

  def assign_city_and_state
    zip_data = ZipCodes.identify(zip_code)

    self.city = zip_data[:city]
    self.state = zip_data[:state_code]
  end
end
