require 'test_helper'

class CurrentTest < MiniTest::Test
  ::DarkSky.config key: ''
  @@data = ::DarkSky::Current.new [45, -90]

  def setup
    # set to default value
    @@data.cache_duration = 300
  end

  def test_full_data
    assert @@data.full_data
  end

  def test_location
    assert_equal @@data.location, [45, -90]
  end

  def test_defaults
    assert_equal @@data.cache_duration, 300
  end

  def test_cache_duration
    assert_equal @@data.cache_duration, 300 # default
    @@data.cache_duration = 600
    assert_equal @@data.cache_duration, 600
  end

  def test_generated_methods # rubocop:disable Metrics/AbcSize
    assert @@data.temperature
    assert @@data.summary
    assert @@data.precip_intensity
    assert @@data.precip_probability
    assert @@data.apparent_temperature
    assert @@data.dew_point
    assert @@data.humidity
    assert @@data.pressure
    assert @@data.wind_speed
    assert @@data.wind_gust
    assert @@data.cloud_cover
    assert @@data.uv_index
    assert @@data.visibility

    # aliases
    assert @@data.wind_chill
    assert @@data.heat_index
    assert @@data.feels_like
  end
end
