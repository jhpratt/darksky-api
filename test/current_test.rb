require 'test_helper'

class CurrentTest < MiniTest::Test
  def test_methods_exist
    # basic methods
    assert defined? instance.nearest_storm_bearing
    assert defined? instance.nearest_storm_distance
    assert defined? instance.temperature

    # derived methods
    assert defined? instance.nearest_storm_bearing_text
  end

  def test_return_types
    # basic methods
    assert instance.nearest_storm_bearing.is_a? NullableNumeric
    assert instance.nearest_storm_distance.is_a? NullableNumeric
    assert instance.temperature.is_a? Numeric

    # derived methods
    assert instance.nearest_storm_bearing_text.is_a? NullableString
  end

  private

  def instance
    $location.current
  end
end
