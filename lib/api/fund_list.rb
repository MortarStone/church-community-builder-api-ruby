module ChurchCommunityBuilder

  class FundList < ApiObject

    include Enumerable

    attr_reader :count,
                :funds_array,
                :json_data #for debugging                

    def initialize(json)
      #funds_json = json_data['ccb_api']['response']['transaction_detail_types']['transaction_detail_type']
      @json_data = json['ccb_api']
      funds  = @json_data['response']['transaction_detail_types']
      @count = funds['count'].to_i #number of records

      # if funds['transaction_detail_type'] is a single item, it will be returned
      # as a Hash, rather than a single element Array, containing the Hash.
      if funds['transaction_detail_type'].is_a?(Array)
        @funds_array = funds['transaction_detail_type']
      elsif funds['transaction_detail_type'].is_a?(Hash)
        @funds_array = []
        @funds_array << funds['transaction_detail_type'] #array of each funds
      end
    end

    def all_names
      return [] unless @funds_array
      @funds_array.collect { |fund| fund['name'] }
    end

    def ids
      (@funds_array.collect { |fund| fund['id'].to_i }).uniq
    end

    def [](index)
      Fund.new( @funds_array[index] ) if @funds_array and @funds_array[index]
    end


    # This method is needed for Enumerable.
    def each &block
      @funds_array.each{ |fund| yield( Fund.new(fund) )}
    end


    def empty?
      @funds_array.size == 0 ? true : false
    end

  end

end