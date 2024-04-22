class Api::V0::ForecastController < ApplicationController
  def forecast
    lat_lon = MapquestFacade.get_coords(params[:location])
    forecast = WeatherFacade.get_weather(lat_lon.lat, lat_lon.lng)
    render json: ForecastSerializer.new(forecast, {params: { action: params["action"]}}), status: :ok
  end
end