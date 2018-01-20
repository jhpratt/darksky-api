module DarkSky
  # set required and optional class variables
  #
  # keyword arguments:
  # - **`key`** [required] ─ API key from [DarkSky](https://darksky.net/dev/account)
  #
  # @since 0.1.0
  # @return [void]
  def self.config(opts)
    defaults = {
    }
    opts = defaults.merge opts

    # required parameters
    @@key = opts.fetch(:key)
  end

  # @example
  #   DarkSky.key #=> '0f1e2d3c4b5a6978'
  # @since 0.1.0
  # @return [String] API key that was set by `.config()`
  def self.key
    @@key
  end
end
