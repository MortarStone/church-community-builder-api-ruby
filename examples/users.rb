# # *******************************************
# # This is a demo file to show usage.
# #
# # @package TheCity::Admin
# # @authors Robbie Lieb <robbie@onthecity.org>, Wes Hays <wes@onthecity.org>
# # ******************************************* 

# require 'ruby-debug'
# require File.dirname(__FILE__) + '/../lib/the_city_admin.rb'

# require File.dirname(__FILE__) + '/city_keys.rb'
# include CityKeys

# TheCity::AdminApi.connect(KEY, TOKEN)


# user_list = TheCity::UserList.new

# user = user_list.first
# puts user.full_name


# # user_count = TheCity::UserCount.new
# # puts user_count.count
# # puts user_count.filter

# # user_count = TheCity::UserCount.new({:filter => :created_in_the_last_7_Days})
# # puts user_count.count
# # puts user_count.filter

# offline_user = TheCity::User.new
# offline_user.first = 'Wes'
# offline_user.last = 'Hays'
# offline_user.email = 'someguy@someplace.org'


# if offline_user.save
#   puts "Offline user created (#{offline_user.id})"
# else
#   puts "Failed to create offline user: #{offline_user.error_messages.join(', ')}"
# end

# offline_user.first = 'Anna'
# offline_user.email = 'somegal@someplace.org'

# if offline_user.save
#   puts "Offline user updated (#{offline_user.id})"
# else
#   puts "Failed to create offline user: #{offline_user.error_messages.join(', ')}"
# end

# offline_user2 = TheCity::User.load_by_id(offline_user.id)
# puts "Loaded user first name: #{offline_user2.first}::#{offline_user2.email}"

# if offline_user.delete 
#   puts "OfflineUser #{offline_user.id} deleted"
# else
#   puts "Unable to delete offline user #{offline_user.id}: #{offline_user.error_messages.join(', ')}"
# end


# # puts "------------------------------------"

# # if user.addresses.empty?
# #   puts "No addresses for user"
# # else
# #   puts "Addresses: #{user.addresses.size}"
# # end

# # address = TheCity::UserAddress.new
# # address.user_id = user.id
# # address.location_type = 'Work'
# # address.street = '445 S. Virginia St'
# # address.city = 'Reno'
# # address.state = 'NV'
# # address.zipcode = '89501'
# # if address.save
# #   puts "Address saved: #{address.id}"
# # else
# #   puts "** Unable to save new address"
# # end


# # address.street = '663 Beckwourth Dr'

# # if address.save
# #   puts "Address updated: #{address.id}"
# # else
# #   puts "** Unable to update address: #{address.error_messages.join(', ')}"
# # end


# # if user.addresses(true).empty?
# #   puts "No addresses for user"
# # else
# #   puts "Addresses: #{user.addresses.size}"
# # end

# # user.addresses.each do |address| 
# #   if address.delete 
# #     puts "Address #{address.id} deleted"
# #   else
# #     puts "Unable to delete address #{address.id}: #{address.error_messages.join(', ')}"
# #   end
# # end

# # if user.addresses(true).empty?
# #   puts "No addresses for user"
# # else
# #   puts "Addresses: #{user.addresses.size}"
# # end


# # puts "------------------------------------"

# # if user.admin_privileges.empty?
# #   puts "No admin admin privileges for user"
# # else
# #   puts "Admin privileges: #{user.admin_privileges.count}"
# # end

# # privilege = TheCity::UserAdminPrivilege.new
# # privilege.title = TheCity::UserAdminPrivilege::Permissions[:resource_admin]
# # privilege.user_id = user.id

# # if privilege.save
# #   puts "Privilege saved"
# # else
# #   puts "** Unable to save new privilege: #{privilege.error_messages.join(', ')}"
# # end

# # if user.admin_privileges(true).empty?
# #   puts "No admin admin privileges for user"
# # else
# #   puts "Admin privileges: #{user.admin_privileges.count}"
# # end

# # puts "------------------------------------"

# # # puts "ADD CHECK FOR FAMILY"
# # if user.family.empty?
# #   puts "No family members for user"
# # else
# #   puts user.family.names
# # end

# # puts "------------------------------------"

# # if user.invitations.empty?
# #   puts "No invitations for user"
# # else
# #   puts "Invitations: #{user.invitations.count}"
# # end

# # group_list = TheCity::GroupList.new
# # group = group_list.first

# # invitation = TheCity::UserInvitation.new
# # invitation.user_id = user.id
# # invitation.email = user.email
# # invitation.group_id = group.id
# # invitation.custom_message = 'Please join the group!'

