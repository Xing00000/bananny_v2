class Image < ApplicationRecord
	belongs_to :imageable, :polymorphic => true

	mount_uploader :image, ImageUploader

	validates_presence_of :image
end
