module ChurchCommunityBuilder

  class MergeableIndividualList

    include Enumerable

    # Constructor.
    # Can initialize from another IndividualList, else will default to an emtpy list
    # which can then have other lists 'add'ed.
    #
    def initialize(individual_list = nil)
      
      if individual_list.nil?
        @individual_array = []

      else
        @individual_array = individual_list.individual_array

      end

    end

    # All the individuals in the list.
    #
    # @return array of names (first last).
    def all_names
      return [] unless @individual_array
      @individual_array.collect { |individual| [individual['first_name'], individual['last_name']].join(' ') }
    end

    alias_method :names, :all_names


    # Get the specified individual.
    #
    # @param index The index of the individual to get.
    #
    # @return [individual]
    def [](index)
      Individual.new( @individual_array[index] ) if @individual_array and @individual_array[index]
    end


    # This method is needed for Enumerable.
    def each &block
      @individual_array.each{ |individual| yield( Individual.new(individual) )}
    end
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      #@individual_array.empty?
      self.count == 0 ? true : false
    end


    # Get all the Individual ids in the list.
    #
    # @return An array of Individual ids.
    def ids
      (@individual_array.collect { |individual| individual['@id'] }).uniq
    end

    # Adds an IndividualList, MergeableIndividualList, or Individual to this list.
    #
    def add(individual_type)
      
      if individual_type.is_a?(IndividualList)
        @individual_array += individual_type.individual_array

      elsif individual_type.is_a?(MergeableIndividualList)
        @individual_array += individual_type.individual_array
      
      elsif individual_type.is_a?(Individual)
        @individual_array << JSON.parse( individual_type.to_json )

      end

    end   

    alias_method :merge, :add

    def count
      @individual_array.size
    end

    def empty?
      self.count == 0 ? true : false
    end

  end
    
end