class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :business
  mount_uploader :photo, PhotoUploader
end
