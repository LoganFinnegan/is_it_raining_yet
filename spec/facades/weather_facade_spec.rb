require 'rails_helper'

RSpec.describe WeatherFacade, type: :facade do
  describe 'class methods' do
    it 'can get coords' do
      location = { lat: 39.74001, lng: -104.99202 }

      result   = WeatherFacade.get_weather(location[:lat], location[:lng])

      # expect(result).to be_a Location
      # expect(result.lat).to be_a Float
      # expect(result.lng).to be_a Float
    end
  end
end