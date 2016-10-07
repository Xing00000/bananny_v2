class InHomeNanny < ApplicationRecord
	belongs_to :nanny

	has_many :images, :as => :imageable, :dependent => :destroy
	has_one :location, :as => :locationable, :dependent => :destroy

	accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :location, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :hope_baby_quantity, :number_of_baby_care
end
