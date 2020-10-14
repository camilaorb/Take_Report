

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


Given(/^a user is in Foundation Upload screen$/) do
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

Then(/^user upload the source ([^"]*)$/) do|file|
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


Given(/^a buyer opts to edit "([^"]*)"$/) do |_arg|
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
end


Then(/^the Diff Type is updated in RMS and RMS DB upon successful upload of the file$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_type_table @file
  database.disconnect_db
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


Given(/^a buyer opts to remove one or more "([^"]*)"$/) do |_arg|
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
end


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

###################################### Status ################################################

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


Given(/^a buyer has a "([^"]*)" file that has failed to upload$/) do |_arg, table|
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
  table.hashes.each do |value|
    foundation_data_loading.upload_options_screen(value[:template_type], value[:template])
    @process_description = foundation_data_loading.process_description
    foundation_data_loading.upload_a_file value[:file]
  end
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
end


When(/^the buyer downloads the file and makes the necessary correction$/) do
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)
end


Then(/^the buyer is able to re-upload the template file and re-assess the latest status of the upload$/) do |table|
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
  table.hashes.each do |value|
    foundation_data_loading.upload_options_screen(value[:template_type], value[:template])
    @process_description = foundation_data_loading.process_description
    foundation_data_loading.upload_a_file value[:file]
  end
  foundation_data_loading.access_review_status
  foundation_data_loading.verify_upload(@process_description)

  login_page.logout_to_rms
end


############################# UDA  ########################################################


When(/^the source ([^"]*) is successfully uploaded$/) do |file|
  data_loading.upload_a_file file
  foundation_data_loading.access_review_status
  data_loading.verify_upload
end

Given(/^a user creates a UDA based on List of Values LOV$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  data_loading.open_data_loading
  data_loading.open_data_loading_upload
  data_loading.upload_options_screen('Items', 'User Defined Attributes')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @last_uda_id = database.verify_last_uda_id
  database.disconnect_db
end


Then(/^the UDA will appear as an LOV display type in RMS and RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_uda_table(@last_uda_id, 'Test Diff-18', 'LV')
  database.disconnect_db
  login_page.logout_to_rms
end

Given(/^a user assigns a new value for an existing UDA$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  data_loading.open_data_loading
  data_loading.open_data_loading_upload
  data_loading.upload_options_screen('Items', 'User Defined Attributes')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @last_uda_value_id = verify_last_uda_value_id
  @last_uda_id = database.verify_last_uda_id
  database.disconnect_db
end


Then(/^the UDA Values in RMS and RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_change_uda_table(@last_uda_value_id, 'Test Diff-19', @last_uda_id)
  database.disconnect_db
  login_page.logout_to_rms
end

Given(/^a user creates a UDA based on Free-Format FF$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  data_loading.open_data_loading
  data_loading.open_data_loading_upload
  data_loading.upload_options_screen('Items', 'User Defined Attributes')
end


Then(/^the UDA will appear as 'FF' display type in RMS and RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_uda_table(@new_id, 'Test Diff-20', 'FF')
  database.disconnect_db
  login_page.logout_to_rms
end

Given(/^a user amends UDA VALUE for a specified UDA ID in the UDA_VALUES tab contained in the spreadsheet$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  data_loading.open_data_loading
  data_loading.open_data_loading_upload
  data_loading.upload_options_screen('Items', 'User Defined Attributes')
end


Then(/^the UDA LOV will be updated in RMS and RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_uda_table(@new_id, 'Test Diff-18 Change', 'LOV')
  database.verify_uda_value_table('17400', 'Test Diff-19 Changed', '17000')
  database.disconnect_db
  login_page.logout_to_rms
end


Given(/^a user deletes UDA VALUE for a specified UDA LOV in the UDA_VALUES tab contained in the spreadsheet$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  data_loading.open_data_loading
  data_loading.open_data_loading_upload
  data_loading.upload_options_screen('Items', 'User Defined Attributes')
end

Then(/^the UDA VALUE will be deleted in RMS and RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_uda_value_delete('17400')
  database.disconnect_db
  login_page.logout_to_rms
end

Given(/^a user amends UDA FF for a specified UDA ID tab contained in the spreadsheet$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  data_loading.open_data_loading
  data_loading.open_data_loading_upload
  data_loading.upload_options_screen('Items', 'User Defined Attributes')
end


Then(/^the UDA FF will will be updated in RMS and RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_uda_table('18000', 'Test Diff-20 Changed', 'FF')
  database.disconnect_db
  login_page.logout_to_rms
end

Given(/^a user deletes UDA LOV from the UDA tab contained in the UDA Source file template spreadsheet$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  data_loading.open_data_loading
  data_loading.open_data_loading_upload
  data_loading.upload_options_screen('Items', 'User Defined Attributes')
end


Then(/^the UDA LOV will be deleted in RMS and RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_uda_delete('17000')
  database.disconnect_db
  login_page.logout_to_rms
end

Given(/^a user deletes UDA FF for a specified UDA ID tab contained in the spreadsheet$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  data_loading.open_data_loading
  data_loading.open_data_loading_upload
  data_loading.upload_options_screen('Items', 'User Defined Attributes')
end

Then(/^the UDA FF will be deleted in RMS and RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_uda_delete('18000')
  database.disconnect_db
  login_page.logout_to_rms
end


