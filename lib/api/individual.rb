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
											:modified


    def initialize(json_data = nil, options = {})
      #@writer_object = PersonWriter
      
      # When we initialize from IndividualReader, the "Individual" is buried
      if json_data["ccb_api"].nil?
      	individual_json = json_data
      else
      	individual_json = json_data["ccb_api"]["response"]["individuals"]["individual"]
      end
      
      initialize_from_json_object(individual_json) unless individual_json.nil?

    end

    def self.load_by_id(individual_id)
      reader = IndividualReader.new(individual_id)
      self.new(reader.load_feed)
    rescue
      nil
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

  end

end

#  Searchable by:
# (e.g., individual_search service)
										#   :first_name,
  									# 	:last_name,
  									# 	:phone,
  									# 	:email,
  									# 	:street_address,
  									# 	:city,
  									# 	:state,
  									# 	:zip,
