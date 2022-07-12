# frozen_string_literal: true

module Freshservice
  class ServiceRequests < API
    def self.create(service_id, params)
      post("service_catalog/items/#{service_id}/place_request", params)
    end
  end
end
