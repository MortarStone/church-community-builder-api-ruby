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
  
        return data
    end

    private

    def _xml2json(xml)
      Hash.from_xml(xml).to_json
    end

  end

end