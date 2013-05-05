module ChurchCommunityBuilder

	class Search

    def self.search_for_person_by_name(last_name = nil,first_name = nil)
      options = {:url_data_params => {srv: "individual_search", 
      																last_name: last_name,
      																first_name: first_name
      																} 
                }
      reader = ChurchCommunityBuilder::IndividualListReader.new(options)
      IndividualList.new(reader.load_feed)
    end

    def self.search_for_batch_by_date(modified_since = nil)
      options = {:url_data_params => {srv: "batch_profiles", 
                                      modified_since: modified_since
                                      } 
                }
      reader = ChurchCommunityBuilder::BatchListReader.new(options)
      BatchList.new(reader.load_feed)
    end

	end

end
