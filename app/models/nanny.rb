class Nanny < ApplicationRecord
	belongs_to :user , inverse_of: :nanny

	accepts_nested_attributes_for :user
end
