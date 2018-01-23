require 'test_helper'

class CommonMethodsTest < MiniTest::Test
  def test_abstract_method
    assert_raises(NotImplementedError) { ::DarkSky::CommonMethods.new }
  end

  def test_methods_exist
    methods_exist_on instance, %w[
      apparent_temperature
      cloud_cover
      humidity
      icon
      ozone
      precip_intensity
      precip_probability
      precip_type
      pressure
      summary
      uv_index
      visibility
      wind_bearing
      wind_gust
      wind_speed
      wind_bearing_text
      precip_intensity_text
      clear?
      rainy?
      snowy?
      sleet?
      windy?
      foggy?
      cloudy?
    ]
  end

  def test_aliases
    aliases_on instance, {
      apparent_temperature: %w[wind_chill heat_index feels_like]
    }
  end

  def test_return_types
    return_types_on instance,{
      Numeric => %w[
        apparent_temperature
        cloud_cover
        dew_point
        humidity
        ozone
        precip_intensity
        precip_probability
        pressure
        uv_index
        visibility
        wind_bearing
        wind_gust
        wind_speed
      ],
      String => %w[
        icon
        summary
        wind_bearing_text
      ],
      NullableString => %w[
        precip_type
        precip_intensity_text
      ],
      Boolean => %w[
        clear?
        rainy?
        snowy?
        sleet?
        windy?
        foggy?
        cloudy?
      ]
    }
  end

  def test_precip_intensity
    [
      [0.01, 'spotty'],
      [0.05, 'light'],
      [0.20, 'moderate'],
      [0.50, 'heavy'],
    ].each do |intensity, description|
      assert_equal instance.send(:_precip_intensity_text, intensity), description
    end
  end

  def test_bearing_text
    [
      [ 0,     'N'   ],
      [ 22.5,  'NNE' ],
      [ 45,    'NE'  ],
      [ 67.5,  'ENE' ],
      [ 90,    'E'   ],
      [ 112.5, 'ESE' ],
      [ 135,   'SE'  ],
      [ 157.5, 'SSE' ],
      [ 180,   'S'   ],
      [ 202.5, 'SSW' ],
      [ 225,   'SW'  ],
      [ 247.5, 'WSW' ],
      [ 270,   'W'   ],
      [ 292.5, 'WNW' ],
      [ 315,   'NW'  ],
      [ 337.5, 'NNW' ],
    ].each do |degrees, direction|
      assert_equal instance.send(:_bearing_text, degrees), direction
    end
  end

  private

  def instance
    $location.current
  end
end
