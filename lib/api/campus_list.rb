module ChurchCommunityBuilder

	class CampusList

		include Enumerable

		attr_reader :request_data,
								:response_data,
								:service,
								:individuals,
								:count,
								:campus_array,
								:json_data #for debugging
								

		def initialize(json)
			@json_data = json["ccb_api"]
			@request_data = @json_data["request"]
			@response_data = @json_data["response"]
			@service = @response_data["service"] #CCB service type accessed

			@campuses  = @response_data['campuses']

			@count = @campuses["count"].to_i #number of records

      # if @campuses['campus'] is a single item, it will be returned
      # as a Hash, rather than a single element Array, containing the Hash.
      #
      if @campuses["campus"].is_a?(Array)
        @campus_array = @campuses["campus"]
      
      elsif @campuses["campus"].is_a?(Hash)
        @campus_array = []
        @campus_array << @campuses["campus"] #array of each campus
      end

		end

    def all_names
      return [] unless @campus_array
      @campus_array.collect { |campus| campus['name'] }
    end

    def ids
      (@campus_array.collect { |campus| campus['id'] }).uniq
    end

    def [](index)
      Campus.new( @campus_array[index] ) if @campus_array and @campus_array[index]
    end


    # This method is needed for Enumerable.
    def each &block
      @campus_array.each{ |campus| yield( Campus.new(campus) )}
    end


    def empty?
      @campus_array.size == 0 ? true : false
    end

	end

end