module ChurchCommunityBuilder

	class TransactionList

		include Enumerable

		attr_reader :transaction_array #for debugging
								


		def initialize(json_data)
			
      # if @json_data['transaction'] is a single item, it will be returned
      # as a Hash, rather than a single element Array, containing the Hash.
      #
      if json_data["transaction"].is_a?(Array)
        @transaction_array = json_data["transaction"]
      
      elsif json_data["transaction"].is_a?(Hash)
        @transaction_array = []
        @transaction_array << json_data["transaction"] #array of each transaction
      end

		end

    def all_names
      return [] unless @transaction_array
      @transaction_array.collect { |transaction| transaction['individual'] }
    end

    def [](index)
      Transaction.new( @transaction_array[index] ) if @transaction_array and @transaction_array[index]
    end


    # This method is needed for Enumerable.
    def each &block
      @transaction_array.each{ |transaction| yield( Transaction.new(transaction) )}
    end


    def empty?
      @transaction_array.size == 0 ? true : false
    end

	end

end

# require './lib/ccb_api'
# batch = ChurchCommunityBuilder::Search.search_for_batch_by_id(469)
# trans_list = ChurchCommunityBuilder::TransactionList.new(batch.transactions)