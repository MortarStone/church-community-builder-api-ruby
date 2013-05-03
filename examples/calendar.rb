#!/usr/bin/env ruby

require 'json'
require 'yaml'
require 'typhoeus'
require 'active_support/core_ext'

y = YAML.load(File.read("config/ccb.yml"))
resp1 = Typhoeus::Request.get(y["url"], 
															params: {srv: "public_calendar_listing",
																			 date_start: "2008-11-25", 
																			 #date_end: "2008-12-31"
																			 }, 
																       username: y["username"], 
																       password: y["password"]
																       )
jresp1 = JSON.parse(Hash.from_xml(resp1.body).to_json)
puts jresp1.inspect