# # if invitation.save
# #   puts "Invitation saved"
# # else
# #   puts "** Unable to save new invitation: #{invitation.error_messages.join(', ')}"
# # end

# # if user.invitations(true).empty?
# #   puts "No invitations for user"
# # else
# #   puts "Invitations: #{user.invitations.count}"
# # end

# # puts "------------------------------------"

# # if user.notes.empty?
# #   puts "No notes for user"
# # else
# #   puts "Notes: #{user.notes.count}"
# # end


# # note = TheCity::UserNote.new
# # note.author_id = user.id
# # note.body = "Hello World"
# # note.visible_to = [TheCity::UserNote::VisibleTo[:process_user], TheCity::UserNote::VisibleTo[:resource_admin]]

# # if note.save
# #   puts "Note saved"
# # else
# #   puts "** Unable to save new note"
# # end

# # if user.notes(true).empty?
# #   puts "No notes for user"
# # else
# #   puts "Notes: #{user.notes.count}"
# # end

# # user.notes.each do |note| 
# #   if note.delete 
# #     puts "Note #{note.id} deleted"
# #   else
# #     puts "Unable to delete note #{note.id}: #{note.error_messages.join(', ')}"
# #   end
# # end

# # if user.notes(true).empty?
# #   puts "No notes for user"
# # else
# #   puts "Notes: #{user.notes.count}"
# # end


# # puts "------------------------------------"

# # if user.processes.empty?
# #   puts "No processes for user"
# # else
# #   puts "Processes: #{user.processes.count}"
# # end

# # puts "------------------------------------"

# # group_list = TheCity::GroupList.new
# # group = group_list.first

# # offline_user = TheCity::User.new
# # offline_user.first = 'Wes'
# # offline_user.last = 'Hays'
# # offline_user.email = 'someguy@someplace.org'
# # if offline_user.save
# #   puts "Offline user created #{offline_user.id}"
# # else
# #    puts "Failed to create offline user: #{offline_user.error_messages.join(', ')}"
# # end

# # if offline_user.roles.empty?
# #   puts "No roles for user"
# # else
# #   puts "Roles: #{offline_user.roles.size}"
# # end

# # role = TheCity::UserRole.new
# # role.group_type = TheCity::UserRole::GroupTypes[:campus]
# # role.title = TheCity::UserRole::Titles[:leader]
# # role.user_id = offline_user.id
# # role.group_id = group.id

# # if role.save
# #   puts "Role saved"
# # else
# #   puts "** Unable to save new role: #{role.error_messages.join(', ')}"
# # end

# # if offline_user.roles(true).empty?
# #   puts "No roles for user"
# # else
# #   puts "Roles: #{user.roles.size}"
# # end

# # offline_user.roles.each do |role| 
# #   if role.delete 
# #     puts "Role #{role.id} deleted"
# #   else
# #     puts "Unable to delete role #{role.id}: #{role.error_messages.join(', ')}"
# #   end
# # end

# # if offline_user.roles(true).empty?
# #   puts "No roles for user"
# # else
# #   puts "Roles: #{user.roles.size}"
# # end

# # if offline_user.delete 
# #   puts "OfflineUser #{offline_user.id} deleted"
# # else
# #   puts "Unable to delete offline user #{offline_user.id}: #{offline_user.error_messages.join(', ')}"
# # end

# # puts "------------------------------------"

# # if user.skills.empty?
# #   puts "No skills for user"
# # else
# #   puts "Skills: #{user.skills.size}"
# # end

# # skill_list = TheCity::SkillList.new
# # skill = skill_list.first

# # user_skill = TheCity::UserSkill.new
# # user_skill.user_id = user.id
# # user_skill.skill_id = skill.id

# # if user_skill.save
# #   puts "User Skill saved"
# # else
# #   puts "** Unable to save new user skill (#{user_skill.skill_id}): #{user_skill.error_messages.join(', ')}"
# # end

# # if user.skills(true).empty?
# #   puts "No skills for user"
# # else
# #   puts "Skills: #{user.skills.size}"
# # end

# # user.skills(true).each do |us| 
# #   if us.delete 
# #     puts "User Skill #{us.name} deleted"
# #   else
# #     puts "Unable to delete user skill #{us.name}: #{us.error_messages.join(', ')}"
# #   end
# # end

# # if user.skills(true).empty?
# #   puts "No skills for user"
# # else
# #   puts "Skills: #{user.skills.size}"
# # end

# puts "####################################"
