#!/usr/bin/env ruby
require 'debugger'
require File.dirname(__FILE__) + '/../lib/ccb_api'
require File.dirname(__FILE__) + '/api_connect.rb'

ChurchCommunityBuilder

# IndividualList
profiles = ChurchCommunityBuilder::Search.all_individual_profiles

