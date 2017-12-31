require 'test_helper'

class ConfigTest < Minitest::Test
  def test_empty_config_fails
    assert_raises { ::DarkSky.config }
  end

  def test_getters
    ::DarkSky.config key: 'KEY-VALUE'

    assert_equal ::DarkSky.key, 'KEY-VALUE'
  end

  def test_cannot_set
    ::DarkSky.config key: 'KEY-VALUE'
    assert_raises { ::DarkSky.key = 'NEW-VALUE' }
  end
end
