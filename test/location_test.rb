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

  def test_units
    %w[us si auto ca uk2].each do |unit|
      location = ::DarkSky::Location.new [45, -90], units: unit
      assert_equal location.units, unit.to_sym
    end

    # special cases for Canada and UK
    location = DarkSky::Location.new [45, -90], units: :canada
    assert_equal location.units, :ca

    location = DarkSky::Location.new [45, -90], units: :uk
    assert_equal location.units, :uk2
  end

  def test_cache_duration
    $location.cache_duration = 600
    assert_equal $location.cache_duration, 600
    $location.cache_duration = 300 # set back to default
  end
end
