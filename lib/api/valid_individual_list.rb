module ChurchCommunityBuilder

	# A ValidIndividualList is returned when querying CCB for 'valid_individuals'
	# A ValidIndividualList is largely metadata about the individual,
	# as well as the inviduals ID.  From here, an IndividualList can be built.
	#
	class ValidIndividualList

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

			@individuals  = @response_data['valid_individuals']

			@count = @individuals["count"].to_i #number of records
			@individual_array = @individuals['valid_individual'] #array of each individual
		end

    def [](index)
      ValidIndividual.new( @individual_array[index] ) if @individual_array and @individual_array[index]
    end


    # This method is needed for Enumerable.
    def each &block
      @individual_array.each{ |individual| yield( ValidIndividual.new(individual) )}
    end


    def empty?
      self.count == 0 ? true : false
    end

	end

end