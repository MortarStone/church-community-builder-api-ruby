module ChurchCommunityBuilder

  class GroupList

    include Enumerable

    attr_reader :request_data,
                :response_data,
                :service,
                :groups,
                :count,
                :group_array,
                :json_data #for debugging


    def initialize(json)
      @json_data = json["ccb_api"]
      @request_data = @json_data["request"]
      @response_data = @json_data["response"]
      @service = @response_data["service"] #CCB service type accessed

      @groups  = @response_data['groups']

      @count = @groups["count"].to_i #number of records

      # if @groups['group'] is a single item, it will be returned
      # as a Hash, rather than a single element Array, containing the Hash.
      #
      if @groups["group"].is_a?(Array)
        @group_array = @groups["group"]
      
      elsif @groups["group"].is_a?(Hash)
        @group_array = []
        @group_array << @groups["group"] #array of each group
      end

    end

    def all_names
      return [] unless @group_array
      @group_array.collect { |group| group['name'] }
    end

    def ids
      (@group_array.collect { |group| group['id'] }).uniq
    end

    def [](index)
      Group.new( @group_array[index] ) if @group_array and @group_array[index]
    end


    # This method is needed for Enumerable.
    def each &block
      @group_array.each{ |group| yield( Group.new(group) )}
    end


    def empty?
      self.count == 0 ? true : false
    end

  end

end
