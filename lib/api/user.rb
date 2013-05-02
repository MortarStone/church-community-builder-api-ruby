module ChurchCommunityBuilder

  class User < ApiObject
    Gender = {:male => 'Male', :female => 'Female'}
    PhoneType = {:home => 'Home', :work => 'Work', :mobile => 'Mobile'}
    MaritalStatus = {:never_married => 'Never Married', :engaged => 'Engaged', 
                     :married => 'Married', :separated => 'Separated', 
                     :divorced => 'Divorced', :remarried => 'Re-Married',
                     :widowed => 'Widowed', :cohabiting => 'Cohabiting'}

    
    tc_attr_accessor :admin_url,
                     :api_url,
                     :internal_url,
                     :updated_at,
                     :last_logged_in,
                     :secondary_phone,
                     :last_engaged,
                     :title,
                     :internal_url,
                     :id,
                     :first,
                     :primary_campus_name,
                     :last,
                     :head_of_household,
                     :nickname,
                     :active,
                     :primary_phone_type,
                     :primary_phone,
                     :member_since,
                     :birthdate,
                     :email_bouncing,
                     :secondary_phone_type,
                     :primary_campus_id,
                     :contact_updated_at,
                     :type,
                     :staff,
                     :created_at,
                     :gender,
                     :external_id_1,
                     :external_id_2,
                     :external_id_3,
                     :middle,
                     :email,
                     :marital_status  


    # Loads the user by the specified ID.
    #
    # @param user_id The ID of the user to load.
    #
    # Returns a new {User} object.
    def self.load_by_id(user_id)
      reader = UserReader.new(user_id)
      self.new(reader.load_feed)
    rescue
      nil      
    end       


    # Constructor.
    #
    # @param json_data (optional) The object that has the data.  This can be a {UserReader} or Hash object.
    # @param options (optional) Options for including more information.
    def initialize(json_data = nil, options = {})    
      @writer_object = UserWriter
      initialize_from_json_object(json_data) unless json_data.nil?

      @address_list = nil
      @family_list = nil
      @note_list = nil
      @role_list = nil
      @skill_list = nil
      @process_list = nil
      @invitation_list = nil
      @admin_privilege_list = nil
    end
    

    # The first and last name of the user.
    #
    # @return A string of the full name
    def full_name
      use_name = self.nickname.to_s.empty? ? self.first : self.nickname
      [use_name, self.last].compact.join(' ')
    end


    # Address information.
    #
    # @param force_reload (optional) Data is cached on first call.  If data needs to be 
    #                                reloaded from the server on a subsequent call then 
    #                                a force reload is need.
    #
    # @return [UserAddressList]
    def addresses(force_reload = false)
      unless force_reload
        return @address_list unless @address_list.nil?  
      end
      return nil unless self.id
         
      @address_list = UserAddressList.new({:user_id => self.id})
      return @address_list
    end


    # The family information.
    #
    # @return [UserFamilyList]
    def family(force_reload = false)
      unless force_reload
        return @family_list unless @user_list.nil?  
      end
      return nil unless self.id
  
      @family_list = UserFamilyList.new({:user_id => self.id})
      return @family_list
    end


    # The notes for this user.
    #
    # @return [UserNoteList]
    def notes(force_reload = false)
      unless force_reload
        return @note_list unless @note_list.nil?  
      end
      return nil unless self.id
  
      @note_list = UserNoteList.new({:user_id => self.id})
      return @note_list
    end    


    # The roles for this user.
    #
    # @return [UserRoleList]
    def roles(force_reload = false)
      unless force_reload
        return @role_list unless @role_list.nil?  
      end
      return nil unless self.id
  
      @role_list = UserRoleList.new({:user_id => self.id})
      return @role_list
    end      


    # The skills for this user.
    #
    # @return [UserSkillList]
    def skills(force_reload = false)
      unless force_reload
        return @skill_list unless @skill_list.nil?  
      end
      return nil unless self.id
  
      @skill_list = UserSkillList.new({:user_id => self.id})
      return @skill_list
    end     


    # The processes for this user.
    #
    # @return [UserProcessList]
    def processes(force_reload = false)
      unless force_reload
        return @process_list unless @process_list.nil?  
      end
      return nil unless self.id
 
      @process_list = UserProcessList.new({:user_id => self.id})
      return @process_list
    end   


    # The invitations for this user.
    #
    # @return [UserInvitationList]
    def invitations(force_reload = false)
      unless force_reload
        return @invitation_list unless @invitation_list.nil?  
      end
      return nil unless self.id
 
      @invitation_list = UserInvitationList.new({:user_id => self.id})
      return @invitation_list
    end


    # The invitations for this user.
    #
    # @return [UserAdminPrivilegeList]
    def admin_privileges(force_reload = false)
      unless force_reload
        return @admin_privilege_list unless @admin_privilege_list.nil?  
      end
      return nil unless self.id

      @admin_privilege_list = UserAdminPrivilegeList.new({:user_id => self.id})
      return @admin_privilege_list
    end

  end

end


