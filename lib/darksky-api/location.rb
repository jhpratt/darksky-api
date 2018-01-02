require 'rest-client'
require 'json'

module DarkSky
  class Location
    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.location #=> [45, -90]
    # @since 0.1.0
    # @return [Array<Numeric>] coordinates of object and data
    attr_reader :location

    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.current #=> DarkSky::Location::Current
    # @since 0.1.0
    # @return [Current] class containing data for current time and location
    attr_reader :current

    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.units #=> :auto
    # @since 0.1.2
    # @return [Symbol] what unit system is being used
    attr_reader :units

    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.language #=> :en
    # @since 0.1.2
    # @return [Symbol] what language is used
    attr_reader :language

    # @example getter
    #   location = DarkSky::Location.new [45, -90]
    #   location.cache_duration #=> 300
    # @example setter
    #   location = DarkSky::Location.new [45, -90]
    #   location.cache_duration = 600
    #   location.cache_duration #=> 600
    # @since 0.1.0
    # @return [Numeric] how long is data valid for before a new request is made?
    attr_accessor :cache_duration

    # @param location [[Numeric, Numeric]] coordinates to get data of
    # @param [Numeric] cache_duration requests within this many seconds will be parsed on existing data
    # @param [Symbol | String] units what unit system to use
    # @param [Symbol | String] language what language to return results in
    # @param [Boolean] prefetch immediately perform an API request upon initialization?
    def initialize(
      location = [0, 0],
      cache_duration: 300,
      units: :auto,
      language: :en,
      prefetch: false
    )
      # initial value to avoid errors
      @cache_time = 1

      # initialize instance variables from args & kwargs
      @location = location
      @cache_duration = cache_duration # in seconds
      @language = language.to_sym
      @units = units.to_sym

      # aliases for some unit systems
      @units = :uk2 if @units == :uk
      @units = :ca if @units == :canada

      # initialize classes for namespace
      @current = Current.new self

      # perform API request if prefetch is true
      full_data if prefetch
    end

    # update cache if necessary and get latest data
    # @example
    #   location = DarkSky::Location.new
    #   location.full_data
    # @since 0.1.0
    # @return [Hash] raw data (in full) from DarkSky
    def full_data
      if (Time.now - @cache_time).to_i >= @cache_duration
        response = RestClient.get "https://api.darksky.net/forecast/#{DarkSky.key}/#{@location.join ','}",
                                  units: @units,
                                  language: @language
        @data = JSON.parse response.body, symbolize_names: true
        @cache_time = Time.now
      end
      @data
    end
  end
end
