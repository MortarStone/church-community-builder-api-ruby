module ChurchCommunityBuilder

  class UserWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)
      if data[:id] 
        @url_action = :put
        @url_data_path = "/users/#{data[:id]}"   
      else
        @url_action = :post   
        @url_data_path = "/users"   
      end
      @url_data_delete_path = "/users/#{data[:id]}" 

      @url_data_params = data

      @updatable_fields = [:title,
                           :first,
                           :middle,
                           :last,
                           :nickname,
                           :gender,
                           :email,
                           :staff,
                           :primary_campus_id,
                           :member_since,
                           :birthdate,
                           :primary_phone,
                           :primary_phone_type,
                           :secondary_phone,
                           :secondary_phone_type,
                           :external_id_1,
                           :external_id_2,
                           :external_id_3,
                           :marital_status,
                           :is_an_organization]      
    end
    
  end

end


