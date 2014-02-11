module ChurchCommunityBuilder

  class GroupReader < ApiReader

    # Constructor.
    #
    # @param group_id The ID of the group to load.
    def initialize(group_id)
      @url_data_params = {srv: "group_profile_from_id", id: group_id}
    end

  end

end
