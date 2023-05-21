# frozen_string_literal: true

require 'active_model'
require 'net/http'
require 'json'
require_relative 'campaign_h_q/version'

# Client for the CampaignHQ API
#
# https://campaignhq.docs.apiary.io/
module CampaignHQ
  extend ActiveSupport::Autoload

  autoload :Configuration, 'campaign_h_q/configuration'
  autoload :API, 'campaign_h_q/api'
  autoload :List, 'campaign_h_q/list'
  autoload :Contact, 'campaign_h_q/contact'

  autoload_under 'api' do
    autoload :Response, 'campaign_h_q/api/response'
    autoload :Error, 'campaign_h_q/api/error'
  end

  autoload_under 'api/error' do
    autoload :InvalidParameters, 'campaign_h_q/api/error/invalid_parameters'
    autoload :Unauthorized, 'campaign_h_q/api/error/unauthorized'
    autoload :NotFound, 'campaign_h_q/api/error/not_found'
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end
