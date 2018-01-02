require 'test_helper'

class LocationTest < MiniTest::Test
  def test_full_data
    assert $location.full_data
  end

  def test_location
    assert_equal $location.location, [45, -90]
  end

  def test_defaults
    assert_equal $location.cache_duration, 300
    assert_equal $location.units, :auto
    assert_equal $location.language, :en
  end

  def test_cache_duration
    $location.cache_duration = 600
    assert_equal $location.cache_duration, 600
    $location.cache_duration = 300 # set back to default
  end
end
