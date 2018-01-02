require 'test_helper'

class CommonMethodsTest < MiniTest::Test
  def test_abstract_method
    assert_raises(NotImplementedError) { ::DarkSky::CommonMethods.new }
  end

  def test_methods_exist
    # basic methods
    assert defined? instance.apparent_temperature
    assert defined? instance.cloud_cover
    assert defined? instance.dew_point
    assert defined? instance.humidity
    assert defined? instance.icon
    assert defined? instance.ozone
    assert defined? instance.precip_intensity
    assert defined? instance.precip_probability
    assert defined? instance.precip_type
    assert defined? instance.pressure
    assert defined? instance.summary
    assert defined? instance.uv_index
    assert defined? instance.visibility
    assert defined? instance.wind_bearing
    assert defined? instance.wind_gust
    assert defined? instance.wind_speed

    # derived methods
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

  def test_aliases
    assert_same instance.apparent_temperature, instance.wind_chill
    assert_same instance.apparent_temperature, instance.heat_index
    assert_same instance.apparent_temperature, instance.feels_like
  end

  def test_return_types
    # basic methods
    assert instance.apparent_temperature.is_a? Numeric
    assert instance.cloud_cover.is_a? Numeric
    assert instance.dew_point.is_a? Numeric
    assert instance.humidity.is_a? Numeric
    assert instance.icon.is_a? String
    assert instance.ozone.is_a? Numeric
    assert instance.precip_intensity.is_a? Numeric
    assert instance.precip_probability.is_a? Numeric
    assert instance.precip_type.is_a? NullableString
    assert instance.pressure.is_a? Numeric
    assert instance.summary.is_a? String
    assert instance.uv_index.is_a? Numeric
    assert instance.visibility.is_a? Numeric
    assert instance.wind_bearing.is_a? Numeric
    assert instance.wind_gust.is_a? Numeric
    assert instance.wind_speed.is_a? Numeric

    # derived methods
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

  def test_bearing_text
    assert_equal instance.send(:_bearing_text, 0), 'N'
    assert_equal instance.send(:_bearing_text, 22.5), 'NNE'
    assert_equal instance.send(:_bearing_text, 45), 'NE'
    assert_equal instance.send(:_bearing_text, 67.5), 'ENE'
    assert_equal instance.send(:_bearing_text, 90), 'E'
    assert_equal instance.send(:_bearing_text, 112.5), 'ESE'
    assert_equal instance.send(:_bearing_text, 135), 'SE'
    assert_equal instance.send(:_bearing_text, 157.5), 'SSE'
    assert_equal instance.send(:_bearing_text, 180), 'S'
    assert_equal instance.send(:_bearing_text, 202.5), 'SSW'
    assert_equal instance.send(:_bearing_text, 225), 'SW'
    assert_equal instance.send(:_bearing_text, 247.5), 'WSW'
    assert_equal instance.send(:_bearing_text, 270), 'W'
    assert_equal instance.send(:_bearing_text, 292.5), 'WNW'
    assert_equal instance.send(:_bearing_text, 315), 'NW'
    assert_equal instance.send(:_bearing_text, 337.5), 'NNW'
  end

  private

  def instance
    $location.current
  end
end
