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
    url = "#{@@base_url}"
  end

  def retrieve_data_from_url

  end

end