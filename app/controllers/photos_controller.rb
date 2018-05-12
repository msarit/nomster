class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    @place.photos.create(photo_params)
    
    if @place.photos.last.valid?
      redirect_to place_path(@place)
    else
      render plain: 'ERROR: No picture attached; click "Back" button to go back', status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:place_id])

    @photo = @place.photos.find(params[:id])
    @photo.destroy
    redirect_to place_path(@place)
  end

  private

  def photo_params
    params.require(:photo).permit(:picture, :caption, :place_id)
  end
end
