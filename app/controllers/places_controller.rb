class PlacesController < ApplicationController
  def index
    @pagy, @places = pagy(Place.all, items: 4)
  end
end
