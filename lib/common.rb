module ChurchCommunityBuilder
  require 'cgi'
  require 'json'

  def self.admin_request(method, params = {}, body = nil)
    url = "https://#{ChurchCommunityBuilder::Api.api_subdomain}.ccbchurch.com/api.php"
    username = ChurchCommunityBuilder::Api.api_username
    password = ChurchCommunityBuilder::Api.api_password

    response =
    case method
    when :post
      Typhoeus::Request.post(url, {:headers => headers, :body => body})
    when :get
      Typhoeus::Request.get(url, params: params.reject {|k,v| v.nil?}, userpwd: username+":"+password)
    when :put
      Typhoeus::Request.put(url, {:headers => headers, :body => body})
    when :delete
      Typhoeus::Request.delete(url, {:headers => headers, :params => params})
    end    

    # Need to account for this
    # {"ccb_api"=>{"request"=>{"parameters"=>{"argument"=>[{"name"=>"srv", "value"=>"batch_profiles_in_date_range"}, 
    #   {"name"=>"date_start", "value"=>"2013-03-11"}, {"name"=>"date_end", "value"=>"2013-04-10"}]}}, 
    #   "response"=>{"error"=>{"number"=>"005", "type"=>"Service Permission", "content"=>"Query limit of '10000' reached, please try again tomorrow."}}}}
    if response.body.include?('Query limit of \'10000\' reached, please try again tomorrow.')
      raise ChurchCommunityBuilderExceptions::ChurchCommunityBuilderResponseError.new(response.body)
    elsif !response.success?
      if response.code > 0
        raise ChurchCommunityBuilderExceptions::UnableToConnectToChurchCommunityBuilder.new(response.body)
      else
        begin
          error_messages = JSON.parse(response.body)['error_message']
        rescue
          response_code_desc = response.headers.partition("\r\n")[0].sub(/^\S+/, '') rescue nil
          raise ChurchCommunityBuilderExceptions::UnknownErrorConnectingToChurchCommunityBuilder.new("Unknown error when connecting to The City.#{response_code_desc}")
        else
          raise ChurchCommunityBuilderExceptions::ChurchCommunityBuilderResponseError.new(error_messages)
        end
      end
    end   
    
    response
  end

end
