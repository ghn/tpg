require 'rubygems'
require 'rest_client'
require 'json'

class Tpg
  VERSION = "v1"
  DOMAIN = "http://rtpi.data.tpg.ch"

  def initialize(api_key)
    @api_key = api_key
  end

  #
  # @param: stopCode, stopName, line, latitude, longitude
  #
  def get_stops(params = {})
    self.query("GetStops", params)["stops"]
  end

  #
  # @param: stopCode, stopName
  #
  def get_physical_stops(params = {})
    self.query("GetPhysicalStops", params)["stops"]
  end

  #
  # @param: stopCode, departureCode, linesCode, destinationCode
  #
  def get_next_departures(params = {})
    self.query("GetNextDepartures", params)
  end

  #
  # @param: stopCode, lineCode, destinationCode
  #
  def get_all_next_departures(params = {})
    self.query("GetAllNextDepartures", params)
  end

  #
  # @param: departureCode
  #
  def get_thermometer(params = {})
    self.query("GetThermometer", params)
  end

  #
  # @param: departureCode
  #
  def get_thermometer_physical_stops(params = {})
    self.query("GetThermometerPhysicalStops", params)
  end

  #
  # @param: -
  #
  def get_lines_colors
    self.query("GetLinesColors")
  end

  #
  # @param: -
  #
  def get_disruptions
    self.query("GetDisruptions")
  end

  protected

  def query(method, params = nil)
    # looks like http://rtpi.data.tpg.ch/v1/GetDisruptions?key=xxxx
    url = "#{DOMAIN}/#{VERSION}/#{method}.json?key=#{@api_key}"

    if params
      url = "#{url}&#{self.create_query(params)}"
    end

    JSON.parse(RestClient.get(url))
  end

  def create_query(params)
    params.map{|k,v| "#{k}=#{v}" }.join('&')
  end
end
