class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.order("name").page(params[:page]).per_page(5)
  end


  def new
    @place = Place.new
  end


  def create
    @place = current_user.places.create(place_params)

      if @place.valid?
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
  end


  def show
    @place = Place.find_by_id(params[:id])
    if @place.blank?
      return render plain: 'Not Found', status: :not_found
    end

    @comment = Comment.new
    @photo = Photo.new
  end


  def edit
    @place = Place.find_by_id(params[:id])
    return render_not_found if @place.blank?

    if @place.user != current_user
      return render plain: 'Not Allowed!', status: :forbidden
    end
  end


  def update
    @place = Place.find_by_id(params[:id])
    return render_not_found if @place.blank?

    if @place.user != current_user
      return render plain: 'Not Allowed!', status: :forbidden
    end
    
    @place.update_attributes(place_params)

    if @place.valid?
      redirect_to place_path(@place)
    else
        render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @place = Place.find_by_id(params[:id])
    return render_not_found if @place.blank?

    if @place.user != current_user
      return render plain: 'Not Allowed!', status: :forbidden
    end

    @place.destroy
    redirect_to root_path
  end


  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
end