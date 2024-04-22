class MapquestFacade
  def self.get_coords(location)
    params   = { location: location }
    response = MapquestService.call_db("/geocoding/v1/address", params)[:results][0][:locations][0][:latLng]
    Location.new(response)
  end
end