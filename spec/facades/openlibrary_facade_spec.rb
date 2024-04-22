require 'rails_helper'

RSpec.describe OpenlibraryFacade, type: :facade do
  describe 'class methods' do
    it 'can search by place' do
      search = { q: "Austin, MN" }

      result = OpenlibraryFacade.find_books(search)

      # expect(result).to be_a Location
      # expect(result.lat).to be_a Float
      # expect(result.lng).to be_a Float
    end
  end
end