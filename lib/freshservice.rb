# frozen_string_literal: true

require_relative "freshservice/version"
require_relative "freshservice/configuration"
require_relative "freshservice/api"
require_relative "freshservice/api/onboarding_requests"
require_relative "freshservice/api/requesters"
require_relative "freshservice/api/locations"
require_relative "freshservice/api/service_requests"

module Freshservice
  extend Configuration
end
