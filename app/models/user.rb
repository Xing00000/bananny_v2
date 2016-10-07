class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one :nanny, inverse_of: :user
  has_one :image, :as => :imageable, :dependent => :destroy
  has_many :locations, :as => :locationable, :dependent => :destroy

  accepts_nested_attributes_for :image, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :locations, :reject_if => :all_blank, :allow_destroy => true



  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :omniauth_providers => [:facebook]

  serialize :fb_raw_data

  def self.from_omniauth(auth)
     # Case 1: Find existing user by facebook uid
     user = User.find_by_fb_uid( auth.uid )
     if user
        user.fb_token = auth.credentials.token
        user.fb_raw_data = auth
        user.fb_pic = auth.info.image
        user.name = auth.info.name
        user.gender = auth.info.gender
        user.save!
       return user
     end

     # Case 2: Find existing user by email
     existing_user = User.find_by_email( auth.info.email )
     if existing_user
       existing_user.fb_uid = auth.uid
       existing_user.fb_token = auth.credentials.token
       existing_user.fb_raw_data = auth
       existing_user.fb_pic = auth.info.image
       existing_user.name = auth.info.name
       existing_user.gender = auth.info.gender
       existing_user.save!
       return existing_user
     end

     # Case 3: Create new password
     user = User.new
     user.fb_uid = auth.uid
     user.fb_token = auth.credentials.token
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.fb_raw_data = auth
     user.fb_pic = auth.info.image
     user.name = auth.info.name
     user.gender = auth.info.gender
     user.save!
     return user
   end
end
