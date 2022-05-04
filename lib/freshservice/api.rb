# frozen_string_literal: true

require "rest-client"
require "json"
require "uri"
require "base64"

module Freshservice
  class API
    def self.get(endpoint, params = {})
      url = build_url(endpoint, params)
      response = RestClient.get(url, headers)

      JSON.parse(response.body)
    end

    def self.paginated_get(endpoint, params = {}, keyword = "results")
      url = build_url(endpoint, params)
      results = []

      loop do
        result = RestClient.get(url, headers)
        parsed_result = JSON.parse(result.body)
        results.concat(parsed_result[keyword])
        url = parsed_result["next"]
        break if url.nil?
      end

      results
    end

    def self.post(endpoint, params = {})
      url = build_url(endpoint)
      response = RestClient.post(
        url,
        params.to_json,
        headers
      )
      p response
      response.code
    end

    def self.delete(endpoint)
      url = build_url(endpoint)
      response = RestClient.delete(url)
      response.code
    end

    def self.put(endpoint, params = {})
      url = build_url(endpoint)
      response = RestClient.put(
        url,
        params.to_json,
        headers
      )
      response.code
    end

    def self.headers
      {
        "Content-Type" => "application/json",
        Authorization: "Basic #{Base64.strict_encode64("#{Freshservice.api_key}:X")}"
      }
    end

    def self.build_url(endpoint, params = {})
      url = "https://#{Freshservice.domain}.freshservice.com/api/#{Freshservice.api_version}/#{endpoint}"
      url += "?#{URI.encode_www_form(params)}" unless params.empty?

      url
    end
  end
end
