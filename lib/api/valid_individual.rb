module ChurchCommunityBuilder

  include Enumerable

	# A ValidIndividual is the data returned when querying CCB for 'valid_individuals'
	# A ValidIndividual is largely metadata about the individual,
	# as well as the inviduals ID.  From the ID, the individual can be retrieved.
	#
  class ValidIndividual < ApiObject

  	ccb_attr_accessor :id,
											:active,
											:creator,
											:modifier,
											:created,
											:modified


    def initialize(json_data = nil, options = {})
      #@writer_object = PersonWriter
      
      # When we initialize from IndividualReader, the "Individual" is buried
      if json_data["ccb_api"].nil?
      	individual_json = json_data
      else
      	individual_json = json_data["ccb_api"]["response"]["individuals"]["individual"]
      end
      
      initialize_from_json_object(individual_json) unless individual_json.nil?

    end

    # def self.load_by_id(individual_id)
    #   reader = IndividualReader.new(individual_id)
    #   self.new(reader.load_feed)
    # rescue
    #   nil
    # end


  end

end