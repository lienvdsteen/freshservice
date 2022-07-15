# frozen_string_literal: true

module Freshservice
  class Requesters < API
    def self.all(params = { per_page: 100 })
      get("requesters", params)['requesters']
    end

    def self.find(id)
      get("requesters/#{id}")
    end
  end
end
