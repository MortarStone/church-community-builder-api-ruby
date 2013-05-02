module ChurchCommunityBuilder

  # This adapter is the standard for all caching objects.
  class CacheAdapter

    # Constructor
    def initialize()
    end


    # Save data to the cache.
    #
    # * <b>key</b> The key to use to save the cache.
    # * <b>data</b> The JSON data to be saved.
    # * <b>expire_on (optional)</b> The datetime to expire the cache.
    #
    # Returns true on success or a string error message on false.
    def save_data(key, data, expire_on = nil)
      raise 'The save_data method must be implemented'
    end


    # Get the data from the cache.
    #
    # * <b>key</b> The key to use to get the cache.
    #
    # Returns the data for the key in the same way it was stored.
    def get_data(key)
      raise 'The get_data method must be implemented'
    end       


    # Expire the cache.
    #
    # * <b>key</b> The key to use to expire the cache.
    def expire_cache!(key)
      raise 'The expire_cache method must be implemented'
    end


    # Check if the cache has expired.
    #
    # * <b>key</b> The key to use to check if the cache has expired.
    def is_cache_expired?(key)
      raise 'The is_cache_expired method must be implemented'
    end  

  end

end