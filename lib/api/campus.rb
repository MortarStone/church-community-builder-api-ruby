module ChurchCommunityBuilder

  include Enumerable

  class Campus < ApiObject

  	ccb_attr_accessor :id,
											:name,
											:active,
											:creator,
											:modifier,
											:created,
											:modified

    def initialize(json_data = nil, options = {})

      # When we initialize from CampusReader, the "Campus" is buried
      if json_data["ccb_api"].nil?
      	campus_json = json_data
      else
      	campus_json = json_data["ccb_api"]["response"]["campuses"]["campus"]
      end
      
      initialize_from_json_object(campus_json) unless campus_json.nil?

    end
  end

end
