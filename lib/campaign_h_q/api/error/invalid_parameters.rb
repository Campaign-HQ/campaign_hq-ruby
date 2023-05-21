# frozen_string_literal: true

module CampaignHQ
  class API
    class Error < StandardError
      class InvalidParameters < Error
      end
    end
  end
end
