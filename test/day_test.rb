require 'test_helper'

class DayTest < MiniTest::Test
  def test_days_exist
    assert $location.today
    assert $location.tomorrow
    assert $location.in_0_days
    assert $location.in_1_day
    assert $location.in_2_days
    assert $location.in_3_days
    assert $location.in_4_days
    assert $location.in_5_days
    assert $location.in_6_days
    assert $location.in_7_days
  end

  def test_methods_exist
    # basic methods
    assert defined? instance.date
    assert defined? instance.temperature_high
    assert defined? instance.temperature_high_time
    assert defined? instance.temperature_low
    assert defined? instance.temperature_low_time
    assert defined? instance.sunrise_time
    assert defined? instance.sunset_time
    assert defined? instance.moon_phase
    assert defined? instance.moon_phase_text
    assert defined? instance.precip_intensity_max
    assert defined? instance.precip_intensity_max_time
    assert defined? instance.precip_accumulation
    assert defined? instance.apparent_temperature_high
    assert defined? instance.apparent_temperature_low
    assert defined? instance.apparent_temperature_high_time
    assert defined? instance.apparent_temperature_low_time
    assert defined? instance.wind_gust_time
    assert defined? instance.uv_index_time

    # aliases
    assert defined? instance.high_temperature
    assert defined? instance.high_temperature_time
    assert defined? instance.low_temperature
    assert defined? instance.low_temperature_time
    assert defined? instance.sunrise
    assert defined? instance.sunset
    assert defined? instance.high_apparent_temperature
    assert defined? instance.apparent_high_temperature
    assert defined? instance.high_feels_like
    assert defined? instance.feels_like_high
    assert defined? instance.high_heat_index
    assert defined? instance.heat_index_high
    assert defined? instance.high_wind_chill
    assert defined? instance.wind_chill_high
    assert defined? instance.low_apparent_temperature
    assert defined? instance.apparent_low_temperature
    assert defined? instance.low_feels_like
    assert defined? instance.feels_like_low
    assert defined? instance.low_heat_index
    assert defined? instance.heat_index_low
    assert defined? instance.low_wind_chill
    assert defined? instance.wind_chill_low

    # derived methods
    assert defined? instance.precip_intensity_max_text
  end

  def test_return_types
    # basic methods
    assert instance.date.is_a? Date
    assert instance.temperature_high.is_a? Numeric
    assert instance.temperature_high_time.is_a? Time
    assert instance.temperature_low.is_a? Numeric
    assert instance.temperature_low_time.is_a? Time
    assert instance.sunrise_time.is_a? Time
    assert instance.sunset_time.is_a? Time
    assert instance.moon_phase.is_a? Numeric
    assert instance.moon_phase_text.is_a? String
    assert instance.precip_intensity_max.is_a? Numeric
    assert instance.precip_intensity_max_time.is_a? NullableTime
    assert instance.precip_accumulation.is_a? NullableNumeric
    assert instance.wind_gust_time.is_a? Time
    assert instance.uv_index_time.is_a? Time

    # aliases
    assert instance.high_temperature.is_a? Numeric
    assert instance.high_temperature_time.is_a? Time
    assert instance.low_temperature.is_a? Numeric
    assert instance.low_temperature_time.is_a? Time
    assert instance.sunrise.is_a? Time
    assert instance.sunset.is_a? Time
    assert instance.high_apparent_temperature.is_a? Numeric
    assert instance.apparent_high_temperature.is_a? Numeric
    assert instance.high_feels_like.is_a? Numeric
    assert instance.feels_like_high.is_a? Numeric
    assert instance.high_heat_index.is_a? Numeric
    assert instance.heat_index_high.is_a? Numeric
    assert instance.high_wind_chill.is_a? Numeric
    assert instance.wind_chill_high.is_a? Numeric
    assert instance.low_apparent_temperature.is_a? Numeric
    assert instance.apparent_low_temperature.is_a? Numeric
    assert instance.low_feels_like.is_a? Numeric
    assert instance.feels_like_low.is_a? Numeric
    assert instance.low_heat_index.is_a? Numeric
    assert instance.heat_index_low.is_a? Numeric
    assert instance.low_wind_chill.is_a? Numeric
    assert instance.wind_chill_low.is_a? Numeric
    assert instance.high_apparent_temperature_time.is_a? Numeric
    assert instance.apparent_high_temperature_time.is_a? Numeric
    assert instance.high_feels_like_time.is_a? Numeric
    assert instance.feels_like_high_time.is_a? Numeric
    assert instance.high_heat_index_time.is_a? Numeric
    assert instance.heat_index_high_time.is_a? Numeric
    assert instance.high_wind_chill_time.is_a? Numeric
    assert instance.wind_chill_high_time.is_a? Numeric
    assert instance.low_apparent_temperature_time.is_a? Numeric
    assert instance.apparent_low_temperature_time.is_a? Numeric
    assert instance.low_feels_like_time.is_a? Numeric
    assert instance.feels_like_low_time.is_a? Numeric
    assert instance.low_heat_index_time.is_a? Numeric
    assert instance.heat_index_low_time.is_a? Numeric
    assert instance.low_wind_chill_time.is_a? Numeric
    assert instance.wind_chill_low_time.is_a? Numeric

    # derived methods
    assert instance.precip_intensity_max_text.is_a? NullableString
  end

  def test_moon_phase
    assert_equal instance.send(:_moon_phase_text, 0.00), 'new moon'
    assert_equal instance.send(:_moon_phase_text, 0.10), 'waxing crescent moon'
    assert_equal instance.send(:_moon_phase_text, 0.25), 'first quarter moon'
    assert_equal instance.send(:_moon_phase_text, 0.40), 'waxing gibbous moon'
    assert_equal instance.send(:_moon_phase_text, 0.50), 'full moon'
    assert_equal instance.send(:_moon_phase_text, 0.60), 'waning gibbous moon'
    assert_equal instance.send(:_moon_phase_text, 0.75), 'last quarter moon'
    assert_equal instance.send(:_moon_phase_text, 0.90), 'waning crescent moon'
    assert_equal instance.send(:_moon_phase_text, 1.00), 'new moon'
  end

  private

  def instance
    $location.today
  end
end
