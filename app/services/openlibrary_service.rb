class OpenlibraryService					
  def self.call_db(url, params = {})	
  	# require 'pry'; binding.pry
    response = connection.get(url) do |request| 		
      request.params = params		
    end		
    require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)		
  end		
      
  private		
      
  def self.connection		
    Faraday.new('https://openlibrary.org/search.json')		
  end
end