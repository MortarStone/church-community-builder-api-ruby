module ChurchCommunityBuilder

	class Search

    def self.search_for_person_by_name(last_name = nil,first_name = nil)
      options = {:url_data_params => {srv: "individual_search", 
      																last_name: last_name,
      																first_name: first_name
      																} 
                 # :url_data_path => "/v1/People/Search"
                }
      reader = ChurchCommunityBuilder::IndividualListReader.new(options)
      IndividualList.new(reader.load_feed)
    end

	end

end
