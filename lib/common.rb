module ChurchCommunityBuilder
  require 'cgi'
  require 'json'

  config_file = CCB_LIB_DIR + "/../config/ccb.yml"
  $config = YAML.load(File.read(config_file))

  def self.admin_request(method, params = {}, body = nil)
    # headers = self._build_admin_headers(method, path, params, body)
    url = $config[:url]
    username = $config[:username]
    password = $config[:password]

    response =
    case method
    when :post
      Typhoeus::Request.post(url, {:headers => headers, :body => body})
    when :get
      Typhoeus::Request.get(url, params: params,username: username ,password: password)
    when :put
      Typhoeus::Request.put(url, {:headers => headers, :body => body})
    when :delete
      Typhoeus::Request.delete(url, {:headers => headers, :params => params})
    end    


    unless response.success?
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


  # def self._build_admin_headers(method, path, params, body)
  #   get_vars = method == :post ? '' : '?'
  #   if params
  #     get_vars += params.to_a.sort.collect { |kv_pair| "#{kv_pair[0]}=#{kv_pair[1].to_s}" }.join('&')
  #   end
  #   get_vars = '' if get_vars == '?'
  #   method_request = method.to_s.upcase
  #   url = CCB_ADMIN_PATH + path + get_vars + body
  #   current_time = Time.now.to_i.to_s
  #   string_to_sign = current_time.to_s + method_request + url

  #   unencoded_hmac = OpenSSL::HMAC.digest('sha256', ChurchCommunityBuilder::AdminApi.api_key, string_to_sign)
  #   unescaped_hmac = Base64.encode64(unencoded_hmac).chomp
  #   hmac_signature = CGI.escape(unescaped_hmac)

  #   {'X-City-Sig' => hmac_signature,
  #    'X-City-User-Token' => ChurchCommunityBuilder::AdminApi.api_token,
  #    'X-City-Time' => current_time,
  #    'Accept' => 'application/vnd.ChurchCommunityBuilder.admin.v1+json',
  #    'Content-Type' => 'application/json',
  #    'Content-Length' => body.length}
  # end 

end
