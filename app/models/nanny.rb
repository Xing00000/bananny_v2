class Nanny < ApplicationRecord

	belongs_to :user , inverse_of: :nanny
	has_one :image, :as => :imageable , :dependent => :destroy

	accepts_nested_attributes_for :user
	accepts_nested_attributes_for :image, :reject_if => :all_blank, :allow_destroy => true



end
