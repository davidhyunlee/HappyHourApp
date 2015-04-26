class User < ActiveRecord::Base
  has_many :reviews
  has_many :businesses, through: :photos
  has_many :businesses, through: :reviews
  has_secure_password
  mount_uploader :photo, ProfileUploader

  def self.from_omniauth(auth)
    where({:provider => auth['provider'], :uid => auth['uid']}).first_or_initialize.tap do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.oauth_token = auth['credentials']['token']
      user.oauth_expires_at = Time.at(auth['credentials']['expires_at'])
      user.password = "dasdfa#{rand(12345)}"
      user.first_name = auth['info']['first_name']
      user.last_name = auth['info']['last_name']
      user.email = auth['info']['email']
      user.username = auth['info']['email']
      user.nickname = auth['info']['first_name']
      user.website = auth['info']['link']
      user.save!
    end
  end  
end