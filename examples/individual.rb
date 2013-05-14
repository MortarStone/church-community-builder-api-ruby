#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/ccb_api'

# IndividualList is returned from Search
x_names = ChurchCommunityBuilder::Search.search_for_person_by_name("x")
puts x_names.all_names

# Individual is created here
individual = ChurchCommunityBuilder::Individual.load_by_id(2)
puts "Name ==> " + individual.full_name
puts "Address: "
puts individual.mailing_address.street_address + "\n" +
		 individual.mailing_address.city + ", " + 
		 individual.mailing_address.state + " " +
		 individual.mailing_address.zip

puts "Phone ==>" + individual.contact_phone
puts "Email ==> " + individual.email

puts "Gender ==> " + individual.gender
puts "Birthday ==> " + individual.birthday
puts "Marital Status ==> " + individual.marital_status

puts "Family Name ==> " + individual.family_name
puts "Campus Name ==> " + individual.campus_name

# Grab all individuals
all_valid_individuals = ChurchCommunityBuilder::Search.search_for_all_valid_individuals

# all individuals is a ValidIndividualList.
# we can use this to build an IndividualList
mil = ChurchCommunityBuilder::MergeableIndividualList.new

all_valid_individuals.each do |vi|
	individual = ChurchCommunityBuilder::Individual.load_by_id(vi.id)
	mil.add(individual)
end
