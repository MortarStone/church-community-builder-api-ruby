gem 'typhoeus','= 0.5.1'
require 'typhoeus'
require 'yaml'
require 'json'
require 'xmlsimple'
require 'active_support/core_ext'

# The path to the lib directory.
CCB_LIB_DIR = File.dirname(__FILE__)

require File.dirname(__FILE__) + '/auto_load.rb'

require File.dirname(__FILE__) + '/common.rb'

CCB_ENV = 'production' unless defined?(CCB_ENV)

# This class is meant to be a wrapper ChurchCommunityBuilder API
module ChurchCommunityBuilder

  class AdminApi
    class << self
      attr_reader :api_key, :api_token
    end
    
    def self.connect(admin_api_key, admin_api_token)
      raise ChurchCommunityBuilderExceptions::UnableToConnectToChurchCommunityBuilder.new('Key and Token cannot be nil.') if admin_api_key.nil? or admin_api_token.nil?
      @api_key = admin_api_key
      @api_token = admin_api_token
    end

  end

end
