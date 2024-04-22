class MapquestService					
  def self.call_db(url, params = {})		
    response = connection.get(url) do |request| 		
      request.params = params		
      request.params[:key] = Rails.application.credentials.mapquest[:key]		
    end		
    JSON.parse(response.body, symbolize_names: true)		
  end		
      
  private		
      
  def self.connection		
    Faraday.new('https://www.mapquestapi.com/geocoding')		
  end
end