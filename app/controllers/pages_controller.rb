class PagesController < ApplicationController
	def index
    @businesses = Business.all
    @reviews = Review.all
	end

  def test
  end
end
