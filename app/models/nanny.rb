class Nanny < ApplicationRecord
	belongs_to :user , inverse_of: :nanny
	accepts_nested_attributes_for :user

	has_one :image, :as => :imageable
	accepts_nested_attributes_for :image



end
