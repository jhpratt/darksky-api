require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'darksky-api'

require 'minitest/autorun'

::DarkSky.config key: ENV['DARKSKY_KEY']
$location = ::DarkSky::Location.new [45, -90]

module Boolean; end
class TrueClass; include Boolean; end
class FalseClass; include Boolean; end

module NullableString; end
class String; include NullableString; end
class NilClass; include NullableString; end

module NullableTime; end
class Time; include NullableTime; end
class NilClass; include NullableTime; end

module NullableNumeric; end
class Numeric; include NullableNumeric; end
class NilClass; include NullableNumeric; end
