require 'rails_helper'

RSpec.describe 'retrive weather for city', type: :request do
  describe 'happy path' do
    it 'it can request forecast by location' do

      forecast_params = { location: 'denver, co' }
      headers         = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }

      get '/api/v0/forecast', headers: headers, params: forecast_params
      
      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')
      expect(response.status).to eq(200)
      expect(response.body).to be_a String
      require 'pry'; binding.pry
    end
  end
end