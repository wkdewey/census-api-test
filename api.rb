require 'pry'
require 'httparty'
require 'dotenv/load'

class CensusAPI

  @@base_url = "https://api.census.gov/data/2019/acs/acs5?get=NAME"
  
  def initialize(lookup, place, state)
    @token = ENV['TOKEN']
    @lookup = lookup
    @place = place
    @state = state
    retrieve_place_data
  end

  def retrieve_place_data
    url = "#{@@base_url},#{@lookup}&for=place:#{@place}&in=state:#{@state}"
    @artist_data = retrieve_data_from_url(url)
    @value = @artist_data[1][1]
    puts(@value)
  end

  def retrieve_data_from_url(url)
    url = URI.parse(URI.escape(url))
    puts(url)
    HTTParty.get(url, 
      {headers: {"Authorization" => "Bearer #{@token}"}}
    )
  end

end
while true
  puts "enter lookup code"
  lookup_code = gets.strip
  puts "enter city code"
  city = gets.strip.to_s
  puts "enter state code"
  state = gets.strip.to_s
  CensusAPI.new(lookup_code, city, state)
  puts "another?"
  response = gets.capitalize
  if response == "N"
    break
  end
end