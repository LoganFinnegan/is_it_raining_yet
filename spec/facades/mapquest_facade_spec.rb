require 'rails_helper'

RSpec.describe MapquestFacade, type: :facade do
  describe 'class methods' do
    it 'can get coords' do
      location = 'Austin, MN'
      result   = MapquestFacade.get_coords(location)

      expect(result).to be_a Location
      expect(result.lat).to be_a Float
      expect(result.lng).to be_a Float
    end
  end
end