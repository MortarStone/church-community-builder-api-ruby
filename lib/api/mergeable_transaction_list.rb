module ChurchCommunityBuilder

	class MergeableTransactionList

		include Enumerable

		attr_reader :transaction_array #for debugging
								

		def initialize(transaction_list = nil)

			if transaction_list.nil?
				@transaction_array = []

			else
				@transaction_array = transaction_list.transaction_array

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

    # Get all the Transaction ids in the list.
    #
    # @return An array of Transaction ids.
    def ids
      (@transaction_array.collect { |transaction| transaction['@id'] }).uniq
    end

    # Adds an TransactionList, MergeableTransactionList, or Transaction to this list.
    #
    def add(transaction_type)
      
      if transaction_type.is_a?(TransactionList)
        @transaction_array += transaction_type.transaction_array

      elsif transaction_type.is_a?(MergeableTransactionList)
        @transaction_array += transaction_type.transaction_array
      
      elsif transaction_type.is_a?(Transaction)
        @transaction_array << JSON.parse( transaction_type.to_json )

      end

    end   

    alias_method :merge, :add

    def count
      @transaction_array.size
    end


    def empty?
      self.count == 0 ? true : false
    end

	end

end