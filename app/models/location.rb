class Location < ApplicationRecord
	belongs_to :locationable, :polymorphic => true
	belongs_to :zipcode

	# validates_presence_of :address
end
