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

  class Api
    class << self
      attr_reader :api_username, :api_password, :api_subdomain
    end
    
    def self.connect(username, password, subdomain)
      raise ChurchCommunityBuilderExceptions::UnableToConnectToChurchCommunityBuilder.new('Username, password, and subdomain cannot be nil.') if username.nil? or password.nil? or subdomain.nil?
      @api_username = username
      @api_password = password
      @api_subdomain = subdomain
      true
    end

  end

end
