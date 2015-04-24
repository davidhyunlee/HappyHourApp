class PhotosController < ApplicationController
  def create
    @business = Business.find(params[:business_id])
    @photo = @business.photos.new(photo_params)
    @photo.user_id = current_user.id

    if @photo.save
      redirect_to business_path(@business)
    else
      render business_path(@business)
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:photo, :caption)
    end
end
