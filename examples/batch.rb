#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/ccb_api.rb'

# Load batch by id
batch_1 = ChurchCommunityBuilder::Search.search_for_batch_by_id(469)

# Pull TransactionList from given Batch
trans_list_1 = ChurchCommunityBuilder::TransactionList.new(batch_1.transactions)

# Search for transactions by date
start_date = "2013-05-03"
end_date = nil #optional
batch_2 = ChurchCommunityBuilder::Search.search_for_batch_by_date_range(start_date,end_date)

# Create MergeableTransactionList, and load all transactions from batch_2 into it
mtl = ChurchCommunityBuilder::MergeableTransactionList.new

batch_2.each do |batch|
	trans_list = ChurchCommunityBuilder::TransactionList.new(batch.transactions)
	mtl.add(trans_list)
end

puts mtl.all_names

# Create MergeableIndividualList, and lookup all Individuals from mtl.
individual_list = ChurchCommunityBuilder::MergeableIndividualList.new

mtl.each do |transaction|
	individual = ChurchCommunityBuilder::Individual.load_by_id(transaction.individual_id)
	individual_list.add(individual)
end

puts "********************************************************************"
# Batch reporting
individual_list = ChurchCommunityBuilder::MergeableIndividualList.new

mtl.each do |transaction|
	individual = ChurchCommunityBuilder::Individual.load_by_id(transaction.individual_id)

	puts transaction.date + "\t" +
			 individual.family_name + "\t" +
	     individual.full_name + "\t" +
			 "$" + transaction.amount.to_s #unless transaction.multiple_transactions?
	puts transaction.fund_id.to_s + "\t" +
			 transaction.fund_name.to_s + "\t" +
			 transaction.payment_type + "\t" +
			 transaction.check_number.to_s #check_number will be nil if not paid by check
	puts "********************************************************************"
end
