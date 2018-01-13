# DarkSky

[![Gem version](https://img.shields.io/gem/v/darksky-api.svg)](https://rubygems.org/gems/darksky-api)
[![Build sttatus](https://api.travis-ci.org/jhpratt/darksky-api.svg?branch=master)](https://travis-ci.org/jhpratt/darksky-api)
[![Documentation](https://img.shields.io/badge/docs-rubydoc-blue.svg)](http://www.rubydoc.info/gems/darksky-api)
[![Downloads](https://img.shields.io/gem/dt/darksky-api.svg)](https://rubygems.org/gems/darksky-api)
[![License](https://img.shields.io/github/license/jhpratt/darksky-api.svg)](https://github.com/jhpratt/darksky-api/blob/master/LICENSE.txt)

Disclaimer: This gem has no affiliation with DarkSky. It is an independent way to interact with its API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'darksky-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install darksky-api

## Usage

### DarkSky

After importing DarkSky (`require 'darksky-api'`), you will need to configure it with some settings. All arguments are keyword arguments.

To configure DarkSky, you'll need to call `DarkSky.confg` with the kwargs below.

**Current kwargs**

| kwarg | purpose                 | default    |
|-------|-------------------------|------------|
| key   | secret key from DarkSky | *required* |

### DarkSky::Location

This library stores data *by location*. As such, you'll need to instantiate the `Location` class for each place you want data from. The required parameter is an array of the latitude and longitude.

To instantiate a Location: `loc = DarkSky::Location.new [lat, long]`

Optional kwargs:

| kwarg            | options                                         | default |
|------------------|-------------------------------------------------|---------|
| `cache_duration` | any positive number (in seconds)                | 300     |
| `units`          | `:auto`<br>`:si`<br>`:us`<br>`:uk`<br>`:canada` | `:auto` |
| `language`       | any supported by DarkSky                        | `en`    |

After you've configured `DarkSky` and created a `Location`, you're all set to start using the data! By default, the cache duration is 5 minutes, so anything you do within that timeframe only results in a single request.

To get data about the current time, use the `current` namespace. Here's all the operations defined in that namespace:

    apparent_temperature (aliased as wind_chill, heat_index, feels_like)
    clear?
    cloud_cover
    cloudy?
    dew_point
    foggy?
    humidity
    icon
    nearest_storm_bearing
    nearest_storm_bearing_text
    nearest_storm_distance
    ozone
    precip_intensity
    precip_intensity_text
    precip_probability
    precip_type
    pressure
    rainy?
    sleet?
    snowy?
    summary
    temperature
    uv_index
    visibility
    wind_bearing
    wind_bearing_text
    wind_gust
    wind_speed
    windy?

Example: How do you get the current temperature (actual and apparent) in New York City?

```ruby
require 'darksky-api'
DarkSky.config 'KEY-VALUE'

nyc = DarkSky::Location.new [40.7828687, -73.9675438]
puts "temperature: #{nyc.current.temperature}" # actual air temperature
puts "feels like: #{nyc.current.feels_like}" # apparent temperature
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [jhpratt/darksky-api](https://github.com/jhpratt/darksky-api). Creating a pull request implies you are releasing you code under the license stated below.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
