module TheCity

  # This class is the base class for all TheCity objects and is meant to be inherited.
  #
  class ApiObject
    attr_reader :error_messages, :marked_for_destruction
    

    # Used to specify a list of getters and setters.
    def self.tc_attr_accessor(*vars)
      @__tc_attributes ||= []
      @__tc_attributes.concat(vars)
      attr_accessor(*vars)
    end


    # A list of tc_attr_accessors that have been specified.
    def self.__tc_attributes
      @__tc_attributes
    end

    # Initializes the current object from the JSON data that was loaded into the Hash
    #
    # @param object_attributes A Hash of values to load into the current object.
    def initialize_from_json_object(object_attributes)
      if object_attributes.is_a?( Hash )
        object_attributes.each do |key, value| 
          method_to_call = "#{key.to_s.downcase.gsub(' ', '_')}="
          if respond_to?(method_to_call)
            self.send(method_to_call, value) 
          else
            # puts method_to_call  # Show the missing methods
          end
        end
      end     
    end


    # Returns the status of the current object.
    def is_deleted?
      @_deleted ||= false
    end
    
    # Gets the current object's attributes in a Hash.
    #
    # @return A hash of all the attributes.
    def to_attributes 
      vals = {}
      vals = {:marked_for_destruction => self.is_deleted?} if self.is_deleted?
      self.class.__tc_attributes.each do |tca| 
        rep = self.send(tca)               
        if rep.class == Array   
          rep.collect! { |r| r.respond_to?(:to_attributes) ? r.to_attributes : r }
        end
        vals[tca] = rep
      end
      vals
    end


    # Sets the current object's attributes from a hash
    def set_attributes(attribute_data)
      attribute_data.each { |key, value| self.send("#{key}=", value) if self.respond_to?("#{key}=") }
    end


    # Save this object.
    #
    # @return True on success, otherwise false.
    def save
      writer = @writer_object.new(self.to_attributes) 
      result = writer.save_object
      if result === false
        @error_messages = writer.error_messages
      else
        self.set_attributes(result)
      end
      result === false ? false : true
    end


    # Delete this object.
    #
    # @return True on success, otherwise false.
    def delete
      writer = @writer_object.new(self.to_attributes) 
      result = writer.delete_object
      if result === false
        @error_messages = writer.error_messages
      else
        @_deleted = true
      end
      result === false ? false : true
    end    

  end

end


