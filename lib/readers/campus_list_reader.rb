module ChurchCommunityBuilder

  class CampusListReader < ApiReader

    # Constructor.
    #
    def initialize(options = {}, cacher = nil)
      filter = options[:filter]
      @url_data_params = options[:url_data_params]

      @url_data_params.merge!({:filter => filter}) if filter

    end

  end

end