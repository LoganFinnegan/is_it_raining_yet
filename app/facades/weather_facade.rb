class WeatherFacade 
  def self.get_weather(lat, lng)
    params = { q: "#{lat},#{lng}" }
    response = WeatherService.call_db('/v1/forecast.json', params)
    Forecast.new(current(response), daily(response), hourly(response))
  end

  def self.current(response)
    CurrentWeather.new(response[:current])
  end

  def self.daily(response)
    daily = response[:forecast][:forecastday]
    daily[0..4].map { |day| DailyWeather.new(day) }
  end

  def self.hourly(response)
    daily = response[:forecast][:forecastday]
    hourly = daily[0][:hour]
    hourly[0..7].map { |hour| HourlyWeather.new(hour) }
  end
end