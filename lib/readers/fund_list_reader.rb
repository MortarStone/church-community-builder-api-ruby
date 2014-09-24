module ChurchCommunityBuilder

  class FundListReader < ApiReader

    # Constructor.
    #
    # @param individual_id The ID of the user to load.
    def initialize
      @url_data_params = {srv: "transaction_detail_type_list"}
    end

  end

end
