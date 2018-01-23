require 'test_helper'

class DayTest < MiniTest::Test
  def test_days_exist
    methods_exist_on $location, %w[
      today
      tomorrow
      in_2_days
      in_3_days
      in_4_days
      in_5_days
      in_6_days
      in_7_days
    ]

    aliases_on $location, {
      today: %w[in_0_days],
      tomorrow: %w[in_1_day in_1_days],
    }
  end

  def test_methods_exist
    methods_exist_on instance, %w[
      date
      temperature_high
      temperature_high_time
      temperature_low
      temperature_low_time
      sunrise_time
      sunset_time
      moon_phase
      moon_phase_text
      precip_intensity_max
      precip_intensity_max_text
      precip_intensity_max_time
      precip_accumulation
      apparent_temperature_high
      apparent_temperature_high_time
      apparent_temperature_low
      apparent_temperature_low_time
      wind_gust_time
      uv_index_time
    ]

    aliases_on instance, {
      temperature_high: %w[high_temperature],
      temperature_high_time: %w[high_temperature_time],
      temperature_low: %w[low_temperature],
      temperature_low_time: %w[low_temperature_time],
      sunrise: %w[sunrise_time],
      sunset: %w[sunset_time],
      apparent_temperature_high: %w[
        high_apparent_temperature
        apparent_high_temperature
        high_feels_like
        feels_like_high
        high_heat_index
        heat_index_high
        high_wind_chill
        wind_chill_high
      ],
      apparent_temperature_low: %w[
        low_apparent_temperature
        apparent_low_temperature
        low_feels_like
        feels_like_low
        low_heat_index
        heat_index_low
        low_wind_chill
        wind_chill_low
      ],
    }

  end

  def test_return_types
    return_types_on instance, {
      Date => %w[
        date
      ],
      Time => %w[
        temperature_high_time
        temperature_low_time
        apparent_temperature_high_time
        apparent_temperature_low_time
        sunrise_time
        sunset_time
        wind_gust_time
        uv_index_time
      ],
      NullableTime => %w[
        precip_intensity_max_time
      ],
      Numeric => %w[
        temperature_high
        temperature_low
        apparent_temperature_high
        apparent_temperature_low
        moon_phase
        precip_intensity_max
      ],
      NullableNumeric => %w[
        precip_accumulation
      ],
      String => %w[
        moon_phase_text
      ],
      NullableString => %w[
        precip_intensity_max_text
      ],
    }

    return_types_on $location, {
      ::DarkSky::Location::Day => %w[
        today
        tomorrow
        in_2_days
        in_3_days
        in_4_days
        in_5_days
        in_6_days
        in_7_days
      ]
    }
  end

  def test_moon_phase
    [
      [0.00, 'new moon'],
      [0.10, 'waxing crescent moon'],
      [0.25, 'first quarter moon'],
      [0.40, 'waxing gibbous moon'],
      [0.50, 'full moon'],
      [0.60, 'waning gibbous moon'],
      [0.75, 'last quarter moon'],
      [0.90, 'waning crescent moon'],
      [1.00, 'new moon'],
    ].each do |percent, description|
      assert_equal instance.send(:_moon_phase_text, percent), description
    end
  end

  private

  def instance
    $location.today
  end
end
