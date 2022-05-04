# frozen_string_literal: true

module Freshservice
  class OnboardingRequests < API
    def self.all(params = {})
      get("onboarding_requests", params)
    end

    def self.find(id)
      get("onboarding_requests/#{id}")
    end

    def self.create(params)
      post("onboarding_requests", {fields: params})
    end

    def self.form_fields
      get('onboarding_requests/form')
    end
  end
end
