
############### Diff Groups ######################

Given(/^a user is in Download screen$/) do
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
  data_loading.open_data_loading
  data_loading.open_data_loading_download
end

When(/^user selects Template Type, Template and opts for Download$/) do
  data_loading.download_file('Items', 'Differentiators')
end
Then(/^a excel file is downloaded containing multiple tabs, namely, Diff Types and Diff IDs$/) do
  login_page.logout_to_rms
end

Given(/^a user is in Upload screen$/) do
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
  data_loading.open_data_loading
  data_loading.open_data_loading_upload
end

When(/^user selects the Template Type and Template which auto populates the Process Description with timestamp$/) do
  data_loading.upload_options_screen('Items', 'Differentiators')
end

Then(/^user upload the source file with changes on Diff Type tab for Action, Diff Type and Description$/) do
  data_loading.upload_a_file('Differentiators - diff_types.ods')
  data_loading.verify_upload
  login_page.logout_to_rms
end

Then(/^upload the source file with changes on Diff IDs tab for Action, Diff ID, Description and Diff Type$/) do
  data_loading.upload_a_file('Differentiators - diff_ids.ods')
  data_loading.verify_upload
  login_page.logout_to_rms
end

### UDAs ###

When(/^the source ([^"]*) is successfully uploaded$/) do |file|
  data_loading.upload_a_file file
  data_loading.verify_upload
end

Given(/^a user creates a UDA based on List of Values LOV$/) do
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
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
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
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
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
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
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
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
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
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
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
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
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
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
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
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
