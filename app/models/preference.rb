class Preference < ApplicationRecord
	has_many :nanny_preference_ships
  has_many :nanny, :through => :nanny_preference_ships

end
