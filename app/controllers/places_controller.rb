class PlacesController < ApplicationController

def index
  @places = Place.order("RANDOM()").page(params[:page]).per_page(5)
end

end