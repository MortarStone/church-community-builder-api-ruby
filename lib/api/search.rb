module ChurchCommunityBuilder

	class Search

    def self.search_for_person_by_name(last_name = nil,first_name = nil)
      options = {:url_data_params => {srv: "individual_search", 
      																last_name: last_name,
      																first_name: first_name
      																} 
                }
      reader = IndividualListReader.new(options)
      IndividualList.new(reader.load_feed)
    end

    # Leaving 'modified_since' as 'nil' will return all
    # batches in the system.
    #
    # Specifying a date will return all batches created
    # or modified since that date.
    #
    # Date format should be YYYY-MM-DD
    def self.search_for_batch_by_date(modified_since = nil)
      options = {:url_data_params => {srv: "batch_profiles", 
                                      modified_since: modified_since
                                      } 
                }
      reader = BatchListReader.new(options)
      BatchList.new(reader.load_feed)
    end

    # Returns a BatchList of all batches posted in specified date range.
    # End date is optional.
    #
    # Date format should be YYYY-MM-DD
    def self.search_for_batch_by_date_range(start_date, end_date = nil)
      options = {:url_data_params => {srv: "batch_profiles_in_date_range", 
                                      start_date: start_date,
                                      end_date: end_date
                                      } 
                }
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

	end

end
