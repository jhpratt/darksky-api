require 'test_helper'

class LocationTest < MiniTest::Test
  ::DarkSky.config key: ENV['KEY']
  @@location = ::DarkSky::Location.new [45, -90]

  def setup
    # set to default value
    @@location.cache_duration = 300
  end

  def test_full_data
    assert @@location.full_data
  end

  def test_location
    assert_equal @@location.location, [45, -90]
  end

  def test_defaults
    assert_equal @@location.cache_duration, 300
  end

  def test_cache_duration
    assert_equal @@location.cache_duration, 300 # default
    @@location.cache_duration = 600
    assert_equal @@location.cache_duration, 600
  end

  def test_current_exists
    assert @@location.current
  end
end
