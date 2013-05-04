module ChurchCommunityBuilder

  # This adapter is the standard for all loading objects.
  class ApiReader
    attr_reader :headers

    # Constructor
    # def initialize
    # end

    # Loads the list
    #
    # @return the data loaded in a JSON object.
    def load_feed
   
        @url_data_params ||= {}
        response = ChurchCommunityBuilder::admin_request(:get, @url_data_params)
        data = JSON.parse( _xml2json(response.body) )
        @headers = response.headers
        @cacher.save_data(@class_key, data) unless @cacher.nil?
  
        return data
    end

    # Returns either the value of the x-city-ratelimit-limit-by-ip header or
    # x-city-ratelimit-limit-by-account header, whichever is lower.
    # def rate_limit
    #   if @headers
    #     [@headers['x-city-ratelimit-limit-by-ip'].to_i, @headers['x-city-ratelimit-limit-by-account'].to_i].min
    #   end
    # end

    # # Returns either the value of the x-city-ratelimit-remaining-by-ip header or
    # # x-city-ratelimit-remaining-by-account header, whichever is lower.
    # def rate_limit_remaining
    #   if @headers
    #     [@headers['x-city-ratelimit-remaining-by-ip'].to_i, @headers['x-city-ratelimit-remaining-by-account'].to_i].min
    #   end
    # end
    private

    def _xml2json(xml)
      Hash.from_xml(xml).to_json
    end

  end

end