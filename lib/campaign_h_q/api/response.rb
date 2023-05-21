# frozen_string_literal: true

require 'campaign_h_q/api/error'
require 'campaign_h_q/api/error/invalid_parameters'
require 'campaign_h_q/api/error/unauthorized'
require 'campaign_h_q/api/error/not_found'

module CampaignHQ
  class API
    class Response
      delegate :status, :headers, to: :@raw

      def initialize(response)
        @raw = response
        raise error_class, self if error?
      end

      def status
        @raw.status
      end

      def headers
        @raw.headers
      end

      def success?
        @raw.is_a? Net::HTTPSuccess
      end

      def error?
        !success?
      end

      def body
        JSON.parse @raw.body
      end

      def error_class
        return unless error?
        case body['error']
        when 'unprocessable_entity'
          Error::InvalidParameters
        when 'unauthorized'
          Error::Unauthorized
        when 'not_found'
          Error::NotFound
        else
          Error
        end
      end
    end
  end
end
