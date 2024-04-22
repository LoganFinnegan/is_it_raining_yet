class WeatherService					
  def self.call_db(url, params = {})		
    response = connection.get(url) do |request| 		
      request.params = params		
      request.params[:key] = Rails.application.credentials.weather[:key]		
    end		
    JSON.parse(response.body, symbolize_names: true)		
  end		
      
  private
      
  def self.connection		
    Faraday.new('http://api.weatherapi.com')		
  end
end