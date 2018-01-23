require 'test_helper'

class CurrentTest < MiniTest::Test
  def test_methods_exist
    methods_exist_on instance, %w[
      nearest_storm_bearing
      nearest_storm_distance
      temperature
      nearest_storm_bearing_text
    ]
  end

  def test_return_types
    return_types_on instance, {
      Numeric => %w[
        temperature
      ],
      NullableNumeric => %w[
        nearest_storm_bearing
        nearest_storm_distance
      ],
      NullableString => %w[
        nearest_storm_bearing_text
      ]
    }
  end

  private

  def instance
    $location.current
  end
end
