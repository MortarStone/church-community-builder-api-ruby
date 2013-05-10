#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/ccb_api.rb'

# IndividualList is returned from Search
results_1 = ChurchCommunityBuilder::Search.search_for_person_by_name("w")
puts results_1.all_names

# Individual is created here
results_2 = ChurchCommunityBuilder::Individual.load_by_id(663)
puts results_2.first_name
puts results_2.last_name

# Grab all individuals
all_valid_individuals = ChurchCommunityBuilder::Search.search_for_all_valid_individuals

# all individuals is a ValidIndividualList.
# we can use this to build an IndividualList
mil = ChurchCommunityBuilder::MergeableIndividualList.new

all_valid_individuals.each do |vi|
	individual = ChurchCommunityBuilder::Individual.load_by_id(vi.id)
	mil.add(individual)
end
