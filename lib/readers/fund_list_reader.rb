module ChurchCommunityBuilder

  class FundListReader < ApiReader

    # Constructor.
    #
    def initialize(options = {})
      @url_data_params = {srv: 'transaction_detail_type_list'}
    end

  end

end