module ChurchCommunityBuilder

  include Enumerable

  class Group < ApiObject

    ccb_attr_accessor :id,
                      :name,
                      :description,
                      :image, 
                      :campus,
                      :main_leader,
                      :leaders,
                      :participants,
                      :group_type,
                      :department,
                      :area, 
                      :calendar_feed,
                      :current_members,
                      :group_capacity,
                      :addresses,
                      :meeting_day,
                      :meeting_time,
                      :childcare_provided,
                      :interaction_type,
                      :membership_type,
                      :notification,
                      :listed,
                      :public_search_listed,
                      :inactive,
                      :creator,
                      :modifier,
                      :created,
                      :modified

    def initialize(json_data = nil)
      #@writer_object = PersonWriter
      
      # When we initialize from GroupReader, the "Group" is buried
      if json_data["ccb_api"].nil?
        group_json = json_data
      else
        group_json = json_data["ccb_api"]["response"]["groups"]["group"]
      end
      
      initialize_from_json_object(group_json) unless group_json.nil?

      # _set_addresses
      # _set_main_leader
      # _set_leaders

    end

    def self.load_by_id(group_id)
      reader = GroupReader.new(group_id)
      self.new(reader.load_feed)
    rescue
      nil
    end

    # when pulling from <family id="1">value</family> do the following
    # def family_id
    #   self.family['id']
    # end
    # def family_name
    #   self.family['content']
    # end

    # can we figure out how to do this dynamically, safely?

    def campus_id
      self.campus["id"]
    end

    def campus_name
      self.campus["content"]
    end


    def group_type_id
      self.group_type["id"]
    end

    def group_type_name
      self.group_type["content"]
    end


    def department_id
      self.department["id"]
    end

    def department_name
      self.department["content"]
    end


    def area_id
      self.area["id"]
    end

    def area_name
      self.area["content"]
    end


    def meeting_day_id
      self.meeting_day["id"]
    end

    def meeting_day_name
      self.meeting_day["content"]
    end


    def meeting_time_id
      self.meeting_time["id"]
    end

    def meeting_time_name
      self.meeting_time["content"]
    end


    # private

    # def _set_addresses

    #   self.addresses["address"].each do |address|
    #     case address["type"]
    #     when 'mailing'
    #       @mailing_address = Address.new(address)
    #     when 'home'
    #       @home_address = Address.new(address)
    #     when 'work'
    #       @work_address = Address.new(address)
    #     when 'other'
    #       @other_address = Address.new(address)
    #     end

    #   end

    # end

    # def _set_phones

    #   self.phones["phone"].each do |phone|
    #     case phone["type"]
    #     when 'contact'
    #       @contact_phone = phone["content"]
    #     when 'home'
    #       @home_phone = phone["content"]
    #     when 'work'
    #       @work_phone = phone["content"]
    #     when 'mobile'
    #       @mobile_phone = phone["content"]
    #     end

    #   end

    # end

  end

end

