module ChurchCommunityBuilder

	class IndividualList
		include Enumerable

		def initialize(json)
			@json_data = json["ccb_api"]
			@request_data = @json_data["request"]
			@response_data = @json_data["response"]
			@service = @response_data["service"] #CCB service type accessed

			@individuals  = @response_data['individuals']

			@count = @individuals["count"].to_i #number of records
			@individual_array = @individuals["individual"] #array of each individual
		end


    def [](index)
      Individual.new( @individual_array['individual'][index] ) if @individual_array['individual'] and @individual_array['individual'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @individual_array['individual'].each{ |individual| yield( Individual.new(individual) )}
    end


    def empty?
      self.count == 0 ? true : false
    end

	end

end
