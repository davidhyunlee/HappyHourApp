class User < ActiveRecord::Base
  has_many :reviews
  has_many :businesses, through: :photos
  has_many :businesses, through: :reviews
  has_secure_password
  mount_uploader :photo, ProfileUploader
end
