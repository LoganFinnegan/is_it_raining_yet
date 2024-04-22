require 'rails_helper'

RSpec.describe MapquestService do
  it 'can make API call to database', :vcr do
    params = {location: "Austin,MN"}
    query = MapquestService.call_db('/geocoding/v1/address', params)[:results][0][:locations][0][:latLng]
    
    expect(query).to be_an Hash
    check_hash_structure(query, :lat, Float)
    check_hash_structure(query, :lng, Float)
  end
end