#!/usr/bin/env ruby

require 'debugger'
require File.dirname(__FILE__) + '/../lib/ccb_api'


start_date = "2013-04-01"
end_date = "2013-04-21"
batch_list = ChurchCommunityBuilder::Search.search_for_batch_by_date_range(start_date, end_date)

batch_list.each do |batch|
  if batch.has_transactions?
    transaction_list = ChurchCommunityBuilder::TransactionList.new(batch.transactions)

    puts "-----------------------------"
    transaction_list.each do |transaction|
      # Info to use
      puts "Campus: #{transaction.campus_name}"
      puts "Amount: #{transaction.amount}"
      puts "Donor: #{transaction.individual_id}"
      puts "Entered On: #{transaction.date}"
      puts "Fund: #{transaction.fund_name}"
      puts "Instrument Type: #{transaction.payment_type}"
      puts "-----------------------------"

      individual = ChurchCommunityBuilder::Individual.load_by_id(transaction.individual_id)

      puts '#########################'
      puts "First name: #{individual.first_name}"
      puts "Last name: #{individual.last_name}"
      puts "Full name: #{individual.full_name}"
      puts "Campus name: #{individual.campus_name}"
      puts "Donor ID: #{individual.giving_number}"
      puts "Family ID: #{individual.family_id}"
      puts "Address: #{individual.home_address}"
      puts "Phone number 1: #{individual.home_phone}"
      puts "Phone number 2: #{individual.mobile_phone}"
      puts "Date of Birth: #{individual.birthday}"
      puts "Gender: #{individual.gender}"
      puts "Email: #{individual.email}"
      puts "Marital status: #{individual.marital_status}"
      puts '#########################'
    end

  else
    puts "Batch #{batch.id} has no transactions"
  end
end
