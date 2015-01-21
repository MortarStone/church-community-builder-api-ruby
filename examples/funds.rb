#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/ccb_api.rb'
require File.dirname(__FILE__) + '/api_connect.rb'

require 'debugger'

fund_list = ChurchCommunityBuilder::Search.search_for_all_funds

debugger
asdf=234
