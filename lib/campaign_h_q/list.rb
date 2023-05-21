# frozen_string_literal: true
require 'campaign_h_q/contact'
require 'campaign_h_q/api'
require 'active_model/naming'
require 'active_model/validations'
require 'active_model/conversion'

module CampaignHQ
  class List
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_reader :attributes

    def initialize(params = {})
      @attributes = params
    end

    def self.create(params = {})
      new(params).tap(&:save)
    end

    def save
      valid? && persist!
    end

    def as_json
      attributes
    end

    def id
      attributes['id']
    end

    private

    def create
      @attributes = api.post(base_url, attributes).body
    end

    def persisted?
      id.present?
    end

    def new_record?
      id.nil?
    end

    def persist!
      create unless persisted?
    end

    def api
      API.new(CampaignHQ.configuration.api_key)
    end

    def base_url
      '/api/v1/lists'
    end

    def url
      "/api/v1/lists/#{id}"
    end
  end
end
