#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/ccb_api.rb'

# IndividualList is returned from Search
results_1 = ChurchCommunityBuilder::Search.search_for_person_by_name("w")
puts results_1.all_names

# Individual is created here
results_2 = ChurchCommunityBuilder::Individual.load_by_id(663)
puts results_2.first_name
puts results_2.last_name
