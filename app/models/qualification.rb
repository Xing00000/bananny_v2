class Qualification < ApplicationRecord
	has_many :nanny_qualification_ships, :dependent => :destroy
  has_many :nannies, :through => :nanny_qualification_ships
end
