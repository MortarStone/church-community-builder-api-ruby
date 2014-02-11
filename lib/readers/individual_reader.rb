module ChurchCommunityBuilder

  class IndividualReader < ApiReader

    # Constructor.
    #
    # @param individual_id The ID of the user to load.
    def initialize(individual_id)
    	@url_data_params = {srv: "individual_profile_from_id", individual_id: individual_id, include_inactive: true}
    end

  end

end
