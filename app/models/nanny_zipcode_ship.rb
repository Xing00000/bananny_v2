class NannyZipcodeShip < ApplicationRecord
	belongs_to :zipcode
	belongs_to :nanny
end
