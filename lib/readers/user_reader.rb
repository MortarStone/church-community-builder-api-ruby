module ChurchCommunityBuilder

  class UserReader < ApiReader

    # Constructor.
    #
    # @param user_id The ID of the user to load.
    # @param options (optional) Options for including more information.
    #                           'include_custom_fields' => true/false.  Default is false.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(user_id, options = {}, cacher = nil)
      #@class_key = "users_#{user_id}"   
      @url_data_path = "/users/#{user_id}"
      @url_data_params = {:include_custom_fields => true}
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end
    
  end

end


