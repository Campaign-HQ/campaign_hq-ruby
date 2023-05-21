# frozen_string_literal: true
require 'net/http'
require 'json'
require 'campaign_h_q/api/response'

module CampaignHQ
  class API
    HOST = 'api.campaignhq.co'
    PORT = 443
    HEADERS = {
      'Content-Type' => 'application/json'
    }.freeze

    def initialize(api_key)
      @http = Net::HTTP.new HOST, PORT
      @http.use_ssl = true
      @api_key = api_key
      @auth_headers = HEADERS.merge(
        'Authorization' => "Bearer #{@api_key}"
      )
    end

    def get(path)
      Response.new @http.get(path, @auth_headers)
    end

    def post(path, body = {})
      Response.new @http.post(path, body.to_json, @auth_headers)
    end

    def patch(path, body = {})
      Response.new @http.patch(path, body.to_json, @auth_headers)
    end

    def put(path, body = {})
      Response.new @http.put(path, body.to_json, @auth_headers)
    end

    def delete(path)
      Response.new @http.delete(path, @auth_headers)
    end
  end
end
