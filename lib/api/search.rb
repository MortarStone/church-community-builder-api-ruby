module ChurchCommunityBuilder

  class Search

    # Returns a list of all individual profiles in the Church Community Builder system.
    def self.all_individual_profiles
      options = {url_data_params: {srv: 'individual_profiles'}}
      reader = IndividualListReader.new(options)
      IndividualList.new(reader.load_feed)
    end    

    # Search CCB for individuals based off of the search parameters
    # Note:
    # Searches are performed as a LIKE query in the CCB database. 
    # If the value provided for the criterion is found anywhere in the field,
    # it will be considered a match.
    def self.search_for_person_by_name(last_name = nil,first_name = nil)
      options = {url_data_params: {srv: 'individual_search', last_name: last_name, first_name: first_name}}
      reader = IndividualListReader.new(options)
      IndividualList.new(reader.load_feed)
    end

    # Returns a list of all individuals in the Church Community Builder system.
    def self.search_for_all_valid_individuals
      options = {url_data_params: {srv: 'valid_individuals'}}
      reader = IndividualListReader.new(options)
      ValidIndividualList.new(reader.load_feed)
    end

    # Leaving 'modified_since' as 'nil' will return all
    # batches in the system.
    #
    # Specifying a date will return all batches created
    # or modified since that date.
    #
    # Date format should be YYYY-MM-DD
    def self.search_for_batch_by_date(modified_since = nil)
      options = {url_data_params: {srv: 'batch_profiles', modified_since: modified_since} }
      reader = BatchListReader.new(options)
      BatchList.new(reader.load_feed)
    end

    # Returns a BatchList of all batches posted in specified date range.
    # End date is optional.
    #
    # Date format should be YYYY-MM-DD
    def self.search_for_batch_by_date_range(start_date, end_date = nil)
      options = {url_data_params: {srv: 'batch_profiles_in_date_range', date_start: start_date, date_end: end_date}}
      options[:url_data_params].delete(:date_end) if end_date.nil?
      reader = BatchListReader.new(options)
      BatchList.new(reader.load_feed)
    end

    def self.search_for_batch_by_id(batch_id)
      # options = {:url_data_params => {srv: "batch_profile_from_id", 
      #                                 id: batch_id
      #                                 } 
      #           }
      reader = BatchReader.new(batch_id)
      Batch.new(reader.load_feed)
    end

    # This is currently undocumented, but found via spelunking
    #
    def self.search_for_all_campuses
      options = {url_data_params: {srv: 'campus_list'}}
      reader = CampusListReader.new(options)
      CampusList.new(reader.load_feed)
    end

    # This is currently undocumented, but found via spelunking
    #
    def self.search_for_all_funds
      reader = FundListReader.new
      FundList.new(reader.load_feed)
    end

  end

end
