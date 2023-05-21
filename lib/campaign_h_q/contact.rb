# frozen_string_literal: true

require 'active_model/naming'
require 'active_model/validations'
require 'active_model/conversion'

module CampaignHQ
  # Contact of a list
  class Contact
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_reader :attributes, :list_id, :email

    validates :list_id, :email, presence: true

    def initialize(list_id, params = {})
      @list_id = list_id
      @attributes = params
      @email = @attributes[:email]
    end

    def self.create(list_id, params = {})
      new(list_id, params).tap(&:save)
    end

    def save
      valid? && persist!
    end

    def id
      attributes['id']
    end

    private

    def create
      @attributes = api.post("#{base_url}/create_or_update", attributes).body
    end

    def persist!
      create unless persisted?
    end

    def persisted?
      id.present?
    end

    def new_record?
      id.nil?
    end

    def api
      API.new(CampaignHQ.configuration.api_key)
    end

    def base_url
      "/api/v1/lists/#{list_id}/contacts"
    end
  end
end
