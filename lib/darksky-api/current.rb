require 'rest-client'
require 'json'

module DarkSky
  # @author Jacob Pratt <the.z.cuber@gmail.com>
  # @version 0.1.0
  class Current
    # @example
    #   instance = DarkSky::Current.new [45, -90]
    #   instance.location #=> [45, -90]
    # @since 0.1.0
    # @return [Array<Float>] coordinates of object and data
    attr_reader :location

    # @example getter
    #   instance = DarkSky::Current.new [45, -90]
    #   instance.cache_duration #=> 300
    # @example setter
    #   instance = DarkSky::Current.new [45, -90]
    #   instance.cache_duration = 600
    #   instance.cache_duration #=> 600
    # @since 0.1.0
    # @return [Integer] how long is data valid for before a new request is made?
    attr_accessor :cache_duration

    # @example
    #   DarkSky.config key: '0f1e2d3c4b5a6978'
    #   instance = DarkSky::Current.new
    #   instance.key #=> '0f1e2d3c4b5a6978'
    # @since 0.1.0
    # @return [String] key used for API authentication
    def self.key
      DarkSky.key
    end

    # @param location [[Float, Float]] coordinates to get data of
    # @param cache_duration [Integer] requests within this many seconds will be parsed on existing data
    def initialize(location = [0, 0], cache_duration: 300)
      @location = location
      @cache_duration = cache_duration # in seconds
      @cache_time = 1
    end

    # @method apparent_temperature
    # @method cloud_cover
    # @method dew_point
    # @method humidity
    # @method icon
    # @method nearest_storm_distance
    # @method ozone
    # @method precip_intensity
    # @method precip_intensity_error
    # @method precip_probability
    # @method pressure
    # @method summary
    # @method temperature
    # @method uv_index
    # @method visibility
    # @method visibility
    # @method wind_bearing
    # @method wind_gust
    # @method wind_speed
    # @since 0.1.0
    # @return [Object] current at location
    %w[
      apparent_temperature
      cloud_cover
      dew_point
      humidity
      precip_intensity
      precip_probability
      pressure
      summary
      temperature
      uv_index
      visibility
      wind_gust
      wind_speed
    ].each do |type|
      define_method type do
        current_data[:currently][camelize(type).to_sym]
      end
    end

    # different names for the same thing
    alias wind_chill apparent_temperature
    alias heat_index apparent_temperature
    alias feels_like apparent_temperature

    # @example
    #   instance = DarkSky::Current.new
    #   instance.full_data
    # @since 0.1.0
    # @return [Hash] raw data (in full) from DarkSky
    def full_data
      current_data
    end

    # update cache if necessary and get latest data
    # @return [Hash] full data
    private def current_data
      if (Time.now - @cache_time).to_i >= @cache_duration
        response = RestClient.get "https://api.darksky.net/forecast/#{DarkSky.key}/#{@location.join ','}"
        @data = JSON.parse response.body, symbolize_names: true
        @cache_time = Time.now
      end
      @data
    end

    # snake case => camel case
    # @example
    #   camelize('foo_bar') #=> 'fooBar'
    # @param str [String] what to camelize
    # @since 0.1.0
    # return [String] camelized version of string
    private def camelize(str)
      str.split('_').inject([]) do |buffer, e|
        buffer.push(buffer.empty? ? e : e.capitalize)
      end.join
    end
  end
end
