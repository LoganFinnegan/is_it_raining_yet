class OpenlibraryFacade 
  def self.find_books(search)
    params = search
    response = OpenlibraryService.call_db('?=', params)
    require 'pry'; binding.pry
  end
end