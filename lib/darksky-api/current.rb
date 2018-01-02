module DarkSky
  class Location
    class Current < CommonMethods
      # automatically called by `Location`
      # @since 0.1.0
      # @param [Location] location where to get data from
      def initialize(location)
        @location = location
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.nearest_storm_bearing #=> nearest storm bearing at location
      # @since 0.1.0
      # @return [Numeric] nearest storm bearing at location
      def nearest_storm_bearing
        data[:nearestStormBearing]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.nearest_storm_bearing_text #=> text representation of bearing (N, NW, etc.)
      # @since 0.1.0
      # @return [String] text representation of bearing
      def nearest_storm_bearing_text
        _bearing_text(nearest_storm_bearing)
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.nearest_storm_distance #=> nearest storm distance from location
      # @since 0.1.0
      # @return [Numeric] nearest storm distance from location
      def nearest_storm_distance
        data[:nearestStormDistance]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.current.temperature #=> temperature at location
      # @since 0.1.0
      # @return [Numeric] current temperature at location
      def temperature
        data[:temperature]
      end

      private

      # helper to avoid typing this many times over
      # @since 0.1.3
      # @return [Hash] full data for current time
      def data
        @location.full_data[:currently]
      end
    end
  end
end
