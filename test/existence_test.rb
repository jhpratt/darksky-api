require 'test_helper'

class ExistenceTest < Minitest::Test
  def test_version_number_exists
    refute_nil ::DarkSky::VERSION
  end
end
