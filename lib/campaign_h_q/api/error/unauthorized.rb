# frozen_string_literal: true

module CampaignHQ
  class API
    class Error < StandardError
      class Unauthorized < Error
      end
    end
  end
end
