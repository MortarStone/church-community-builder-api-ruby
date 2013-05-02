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
      # if !@cacher.nil? and !@cacher.is_cache_expired?( @class_key )
      #   data = @cacher.get_data( @class_key )
      # else
        @url_data_params ||= {}
        response = TheCity::admin_request(:get, @url_data_path, @url_data_params)
        data = JSON.parse(response.body)
        @headers = response.headers
        @cacher.save_data(@class_key, data) unless @cacher.nil?
      #end   

      return data
    end

    # Returns either the value of the x-city-ratelimit-limit-by-ip header or
    # x-city-ratelimit-limit-by-account header, whichever is lower.
    def rate_limit
      if @headers
        [@headers['x-city-ratelimit-limit-by-ip'].to_i, @headers['x-city-ratelimit-limit-by-account'].to_i].min
      end
    end

    # Returns either the value of the x-city-ratelimit-remaining-by-ip header or
    # x-city-ratelimit-remaining-by-account header, whichever is lower.
    def rate_limit_remaining
      if @headers
        [@headers['x-city-ratelimit-remaining-by-ip'].to_i, @headers['x-city-ratelimit-remaining-by-account'].to_i].min
      end
    end

  end

end