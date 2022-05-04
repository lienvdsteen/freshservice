# frozen_string_literal: true

module Freshservice
  module Configuration
    VALID_OPTIONS_KEYS = %i[domain api_key api_version].freeze
    attr_accessor(*VALID_OPTIONS_KEYS)

    # Sets all configuration options to their default values
    # when this module is extended.
    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def config
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Resets all configuration options to the defaults.
    def reset
      self.domain = ENV.fetch("FRESH_SERVICE_DOMAIN", nil)
      self.api_key = ENV.fetch("FRESH_SERVICE_API_KEY", nil)
      self.api_version = "v2"
    end
  end
end
