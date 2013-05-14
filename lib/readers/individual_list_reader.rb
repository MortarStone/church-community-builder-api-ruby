module ChurchCommunityBuilder


  # This reader works with both Individual List and ValidIndividualList
  #
  class IndividualListReader < ApiReader

    # Constructor.
    #
    def initialize(options = {})
      filter = options[:filter]

      @url_data_params = options[:url_data_params]
      @url_data_params.merge!({:filter => filter}) if filter
    end

  end

end