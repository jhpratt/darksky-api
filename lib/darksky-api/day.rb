module DarkSky
  class Location
    class Day < CommonMethods
      # automatically called by `Location`
      # @since 0.1.3
      # @param [Location] location where to get data from
      def initialize(location, days_from_current)
        @location = location
        @days_from_current = days_from_current
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.date #=> object for the date
      # @since 0.1.3
      # @return [Date] object for the day
      def date
        # we only want the date, so don't use `Time.at()`
        Date.strptime data[:time].to_s, '%s'
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.temperature_high #=> high temperature for the day
      # @since 0.1.3
      # @return [Numeric] high temperature for the day
      def temperature_high
        data[:temperatureHigh]
      end
      alias high_temperature temperature_high

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.temperature_high_time #=> time of high temperature
      # @since 0.1.3
      # @return [Time] time of high temperature
      def temperature_high_time
        Time.at data[:temperatureHighTime]
      end
      alias high_temperature_time temperature_high_time

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.temperature_low #=> low temperature for the day
      # @since 0.1.3
      # @return [Numeric] low temperature for the day
      def temperature_low
        data[:temperatureLow]
      end
      alias low_temperature temperature_low

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.temperature_low_time #=> time of low temperature
      # @since 0.1.3
      # @return [Time] time of low temperature
      def temperature_low_time
        Time.at data[:temperatureLowTime]
      end
      alias low_temperature_time temperature_low_time

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.sunrise_time #=> sunrise time on day
      # @since 0.1.3
      # @return [Time] object with sunrise timestamp
      def sunrise_time
        Time.at data[:sunriseTime]
      end
      alias sunrise sunrise_time

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.sunset_time #=> sunset time on day
      # @since 0.1.3
      # @return [Time] object with sunset timestamp
      def sunset_time
        Time.at data[:sunsetTime]
      end
      alias sunset sunset_time

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.moon_phase #=> moon phase on day
      # @since 0.1.3
      # @return [Numeric] phase of the moon (0 to 1)
      def moon_phase
        data[:moonPhase]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.moon_phase_text #=> textual representation of moon phase
      # @since 0.1.3
      # @return [String] textual representation of moon phase
      def moon_phase_text
        # separate method for easy unit testing
        _moon_phase_text(moon_phase)
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.precip_intensity_max #=> precipitation intensity on day
      # @since 0.1.3
      # @return [Numeric] maximum precipitation intensity on day
      def precip_intensity_max
        data[:precipIntensityMax]
      end

      # @example
      #   location = DarkSky::Locaiton.new [45, -90]
      #   location.today.precip_intensity_max_text #=> text representation of maximum precipitation intensity on day
      # @since 0.1.3
      # @return [String] text representation of maximum precipitation intensity on day
      def precip_intensity_max_text
        _precip_intensity_text(precip_intensity_max)
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.precip_intensity_max_time #=> object of max time
      # @since 0.1.3
      # @return [Time] time of maximum precipitation intensity
      def precip_intensity_max_time
        Time.at data[:precipIntensityMaxTime] if data[:precipIntensityMaxTime]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.precip_accumulation #=> precipitation accumulation on day
      # @since 0.1.3
      # @return [Numeric] precipitation accumulation on day
      def precip_accumulation
        data[:precipAccumulation]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.apparent_temperature_high #=> high feels like on day
      # @since 0.1.3
      # @return [Numeric] high feels like on day
      def apparent_temperature_high
        data[:apparentTemperatureHigh]
      end
      alias high_apparent_temperature apparent_temperature_high
      alias apparent_high_temperature apparent_temperature_high
      alias high_feels_like apparent_temperature_high
      alias feels_like_high apparent_temperature_high
      alias high_heat_index apparent_temperature_high
      alias heat_index_high apparent_temperature_high
      alias high_wind_chill apparent_temperature_high
      alias wind_chill_high apparent_temperature_high

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.apparent_temperature_low #=> low feels like on day
      # @since 0.1.3
      # @return [Numeric] low feels like on day
      def apparent_temperature_low
        data[:apparentTemperatureLow]
      end
      alias low_apparent_temperature apparent_temperature_low
      alias apparent_low_temperature apparent_temperature_low
      alias low_feels_like apparent_temperature_low
      alias feels_like_low apparent_temperature_low
      alias low_heat_index apparent_temperature_low
      alias heat_index_low apparent_temperature_low
      alias low_wind_chill apparent_temperature_low
      alias wind_chill_low apparent_temperature_low

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.apparent_temperature_high_time #=> time of high apparent temperature
      # @since 0.1.3
      # @return [Numeric] time of high apparent temperature
      def apparent_temperature_high_time
        data[:apparentTemperatureHighTime]
      end
      alias high_apparent_temperature_time apparent_temperature_high_time
      alias apparent_high_temperature_time apparent_temperature_high_time
      alias high_feels_like_time apparent_temperature_high_time
      alias feels_like_high_time apparent_temperature_high_time
      alias high_heat_index_time apparent_temperature_high_time
      alias heat_index_high_time apparent_temperature_high_time
      alias high_wind_chill_time apparent_temperature_high_time
      alias wind_chill_high_time apparent_temperature_high_time

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.apparent_temperature_low_time #=> time of low apparent temperature
      # @since 0.1.3
      # @return [Numeric] time of low apparent temperature
      def apparent_temperature_low_time
        data[:apparentTemperatureLowTime]
      end
      alias low_apparent_temperature_time apparent_temperature_low_time
      alias apparent_low_temperature_time apparent_temperature_low_time
      alias low_feels_like_time apparent_temperature_low_time
      alias feels_like_low_time apparent_temperature_low_time
      alias low_heat_index_time apparent_temperature_low_time
      alias heat_index_low_time apparent_temperature_low_time
      alias low_wind_chill_time apparent_temperature_low_time
      alias wind_chill_low_time apparent_temperature_low_time

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.wind_gust_time #=> wind gust time on day
      # @since 0.1.3
      # @return [Time] wind gust time on day
      def wind_gust_time
        Time.at data[:windGustTime]
      end

      # @example
      #   location = DarkSky::Location.new [45, -90]
      #   location.today.uv_index_time #=> max UV index time on day
      # @since 0.1.3
      # @return [Time] max UV index time on day
      def uv_index_time
        Time.at data[:uvIndexTime]
      end

      private

      # helper to avoid typing this many times over
      # @since 0.1.3
      # @return [Hash] full data for the given day
      def data
        @location.full_data[:daily][:data][@days_from_current]
      end

      # convert numerical moon phase to text
      # 10% around each phase (new, first quarter, full, last quarter)
      # keep this a separate method for testing purposes
      # @since 0.1.3
      # @return [String] text representation of moon phase
      def _moon_phase_text(phase)
        if phase < 0.05
          'new moon'
        elsif phase < 0.20
          'waxing crescent moon'
        elsif phase < 0.30
          'first quarter moon'
        elsif phase < 0.45
          'waxing gibbous moon'
        elsif phase < 0.55
          'full moon'
        elsif phase < 0.70
          'waning gibbous moon'
        elsif phase < 0.80
          'last quarter moon'
        elsif phase < 0.95
          'waning crescent moon'
        else
          'new moon'
        end
      end
    end

    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.today #=> DarkSky::Location::Day
    # @since 0.1.3
    # @return [Day] class containing data for given day
    def today
      Day.new self, 0
    end
    alias in_0_days today

    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.tomorrow #=> DarkSky::Location::Day
    # @since 0.1.3
    # @return [Day] class containing data for given day
    def tomorrow
      Day.new self, 1
    end
    alias in_1_day tomorrow
    alias in_1_days tomorrow

    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.in_2_days #=> DarkSky::Location::Day
    # @since 0.1.3
    # @return [Day] class containing data for given day
    def in_2_days
      Day.new self, 2
    end

    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.in_3_days #=> DarkSky::Location::Day
    # @since 0.1.3
    # @return [Day] class containing data for given day
    def in_3_days
      Day.new self, 3
    end

    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.in_4_days #=> DarkSky::Location::Day
    # @since 0.1.3
    # @return [Day] class containing data for given day
    def in_4_days
      Day.new self, 4
    end

    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.in_5_days #=> DarkSky::Location::Day
    # @since 0.1.3
    # @return [Day] class containing data for given day
    def in_5_days
      Day.new self, 5
    end

    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.in_6_days #=> DarkSky::Location::Day
    # @since 0.1.3
    # @return [Day] class containing data for given day
    def in_6_days
      Day.new self, 6
    end

    # @example
    #   location = DarkSky::Location.new [45, -90]
    #   location.in_7_days #=> DarkSky::Location::Day
    # @since 0.1.3
    # @return [Day] class containing data for given day
    def in_7_days
      Day.new self, 7
    end
  end
end
