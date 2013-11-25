module ChurchCommunityBuilder

  class BatchList

    include Enumerable

    attr_reader :request_data,
                :response_data,
                :service_action,
                :availability,
                :batches,
                :count,
                :batch_array,
                :json_data #for debugging

    def initialize(json)
      @json_data = json['ccb_api']
      @request_data = @json_data['request']

      # This is needed for now to account for the two different formats
      @batches = if @json_data.has_key?('response')
        @response_data = @json_data['response']      
        @service = @response_data['service_action'] #CCB service type accessed
        @availability = @response_data['availability']
        # @batches = @response_data['batches']
        @response_data['batches']
      else
        @json_data['batches']
      end

      @count = @batches['count'].to_i #number of records
      @batch_array = @batches['batch'].class == Array ? @batches['batch'] : [@batches['batch']].compact #array of each batch
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