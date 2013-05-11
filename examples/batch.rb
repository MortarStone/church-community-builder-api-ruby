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

mtl = ChurchCommunityBuilder::MergeableTransactionList.new

batch_2.each do |batch|
	trans_list = ChurchCommunityBuilder::TransactionList.new(batch.transactions)
	mtl.add(trans_list)
end
