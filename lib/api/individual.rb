module ChurchCommunityBuilder

  include Enumerable

  Class Individual < ApiObject

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
  									