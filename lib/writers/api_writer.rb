module ChurchCommunityBuilder

  # This adapter is the standard for all saving objects.
  class ApiWriter
    attr_reader :error_messages, :response_code

    # # Saves this object.
    # #
    # # @return True or ID on success, otherwise false.
    # def save_object
    #   @url_data_params ||= {}
    #   success = true

    #   if @url_data_path.nil?
    #     @error_messages = ["#{@url_action.to_s.upcase} not implemented for #{self.class.to_s}"]
    #     return false
    #   end

    #   if @updatable_fields and !@updatable_fields.empty?
    #     fields_to_remove = @url_data_params.keys - @updatable_fields  
    #     fields_to_remove.each { |ftr| @url_data_params.delete(ftr) }
    #   end

    #   begin
    #     response = ChurchCommunityBuilder::admin_request(@url_action, @url_data_path, nil, @url_data_params.to_json)   
    #     @response_code = response.code
    #     # No content but is a success
    #     success = response.code == 204 ? {'success' => true} : JSON.parse(response.body)  
    #   rescue Exception => e  
    #     @error_messages = e.message.split(',')
    #     success = false
    #   end 

    #   return success
    # end


    # # Deletes this object.
    # #
    # # @return True or ID on success, otherwise false.
    # def delete_object
    #   success = true

    #   if @url_data_delete_path.nil?
    #     @error_messages = ["DELETE not implemented for #{self.class.to_s}"]
    #     return false
    #   end

    #   begin
    #     # @url_data_path should be the same as :put if this object is already
    #     # setup and mapped to an object that exists
    #     response = ChurchCommunityBuilder::admin_request(:delete, @url_data_delete_path)           
    #     success = response.code == 204 ? true : false # No content but is a success
    #   rescue Exception => e  
    #     @error_messages = e.message.split(',')
    #     success = false
    #   end 

    #   return success
    # end    

  end

end