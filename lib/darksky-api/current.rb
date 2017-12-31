require 'rest-client'
require 'json'

module DarkSky
  class Location
    class Current
      # automatically called by `Location`
      # @param [Location] location where to get data from
      def initialize(location)
        @location = location
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.apparent_temperature #=> apparent temperature at location
      # @since 0.1.0
      # @return [Numeric] current apparent temperature at location
      def apparent_temperature
        @location.full_data[:currently][:apparentTemperature]
      end

      alias wind_chill apparent_temperature
      alias heat_index apparent_temperature
      alias feels_like apparent_temperature

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.cloud_cover #=> cloud cover at location
      # @since 0.1.0
      # @return [Numeric] current cloud cover at location
      def cloud_cover
        @location.full_data[:currently][:cloudCover]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.dew_point #=> dew point at location
      # @since 0.1.0
      # @return [Numeric] current dew point at location
      def dew_point
        @location.full_data[:currently][:dewPoint]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.humidity #=> humidity at location
      # @since 0.1.0
      # @return [Numeric] current humidity at location
      def humidity
        @location.full_data[:currently][:humidity]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.icon #=> icon representation
      # @since 0.1.0
      # @return [String] icon representation of current weather at location
      def icon
        @location.full_data[:currently][:icon]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.clear?
      # @since 0.1.0
      # @return [Boolean] if icon is 'clear' variant
      def clear?
        %w[clear-day clear-night].include? icon
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.rainy?
      # @since 0.1.0
      # @return [Boolean] if icon is 'rain'
      def rainy?
        icon == 'rain'
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.snowy?
      # @since 0.1.0
      # @return [Boolean] if icon is 'snow'
      def snowy?
        icon == 'snow'
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.sleet?
      # @since 0.1.0
      # @return [Boolean] if icon is 'sleet'
      def sleet?
        icon == 'sleet'
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.windy?
      # @since 0.1.0
      # @return [Boolean] if icon is 'wind'
      def windy?
        icon == 'wind'
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.foggy?
      # @since 0.1.0
      # @return [Boolean] if icon is 'fog'
      def foggy?
        icon == 'fog'
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.cloudy?
      # @since 0.1.0
      # @return [Boolean] if icon is 'cloudy' or variant
      def cloudy?
        %w[cloudy partly-cloudy-day partly-cloudy-night].include? icon
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.nearest_storm_bearing #=> nearest storm bearing at location
      # @since 0.1.0
      # @return [Numeric] nearest storm bearing at location
      def nearest_storm_bearing
        @location.full_data[:currently][:nearestStormBearing]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.nearest_storm_bearing_text #=> text representation of bearing (N, NW, etc.)
      # @since 0.1.0
      # @return [String] text representation of bearing
      def nearest_storm_bearing_text
        directions = %w[N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW]
        directions[nearest_storm_bearing / 22.5 + 0.5]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.nearest_storm_distance #=> nearest storm distance from location
      # @since 0.1.0
      # @return [Numeric] nearest storm distance from location
      def nearest_storm_distance
        @location.full_data[:currently][:nearestStormDistance]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.ozone #=> ozone level at location
      # @since 0.1.0
      # @return [Numeric] current ozone level at location
      def ozone
        @location.full_data[:currently][:ozone]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.precip_intensity #=> precipitation intensity at location
      # @since 0.1.0
      # @return [Numeric] current precipitation intensity at location
      def precip_intensity
        @location.full_data[:currently][:precipIntensity]
      end

      # @example
      #   location = DarkSky::Locaiton.new [45,- 90]
      #   location.current.precip_intensity_text #=> text representation of precipitation intensity at location
      # @since 0.1.0
      # @return [String] text representation of precipitation intensity at location
      def precip_intensity_text
        if precip_intensity >= 0.400
          'heavy'
        elsif precip_intensity >= 0.100
          'moderate'
        elsif precip_intensity >= 0.017
          'light'
        elsif precip_intensity >= 0.002
          'very light'
        end
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.precip_probability #=> precipitation probability at location
      # @since 0.1.0
      # @return [Numeric] current precipitation probability at location
      def precip_probability
        @location.full_data[:currently][:precipProbability]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.precip_type #=> precipitation type at location
      # @since 0.1.0
      # @return [String | nil] current precipitation type at location
      def precip_type
        @location.full_data[:currently][:precipType]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.pressure #=> barometric pressure at location
      # @since 0.1.0
      # @return [Numeric] current barometric pressure at location
      def pressure
        @location.full_data[:currently][:pressure]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.summary #=> summary of weather at location
      # @since 0.1.0
      # @return [String] summary of weather at location
      def summary
        @location.full_data[:currently][:summary]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.temperature #=> temperature at location
      # @since 0.1.0
      # @return [Numeric] current temperature at location
      def temperature
        @location.full_data[:currently][:temperature]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.uv_index #=> UV index at location
      # @since 0.1.0
      # @return [Numeric] current UV index at location
      def uv_index
        @location.full_data[:currently][:uvIndex]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.visibility #=> visibility at location
      # @since 0.1.0
      # @return [Numeric] current visibility at location
      def visibility
        @location.full_data[:currently][:visibility]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.wind_bearing #=> wind bearing at location
      # @since 0.1.0
      # @return [Numeric] current wind bearing at location
      def wind_bearing
        @location.full_data[:currently][:windBearing]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.wind_bearing_text #=> text representation of bearing (N, NW, etc.)
      # @since 0.1.0
      # @return [String] text representation of bearing
      def wind_bearing_text
        directions = %w[N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW]
        directions[wind_bearing / 22.5 + 0.5]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.wind_gust #=> wind gust at location
      # @since 0.1.0
      # @return [Numeric] current wind gust at location
      def wind_gust
        @location.full_data[:currently][:windGust]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.wind_speed #=> wind speed at location
      # @since 0.1.0
      # @return [Numeric] current wind speed at location
      def wind_speed
        @location.full_data[:currently][:windSpeed]
      end
    end
  end
end
