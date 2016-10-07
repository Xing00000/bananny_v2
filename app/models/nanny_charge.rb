class NannyCharge < ApplicationRecord
	belongs_to :nanny

	validates_presence_of :amount
end
