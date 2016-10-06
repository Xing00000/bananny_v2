class OrtherQualification < ApplicationRecord

	has_many :nanny_orther_qualification_ships, :dependent => :destroy
  has_many :nannies, :through => :nanny_orther_qualification_ships
end
