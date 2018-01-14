class City < ApplicationRecord
  def name_with_country_code
    "#{self.name}, #{self.country}"
  end
end
