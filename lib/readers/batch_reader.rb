module ChurchCommunityBuilder

  class BatchReader < ApiReader

    # Constructor.
    #
    # @param person_id The ID of the user to load.
    def initialize(batch_id)
    	@url_data_params = {srv: "batch_profile_from_id",
													id: batch_id
													}
    end

  end

end