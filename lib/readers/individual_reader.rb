module ChurchCommunityBuilder

  class IndividualReader < ApiReader

    # Constructor.
    #
    # @param person_id The ID of the user to load.
    def initialize(individual_id)
    	@url_data_params = {srv: "individual_profile_from_id", individual_id: individual_id}
    end

  end

end
