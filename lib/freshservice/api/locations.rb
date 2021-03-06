# frozen_string_literal: true

module Freshservice
  class Locations < API
    def self.all(params = {})
      get("locations", params)
    end

    def self.find(id)
      get("locations/#{id}")
    end
  end
end
