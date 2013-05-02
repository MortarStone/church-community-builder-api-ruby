# require 'spec_helper'

# describe 'UserWriter' do

#   it 'should show connection error messages if server cannot be reached' do
#     TheCity.stub(:admin_request) { raise TheCityExceptions::UnableToConnectToTheCity.new('Unable to connect to server') }
#     user_data = FactoryGirl.attributes_for(:user, {:id => nil})
#     user = TheCity::User.new(user_data)
#     user.id.should be_nil
#     user.save.should === false
#     user.id.should be_nil
#     user.error_messages.should == ['Unable to connect to server']
#   end  


#   it 'should save if all data is valid for new user' do
#     request_data = FactoryGirl.attributes_for(:user, {:id => 12345}).to_json
#     TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
#     user_data = FactoryGirl.attributes_for(:user, {:id => nil})
#     user = TheCity::User.new(user_data)
#     user.id.should be_nil
#     user.save.should === true
#     user.id.should == 12345
#   end


#   it 'should show error messages if save fails for new user' do
#     TheCity.stub(:admin_request) { raise TheCityExceptions::TheCityResponseError.new('email address already exists') }
#     user_data = FactoryGirl.attributes_for(:user, {:id => nil})
#     user = TheCity::User.new(user_data)
#     user.id.should be_nil
#     user.save.should === false
#     user.id.should be_nil
#     user.error_messages.should == ['email address already exists']
#   end  


#   it 'should save if all data is valid for existing user' do
#     request_data = FactoryGirl.attributes_for(:user, {:id => 12345}).to_json
#     TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )    
#     user_data = FactoryGirl.attributes_for(:user, {:id => 12345})
#     user = TheCity::User.new(user_data)
#     user.id.should == 12345
#     user.save.should === true
#     user.id.should == 12345
#   end


#   it 'should show error messages if save fails for existing user' do
#     TheCity.stub(:admin_request) { raise TheCityExceptions::TheCityResponseError.new('something bad happened') }
#     user_data = FactoryGirl.attributes_for(:user, {:id => 12345})
#     user = TheCity::User.new(user_data)
#     user.id.should == 12345
#     user.save.should === false
#     user.id.should == 12345
#     user.error_messages.should == ['something bad happened']
#   end  


#   it 'should delete if data ID exists for the existing user' do
#     TheCity.stub(:admin_request).and_return( TheCityResponse.new(204, '{}') ) 
#     user_data = FactoryGirl.attributes_for(:user, {:id => 12345})
#     user = TheCity::User.new(user_data)
#     user.is_deleted?.should === false
#     user.delete
#     user.is_deleted?.should === true
#   end


#   it 'should show error messages if data fails to be deleted' do
#     TheCity.stub(:admin_request) { raise TheCityExceptions::TheCityResponseError.new('something bad happened') }
#     user_data = FactoryGirl.attributes_for(:user, {:id => 12345})
#     user = TheCity::User.new(user_data)
#     user.is_deleted?.should === false
#     user.delete
#     user.is_deleted?.should === false
#     user.error_messages.should == ['something bad happened']
#   end  

# end
