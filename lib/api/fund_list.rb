module ChurchCommunityBuilder

  class FundList

    include Enumerable

    attr_reader :request_data,
                :response_data,
                :service,
                :individuals,
                :count,
                :individual_array,
                :json_data #for debugging


    def initialize(json)
      @json_data = json["ccb_api"]
      @request_data = @json_data["request"]
      @response_data = @json_data["response"]
      @service = @response_data["service"] #CCB service type accessed

      @funds  = @response_data['transaction_detail_types']

      @count = @funds["count"].to_i #number of records

      # if @funds['transaction_detail_type'] is a single item, it will be returned
      # as a Hash, rather than a single element Array, containing the Hash.
      #
      if @funds["transaction_detail_type"].is_a?(Array)
        @fund_array = @funds["transaction_detail_type"]

      elsif @funds["transaction_detail_type"].is_a?(Hash)
        @fund_array = []
        @fund_array << @funds["transaction_detail_type"] #array of each fund
      end

    end

    def all_funds
      return [] unless @fund_array
      @fund_array.collect { |fund| fund['name'] }
    end

    def ids
      (@fund_array.collect { |fund| fund['id'] }).uniq
    end

    def [](index)
      Fund.new( @fund_array[index] ) if @fund_array and @fund_array[index]
    end


    # This method is needed for Enumerable.
    def each &block
      @fund_array.each{ |fund| yield( Fund.new(fund) )}
    end


    def empty?
      self.count == 0 ? true : false
    end

  end

end
