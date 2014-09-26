#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/ccb_api'
require File.dirname(__FILE__) + '/api_connect.rb'
require 'pp'

reader    = ChurchCommunityBuilder::FundListReader.new
fund_list = ChurchCommunityBuilder::FundList.new(reader.load_feed)

p fund_list.count

fund_list.each do |fund|
  p fund
end