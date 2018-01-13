require 'rubygems'
require 'rest_client'
require 'json'

class Tpg
  VERSION = 'v1'.freeze
  DOMAIN = 'https://prod.ivtr-od.tpg.ch'.freeze

  def initialize(api_key)
    @api_key = api_key
  end

  #
  # @param: stopCode, stopName, line, latitude, longitude
  #
  def stops(params = {})
    query('GetStops', params)['stops']
  end

  #
  # @param: stopCode, stopName
  #
  def physical_stops(params = {})
    query('GetPhysicalStops', params)['stops']
  end

  #
  # @param: stopCode, departureCode, linesCode, destinationCode
  #
  def next_departures(params = {})
    query('GetNextDepartures', params)
  end

  #
  # @param: stopCode, lineCode, destinationCode
  #
  def all_next_departures(params = {})
    query('GetAllNextDepartures', params)
  end

  #
  # @param: departureCode
  #
  def thermometer(params = {})
    query('GetThermometer', params)
  end

  #
  # @param: departureCode
  #
  def thermometer_physical_stops(params = {})
    query('GetThermometerPhysicalStops', params)
  end

  #
  # @param: -
  #
  def lines_colors
    query('GetLinesColors')
  end

  #
  # @param: -
  #
  def disruptions
    query('GetDisruptions')
  end

  protected

  def query(method, params = nil)
    url = "#{DOMAIN}/#{VERSION}/#{method}.json?key=#{@api_key}"
    url = "#{url}&#{create_query(params)}" if params

    JSON.parse(RestClient.get(url))
  end

  def create_query(params)
    params.map { |k, v| "#{k}=#{v}" }.join('&')
  end
end
