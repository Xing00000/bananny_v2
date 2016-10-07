class Nanny < ApplicationRecord

	belongs_to :user, inverse_of: :nanny
	has_one :image, :as => :imageable, :dependent => :destroy

	has_many :nanny_zipcode_ships, :dependent => :destroy
  has_many :zipcodes, :through => :nanny_zipcode_ships

  has_many :nanny_preference_ships, :dependent => :destroy
  has_many :preferences, :through => :nanny_preference_ships

  has_many :schedule_settings, :dependent => :destroy
  has_many :nanny_charges, :dependent => :destroy

  has_many :nanny_qualification_ships, :dependent => :destroy
  has_many :qualifications, :through => :nanny_qualification_ships

  has_many :nanny_orther_qualification_ships, :dependent => :destroy
  has_many :orther_qualifications, :through => :nanny_orther_qualification_ships

  has_one :in_home_nanny, :dependent => :destroy

	accepts_nested_attributes_for :user
	accepts_nested_attributes_for :image, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :preferences, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for	:schedule_settings, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for	:nanny_charges, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for	:qualifications, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for	:orther_qualifications, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for	:in_home_nanny, :reject_if => :all_blank, :allow_destroy => true

end
