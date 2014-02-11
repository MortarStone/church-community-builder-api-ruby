module ChurchCommunityBuilder

  include Enumerable

  class Individual < ApiObject

    ccb_attr_accessor :id,
                      :sync_id,
                      :other_id,
                      :giving_number,
                      :campus,
                      :family,
                      :family_image,
                      :family_position,
                      :family_members,
                      :first_name,
                      :last_name,
                      :middle_name,
                      :legal_first_name,
                      :full_name,
                      :salutation,
                      :suffix,
                      :image,
                      :email,
                      :addresses,
                      :phones,
                      :mobile_carrier,
                      :gender,
                      :marital_status,
                      :birthday,
                      :anniversary,
                      :deceased,
                      :membership_type,
                      :membership_date,
                      :membership_end,
                      :receive_email_from_church,
                      :default_new_group_messages,
                      :default_new_group_comments,
                      :default_new_group_digest,
                      :default_new_group_sms,
                      :privacy_settings,
                      :active,
                      :creator,
                      :modifier,
                      :created,
                      :modified,
                      :home_address,
                      :mailing_address,
                      :work_address,
                      :other_address,
                      :contact_phone,
                      :home_phone,
                      :work_phone,
                      :mobile_phone,
                      :allergies

    # extend for individual's from individual_groups service
    ccb_attr_accessor :receive_email_from_church,
                      :groups

    # extend for significant events
    ccb_attr_accessor :significant_events

    def id=(value)
      @id = value.to_i
    end
    def id
      @id
    end

    def initialize(json_data = nil)
      #@writer_object = PersonWriter
      
      # When we initialize from IndividualReader, the "Individual" is buried
      if json_data["ccb_api"].nil?
        individual_json = json_data
      else
        individual_json = json_data["ccb_api"]["response"]["individuals"]["individual"]
      end

      initialize_from_json_object(individual_json) unless individual_json.nil?

      _set_addresses
      _set_phones
      _set_groups(json_data["groups"])
      _set_significant_events(json_data["significant_events"])
    end

    def self.load_by_id(individual_id)
      reader = IndividualReader.new(individual_id)
      self.new(reader.load_feed)
    rescue
      nil
    end

    def load_groups
      igs = Search.individual_groups(self.id)
      if !igs.blank? and !igs[0].groups.blank?
        self.groups = igs[0].groups 
      end

      self.groups
    end

    def load_significant_events
      ise = Search.individual_significant_events(self.id)
      if !ise.blank? and !ise[0].significant_events.blank?
        self.significant_events = ise[0].significant_events
      end

      self.significant_events
    end

    def family_id
      self.family['id']
    end

    def family_name
      self.family['content']
    end

    def campus_id
      self.campus["id"]
    end

    def campus_name
      self.campus["content"]
    end

    private

    def _set_addresses

      self.addresses["address"].each do |address|
        case address["type"]
        when 'mailing'
          @mailing_address = Address.new(address)
        when 'home'
          @home_address = Address.new(address)
        when 'work'
          @work_address = Address.new(address)
        when 'other'
          @other_address = Address.new(address)
        end
      end if self.addresses

    end

    def _set_phones

      self.phones["phone"].each do |phone|
        case phone["type"]
        when 'contact'
          @contact_phone = phone["content"]
        when 'home'
          @home_phone = phone["content"]
        when 'work'
          @work_phone = phone["content"]
        when 'mobile'
          @mobile_phone = phone["content"]
        end
      end if self.phones

    end

    def _set_groups(json_data)
      groups = []
      if !json_data.nil?
        json_data["group"].each do |g|
          groups << Group.new(g)
        end
      end
      self.groups = groups
    end

    def _set_significant_events(json_data)
      events = []
      if !json_data.nil? and !json_data["significant_event"].blank?
        json_data["significant_event"].each do |e|
          events << { id: e["id"], name: e["name"], date: e["date"] }
        end
      end
      self.significant_events = events
    end

  end

end

