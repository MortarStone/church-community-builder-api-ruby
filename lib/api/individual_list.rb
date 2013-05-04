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
			@individual_array = @individuals["individual"] #array of each individual
		end

    def all_names
      return [] unless @individual_array
      @individual_array.collect { |individual| [individual['first_name'], individual['last_name']].join(' ') }
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
