#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/ccb_api'
require 'pp'

campus_list = ChurchCommunityBuilder::Search.search_for_all_campuses

puts campus_list.all_names
puts campus_list.ids

campus_0 = campus_list[0]

pp campus_0
