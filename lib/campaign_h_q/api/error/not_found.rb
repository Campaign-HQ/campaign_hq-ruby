# frozen_string_literal: true

module CampaignHQ
  class API
    class Error < StandardError
      class NotFound < Error
      end
    end
  end
end
