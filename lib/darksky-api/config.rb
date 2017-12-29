module DarkSky
  # set required and optional class variables
  #
  # keyword arguments:
  # - **`key`** [required] ─ API key from [DarkSky](https://darksky.net/dev/account)
  # - **`warnings`** [optional] ─ whether or not warnings are printed (default `true`)
  #
  # @since 0.1.0
  # @return [void]
  def self.config(opts)
    defaults = {
      warnings: true
    }
    opts = defaults.merge opts

    # required parameters
    @@key = opts.fetch(:key)

    # optional parameters
    @@warnings = opts[:warnings]
  end

  # @example
  #   DarkSky.key #=> '0f1e2d3c4b5a6978'
  # @since 0.1.0
  # @return [String] API key that was set by `.config()`
  def self.key
    @@key
  end

  # @example
  #   DarkSky.warnings #=> true
  # @since 0.1.0
  # @return [boolean] whether or not warnings are printed (set in `.config()`)
  def self.warnings
    @@warnings
  end
end
