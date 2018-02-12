class PlacesController < ApplicationController

def index
  @places = Place.order("RANDOM()").page(params[:page]).per_page(5)
end

def new
  @place = Place.new
  end

def create
  place.create(place_params)
  redirect_to root_path
end

private

def place_params
  param.require(:place).permit(:name, :description, :address)
end

end