require 'test_helper'

class CurrentTest < MiniTest::Test
  def test_methods_exist
    # basic methods
    assert defined? instance.apparent_temperature
    assert defined? instance.cloud_cover
    assert defined? instance.dew_point
    assert defined? instance.humidity
    assert defined? instance.icon
    assert defined? instance.nearest_storm_bearing
    assert defined? instance.nearest_storm_distance
    assert defined? instance.ozone
    assert defined? instance.precip_intensity
    assert defined? instance.precip_probability
    assert defined? instance.precip_type
    assert defined? instance.pressure
    assert defined? instance.summary
    assert defined? instance.temperature
    assert defined? instance.uv_index
    assert defined? instance.visibility
    assert defined? instance.wind_bearing
    assert defined? instance.wind_gust
    assert defined? instance.wind_speed

    # aliases
    assert defined? instance.wind_chill
    assert defined? instance.heat_index
    assert defined? instance.feels_like

    # derived methods
    assert defined? instance.nearest_storm_bearing_text
    assert defined? instance.wind_bearing_text
    assert defined? instance.precip_intensity_text
    assert defined? instance.clear?
    assert defined? instance.rainy?
    assert defined? instance.snowy?
    assert defined? instance.sleet?
    assert defined? instance.windy?
    assert defined? instance.foggy?
    assert defined? instance.cloudy?
  end

  def test_return_types
    # basic methods
    assert instance.apparent_temperature.is_a? Numeric
    assert instance.cloud_cover.is_a? Numeric
    assert instance.dew_point.is_a? Numeric
    assert instance.humidity.is_a? Numeric
    assert instance.icon.is_a? String
    assert instance.nearest_storm_bearing.is_a? Numeric
    assert instance.nearest_storm_distance.is_a? Numeric
    assert instance.ozone.is_a? Numeric
    assert instance.precip_intensity.is_a? Numeric
    assert instance.precip_probability.is_a? Numeric
    assert instance.precip_type.is_a? NullableString
    assert instance.pressure.is_a? Numeric
    assert instance.summary.is_a? String
    assert instance.temperature.is_a? Numeric
    assert instance.uv_index.is_a? Numeric
    assert instance.visibility.is_a? Numeric
    assert instance.wind_bearing.is_a? Numeric
    assert instance.wind_gust.is_a? Numeric
    assert instance.wind_speed.is_a? Numeric

    # aliases
    assert instance.wind_chill.is_a? Numeric
    assert instance.heat_index.is_a? Numeric
    assert instance.feels_like.is_a? Numeric

    # derived methods
    assert instance.nearest_storm_bearing_text.is_a? String
    assert instance.wind_bearing_text.is_a? String
    assert instance.precip_intensity_text.is_a? NullableString
    assert instance.clear?.is_a? Boolean
    assert instance.rainy?.is_a? Boolean
    assert instance.snowy?.is_a? Boolean
    assert instance.sleet?.is_a? Boolean
    assert instance.windy?.is_a? Boolean
    assert instance.foggy?.is_a? Boolean
    assert instance.cloudy?.is_a? Boolean
  end

  def test_precip_intensity
    assert_equal instance.send(:_precip_intensity_text, 0.01), 'sporadic'
    assert_equal instance.send(:_precip_intensity_text, 0.05), 'light'
    assert_equal instance.send(:_precip_intensity_text, 0.20), 'moderate'
    assert_equal instance.send(:_precip_intensity_text, 0.50), 'heavy'
  end

  private

  def instance
    $location.current
  end
end
