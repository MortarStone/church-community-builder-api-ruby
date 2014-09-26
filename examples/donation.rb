#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/ccb_api'
require File.dirname(__FILE__) + '/api_connect.rb'
require 'pp'

reader    = ChurchCommunityBuilder::FundListReader.new
fund_list = ChurchCommunityBuilder::FundList.new(reader.load_feed)

fund      = fund_list[0]
p fund.id

person = ChurchCommunityBuilder::Search.search_for_person_by_email "taylor@simpledonation.com"
p person[0].id


donation    = ChurchCommunityBuilder::DonationWriter.new(amount: 269.00, coa_category_id: fund.id, individual_id: person[0].id).save

p donation
