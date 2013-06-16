module ChurchCommunityBuilder

  class IndividualList

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

      @individuals  = @response_data['individuals']

      @count = @individuals["count"].to_i #number of records

      # if @individuals['individual'] is a single item, it will be returned
      # as a Hash, rather than a single element Array, containing the Hash.
      #
      if @individuals["individual"].is_a?(Array)
        @individual_array = @individuals["individual"]
      
      elsif @individuals["individual"].is_a?(Hash)
        @individual_array = []
        @individual_array << @individuals["individual"] #array of each individual
      end

    end

    def all_names
      return [] unless @individual_array
      @individual_array.collect { |individual| [individual['first_name'], individual['last_name']].join(' ') }
    end

    def ids
      (@individual_array.collect { |individual| individual['id'] }).uniq
    end

    def [](index)
      Individual.new( @individual_array[index] ) if @individual_array and @individual_array[index]
    end


    # This method is needed for Enumerable.
    def each &block
      @individual_array.each{ |individual| yield( Individual.new(individual) )}
    end


    def empty?
      self.count == 0 ? true : false
    end

  end

end
