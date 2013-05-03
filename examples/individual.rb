#!/usr/bin/env ruby

require 'json'
require 'yaml'
require 'typhoeus'
require 'active_support/core_ext'

y = YAML.load(File.read("config/ccb.yml"))
resp1 = Typhoeus::Request.get(y["url"], 
															params: {srv: "individual_search",
																			 first_name: "*", 
																			 # last_name: "hays",
																			 # phone: "",
																			 # email: "",
																			 # street_address: "",
																			 # city: "",
																			 # state: "",
																			 # zip: ""
																			 }, 
																       username: y["username"], 
																       password: y["password"]
																       )
jresp1 = JSON.parse(Hash.from_xml(resp1.body).to_json)
puts jresp1.inspect