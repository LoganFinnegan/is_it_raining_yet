require 'rails_helper'

RSpec.describe OpenlibraryService do
  it 'can make API call to database', :vcr do
    # params = { q: "lord of the rings" }
    params = "Austin, TX"
    query = OpenlibraryService.call_db('?=', params)
    # require 'pry'; binding.pry
    expect(query).to be_an Hash
    check_hash_structure(query, :numFound, Integer)
  end
end