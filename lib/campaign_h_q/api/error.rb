# frozen_string_literal: true

module CampaignHQ
  class API
    class Error < StandardError
      def initialize(response)
        @response = response
        super @response.body['message']
      end
    end
  end
end
