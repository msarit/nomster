class PlacesController < ApplicationController
end

def index
  @places = Place.all
end
