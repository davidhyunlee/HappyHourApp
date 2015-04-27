class Business < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :photos
  has_many :users, through: :reviews
  has_one :hour, dependent: :destroy

  def date_added
    created_at.localtime.strftime("%-m/%-d/%Y | %l:%M %p")
  end
end
