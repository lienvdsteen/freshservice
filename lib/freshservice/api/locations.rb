# frozen_string_literal: true

module Freshservice
  class Locations < API
    def self.all(params = {})
      paginated_get("locations", params)
    end

    def self.find(id)
      get("locations/#{id}")
    end
  end
end
