class Api::V1::LocationsController < ApplicationController
  def index 
    @location = MapquestFacade.get_coords(params[:location])
  end
end