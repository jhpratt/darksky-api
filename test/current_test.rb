require 'test_helper'

# used for type checking
module Boolean; end
class TrueClass; include Boolean; end
class FalseClass; include Boolean; end

class CurrentTest < MiniTest::Test
  ::DarkSky.config key: ENV['KEY']
  @@location = ::DarkSky::Location.new [45, -90]

  def test_methods_exist # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    # basic methods
    assert defined? @@location.current.apparent_temperature
    assert defined? @@location.current.cloud_cover
    assert defined? @@location.current.dew_point
    assert defined? @@location.current.humidity
    assert defined? @@location.current.icon
    assert defined? @@location.current.nearest_storm_bearing
    assert defined? @@location.current.nearest_storm_distance
    assert defined? @@location.current.ozone
    assert defined? @@location.current.precip_intensity
    assert defined? @@location.current.precip_probability
    assert defined? @@location.current.precip_type
    assert defined? @@location.current.pressure
    assert defined? @@location.current.summary
    assert defined? @@location.current.temperature
    assert defined? @@location.current.uv_index
    assert defined? @@location.current.visibility
    assert defined? @@location.current.wind_bearing
    assert defined? @@location.current.wind_gust
    assert defined? @@location.current.wind_speed

    # aliases
    assert defined? @@location.current.wind_chill
    assert defined? @@location.current.heat_index
    assert defined? @@location.current.feels_like

    # derived methods
    assert defined? @@location.current.nearest_storm_bearing_text
    assert defined? @@location.current.wind_bearing_text
    assert defined? @@location.current.precip_intensity_text
    assert defined? @@location.current.clear?
    assert defined? @@location.current.rainy?
    assert defined? @@location.current.snowy?
    assert defined? @@location.current.sleet?
    assert defined? @@location.current.windy?
    assert defined? @@location.current.foggy?
    assert defined? @@location.current.cloudy?
  end

  def test_return_types # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    # basic methods
    assert @@location.current.apparent_temperature.is_a? Numeric
    assert @@location.current.cloud_cover.is_a? Numeric
    assert @@location.current.dew_point.is_a? Numeric
    assert @@location.current.humidity.is_a? Numeric
    assert @@location.current.icon.is_a? String
    assert @@location.current.nearest_storm_bearing.is_a? Numeric
    assert @@location.current.nearest_storm_distance.is_a? Numeric
    assert @@location.current.ozone.is_a? Numeric
    assert @@location.current.precip_intensity.is_a? Numeric
    assert @@location.current.precip_probability.is_a? Numeric
    unless @@location.current.precip_type.nil?
      assert @@location.current.precip_type.is_a? String
    end
    assert @@location.current.pressure.is_a? Numeric
    assert @@location.current.summary.is_a? String
    assert @@location.current.temperature.is_a? Numeric
    assert @@location.current.uv_index.is_a? Numeric
    assert @@location.current.visibility.is_a? Numeric
    assert @@location.current.wind_bearing.is_a? Numeric
    assert @@location.current.wind_gust.is_a? Numeric
    assert @@location.current.wind_speed.is_a? Numeric

    # aliases
    assert @@location.current.wind_chill.is_a? Numeric
    assert @@location.current.heat_index.is_a? Numeric
    assert @@location.current.feels_like.is_a? Numeric

    # derived methods
    assert @@location.current.nearest_storm_bearing_text.is_a? String
    assert @@location.current.wind_bearing_text.is_a? String
    unless @@location.current.precip_intensity_text.nil?
      assert @@location.current.precip_intensity_text.is_a? String
    end
    assert @@location.current.clear?.is_a? Boolean
    assert @@location.current.rainy?.is_a? Boolean
    assert @@location.current.snowy?.is_a? Boolean
    assert @@location.current.sleet?.is_a? Boolean
    assert @@location.current.windy?.is_a? Boolean
    assert @@location.current.foggy?.is_a? Boolean
    assert @@location.current.cloudy?.is_a? Boolean
  end
end
