require 'rails_helper'

RSpec.describe WeatherService do
  it 'can make API call to database', :vcr do
    params = { q: '43.66659,-92.97298', days: 5 }
    query = WeatherService.call_db('/v1/forecast.json', params)

    expect(query).to be_an Hash

    current = query[:current]

    check_hash_structure(current, :last_updated, String)
    check_hash_structure(current, :temp_f, Float)
    check_hash_structure(current, :feelslike_f, Float)
    check_hash_structure(current, :humidity, Integer)
    check_hash_structure(current, :uv, Float)
    check_hash_structure(current, :vis_miles, Float)
    check_hash_structure(current[:condition], :text, String)
    check_hash_structure(current[:condition], :icon, String)
    # testing daily 
    daily = query[:forecast][:forecastday]
    
    daily.each do |day|
      check_hash_structure(day, :date, String)
      check_hash_structure(day[:astro], :sunrise, String)
      check_hash_structure(day[:astro], :sunset, String)
      check_hash_structure(day[:day], :maxtemp_f, Float)
      check_hash_structure(day[:day], :mintemp_f, Float)
      check_hash_structure(day[:day][:condition], :text, String)
      check_hash_structure(day[:day][:condition], :icon, String)
      # testing hourly  
      hourly = day[:hour]

      hourly.each do |hour|
        check_hash_structure(hour, :time, String)
        check_hash_structure(hour, :temp_f, Float)
        check_hash_structure(hour[:condition], :icon, String)
        check_hash_structure(hour[:condition], :text, String)
      end
    end
  end
end
