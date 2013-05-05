module ChurchCommunityBuilder

	class BatchList

		include Enumerable

		attr_reader :request_data,
								:response_data,
								:service,
								:batches,
								:count,
								:batch_array,
								:json_data #for debugging


		def initialize(json)
			@json_data = json["ccb_api"]
			@request_data = @json_data["request"]
			@response_data = @json_data["response"]
			@service = @response_data["service"] #CCB service type accessed

			@batches  = @response_data['batches']

			@count = @batches["count"].to_i #number of records
			@batch_array = @batches["batch"] #array of each batch
		end

    def all_names
      return [] unless @batch_array
      @batch_array.collect { |batch| [batch['first_name'], batch['last_name']].join(' ') }
    end

    def [](index)
      Batch.new( @batch_array[index] ) if @batch_array and @batch_array[index]
    end


    # This method is needed for Enumerable.
    def each &block
      @batch_array.each{ |batch| yield( Batch.new(batch) )}
    end


    def empty?
      self.count == 0 ? true : false
    end

	end

end