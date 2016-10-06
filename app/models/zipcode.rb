class Zipcode < ApplicationRecord
	has_many :nannies, :through => :nanny_zipcode_ships
  has_many :nanny_zipcode_ships
end