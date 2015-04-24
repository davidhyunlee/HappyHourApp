class Business < ActiveRecord::Base
  has_many :photos
  has_many :reviews
  has_many :users, through: :photos
  has_many :users, through: :reviews
  has_one :hour

  def date_added
    created_at.localtime.strftime("%-m/%-d/%Y | %l:%M %p")
  end
end
