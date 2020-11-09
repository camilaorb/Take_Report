################################### Download ####################################


Given(/^a buyer is in Foundation Download screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_download
end

When(/^buyer selects Template Type, Template and opts for Download$/) do |table|
  table.hashes.each do |value|
    foundation_data_loading.download_file(value[:template_type], value[:template])
  end
end

Then(/^the buyer is able to view the excel template file from the local directory$/) do
  login_page.logout_to_rms
end

############################### Upload #######################################


Given(/^a buyer is in Foundation Upload screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
end

When(/^buyer selects the Template Type and Template which auto populates the Process Description with timestamp$/) do |table|
  table.hashes.each do |value|
    foundation_data_loading.upload_options_screen(value[:template_type], value[:template])
  end
  @process_description = foundation_data_loading.process_description
end

Then(/^user upload the source ([^"]*)$/) do |file|
  foundation_data_loading.upload_a_file file
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  login_page.logout_to_rms
end


####################### Creat, Edit and Delete ############################

Given(/^a buyer opts to create a new "([^"]*)"$/) do |_arg|
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
end

When(/^a buyer upload the source file with the information$/) do |table|
  table.hashes.each do |value|
    @file = value[:file]
    foundation_data_loading.upload_options_screen(value[:template_type], value[:template])
    @process_description = foundation_data_loading.process_description
    foundation_data_loading.upload_a_file @file
  end
end

Given(/^a buyer opts to edit a existing "([^"]*)"$/) do |_arg|
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
  #super_foundation_data.update_file_to_edit(_arg)

end

Given(/^a buyer opts to remove a "([^"]*)"$/) do |_arg|
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
end

####################### Verify ############################

# creat #

Then(/^the Diff Type is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_type_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

Then(/^the Diff ID is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_id_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

Then(/^the Banner is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_banner_table @file
  database.disconnect_db
  login_page.logout_to_rms
end


# Edit #

Then(/^the Diff Type is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_type_table @file
  database.disconnect_db
  #super_foundation_data.delete_diff_type_file
  login_page.logout_to_rms
end

Then(/^the Diff ID is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_id_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

Then(/^the Banner is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_banner_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

# Delete #

Then(/^the Diff Type is deleted in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_diff_type_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

Then(/^the Diff ID is deleted in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_id_type_table @file
  database.disconnect_db
  login_page.logout_to_rms
end


###################################### Review Status ################################################

Given(/^a buyer has uploaded "([^"]*)" file successfully$/) do |_arg, table|
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
  table.hashes.each do |value|
    foundation_data_loading.upload_options_screen(value[:template_type], value[:template])
    @process_description = foundation_data_loading.process_description
    foundation_data_loading.upload_a_file value[:file]
  end
end


When(/^the Buyer accesses Review Status$/) do
  foundation_data_loading.access_review_status
end


Then(/^the Buyer is able to determine the success of the upload by checking the status of the process$/) do
  foundation_data_loading.verify_upload(@process_description)
  login_page.logout_to_rms
end


Given(/^a buyer has failed to upload a "([^"]*)" file$/) do |_arg, table|
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
  table.hashes.each do |value|
    foundation_data_loading.upload_options_screen(value[:template_type], value[:template])
    @process_description = foundation_data_loading.process_description
    foundation_data_loading.upload_a_file value[:file]
  end
end


Then(/^the buyer is able to view the reason for error$/) do
  foundation_data_loading.verify_failure_upload(@process_description)
  login_page.logout_to_rms
end

## Diff ##

## Re-Upload ##

Given(/^a buyer has a Diff Template file that has failed to upload$/) do |_arg, table|
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
  table.hashes.each do |value|
    @template_type = value[:template_type]
    @template = value[:template]
    @file_failure = value[:file1]
    @file_success = value[:file2]
  end
  foundation_data_loading.upload_options_screen(@template_type, @template)
  @process_description = foundation_data_loading.process_description
  foundation_data_loading.upload_a_file @file_failure
  foundation_data_loading.access_review_status
end

Then(/^the buyer is able to re-upload the Diff template file and re-assess the latest status of the upload$/) do
  foundation_data_loading.open_data_loading_upload
  foundation_data_loading.upload_options_screen(@template_type, @template)
  @process_description = foundation_data_loading.process_description
  foundation_data_loading.upload_a_file @file_success
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  login_page.logout_to_rms
end


#reupload
When(/^the buyer downloads the file and makes the necessary correction$/) do
  # foundation_data_loading.access_review_status
  # foundation_data_loading.verify_upload(@process_description)
  # login_page.logout_to_rms
end


Then(/^the Channel is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_id_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#org unit#
# create #
Then(/^the Org Unit is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_org_unit_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#detele#
Then(/^the Org Unit is deleted in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_diff_type_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#edit
Then(/^the Org Unit is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_edit_diff_type_table @file
  database.disconnect_db
  login_page.logout_to_rms
end


#reupload File 1 failed to upload
Given(/^a buyer has a "([^"]*)" file that has failed to upload$/) do |_arg, table|
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
  table.hashes.each do |value|
    foundation_data_loading.upload_options_screen(value[:template_type], value[:template])
    @process_description = foundation_data_loading.process_description
    foundation_data_loading.upload_a_file value[:file1]
    @file = value[:file1].to_s
  end
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_reupload(@process_description, @file)
  login_page.logout_to_rms
end

#reupload file 2 recreate and succeed to upload
Then(/^the buyer is able to re-upload the template file and re-assess the latest status of the upload$/) do |table|

  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload


  table.hashes.each do |value|
    foundation_data_loading.upload_options_screen(value[:template_type], value[:template])
    @process_description = foundation_data_loading.process_description
    foundation_data_loading.upload_a_file value[:file2]
    @file = value[:file2].to_s #amended
  end
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_reupload(@process_description, @file)#amended
  login_page.logout_to_rms
end

#Transfer-Entity
# create
Then(/^the Transfer Entity is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_transfer_entity_table @file
  database.disconnect_db
  login_page.logout_to_rms
end


#edit#
Then(/^the Transfer Entity is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_edit_tsf_entity_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#delete
Then(/^the Transfer Entity is deleted in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_transfer_entity_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#Store Format
# Create
Then(/^the Store Format is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_store_format_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#update
Then(/^the Store Format is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_edit_store_format_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#Delete
Then(/^the Store Format is deleted in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_store_format_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#supplier_trait
# Create
Then(/^the Supplier Trait is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_supplier_trait_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#update
Then(/^the Supplier Trait is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_edit_supplier_trait_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#Delete
Then(/^the Supplier Trait is deleted in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_supplier_trait_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#transfer_zone#
# create
Then(/^the Transfer Zone is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_transfer_zone_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#update
Then(/^the Transfer Zone is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_edit_transfer_zone_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#delete
Then(/^the Transfer Zone is deleted in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_transfer_zone_table @file
  database.disconnect_db
  login_page.logout_to_rms
end


#VAT
#create
Then(/^the VAT Code is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_vat_codes_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#update
Then(/^the VAT Code is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_edit_vat_codes_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#Delete
Then(/^the VAT Code is deleted in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_vat_codes_table @file
  database.disconnect_db
  login_page.logout_to_rms
end


#UDA#
#create
Then(/^the UDA is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_create_uda_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#update
Then(/^the UDA is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_update_uda_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#Delete_ff
Then(/^the record marked as deleted is removed from the RMS table UDA upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_uda_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

#Delete-lov
Then(/^there are Items attached to the LOV UDA so the user will not be able to remove the UDA$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_failure_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_lov_uda_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

##uda_value##
# create #
Then(/^the UDA Value is created in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_create_uda_values_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

# Update #
Then(/^the UDA Value is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_update_uda_values_table @file
  database.disconnect_db
  login_page.logout_to_rms
end

# Delete #
Then(/^the user is able to verify the deleted record in RMS$/) do

end
