
############### Diff Groups ######################

Given(/^a user is in Differentiator Groups screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_diff_groups
end

When(/^they create a Diff Group where Group, Group Description, Type are mandatory$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['type_1'], YML_DATA['division'], YML_DATA['dept'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['dgd_detail_1'])
  differentiators_diff.save_and_close
end

Then(/^the new Diff Group is add on the top of Diff Group table and created RMS DB$/) do
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.verify_diff_group(expected_values:'New Diff Group')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_group_table(@new_id, 'New Diff Group', YML_DATA['type_1'] )
  database.disconnect_db
  differentiators_diff.delete_diff_group
  login_page.logout_to_rms
end


When(/^the user is able to update Group Description, Division, Department in RMS$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['type_1'], YML_DATA['division'], YML_DATA['dept'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['dgd_detail_1'])
  differentiators_diff.save_and_close
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.edit_diff_group('Changed Group', YML_DATA['division'], YML_DATA['dept'])
  differentiators_diff.save_and_close
end
Then(/^the record is update to the Diff Group table and RMS DB$/) do
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.verify_diff_group(expected_values:'Changed Group')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_group_table(@new_id, 'Changed Group', YML_DATA['type_1'] )
  database.disconnect_db
  differentiators_diff.delete_diff_group
  login_page.logout_to_rms
end


When(/^a user delete a the Diff Groups$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['type_1'], YML_DATA['division'], YML_DATA['dept'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['dgd_detail_2'])
  differentiators_diff.save
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.delete_diff_group
end

Then(/^the record is removed from the Diff Groups table and RMS DB$/) do
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.verify_diff_group(expected_values:'No data to display.')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_diff_group_table(@new_id)
  database.disconnect_db
  login_page.logout_to_rms
end



########## Group Details ##########

When(/^a user enter Size in the Group Detail window$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['type_1'], YML_DATA['division'], YML_DATA['dept'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['dgd_detail_2'])
  differentiators_diff.save_and_close
end

Then(/^a record is created to the Group Detail window and RMS DB$/) do
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.select_diff_group_detail('1')
  differentiators_diff.verify_diff_group_detail(expected_values:'M Medium')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_group_detail_table(@new_id, YML_DATA['dgd_detail_2'], '1')
  database.disconnect_db
  differentiators_diff.delete_diff_group
  login_page.logout_to_rms
end

When(/^a user update the Sequence in the Group Detail table$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['type_1'], YML_DATA['division'], YML_DATA['dept'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['dgd_detail_2'])
  differentiators_diff.save_and_close
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.select_diff_group_detail('1')
  differentiators_diff.edit_diff_group_detail('2')
  differentiators_diff.save_and_close

end

Then(/^the record is update to the Group Detail window and RMS DB$/) do
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.select_diff_group_detail('2')
  differentiators_diff.verify_diff_group_detail(expected_values:'M Medium')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_group_detail_table(@new_id, YML_DATA['dgd_detail_2'], '2')
  database.disconnect_db
  differentiators_diff.delete_diff_group
  login_page.logout_to_rms
end

When(/^a user delete a Group Details$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['type_1'], YML_DATA['division'], YML_DATA['dept'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['dgd_detail_1'])
  differentiators_diff.create_diff_group_detail('2', YML_DATA['dgd_detail_2'])
  differentiators_diff.create_diff_group_detail('3', YML_DATA['dgd_detail_3'])
  differentiators_diff.save_and_close
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.select_diff_group_detail('1')
  differentiators_diff.delete_diff_group_detail
end

Then(/^the record is delete on the Diff Group table and RMS DB$/) do
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.select_diff_group_detail('1')
  differentiators_diff.verify_diff_group_detail(expected_values: 'No data to display.')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_diff_group_detail_table(@new_id, '1')
  database.disconnect_db
  login_page.logout_to_rms
end

############### Diff Range ######################

Given(/^a user is in Create Diff Range Range screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_create_diff_range
end

When(/^user enters the Range, Range Type and selects a Diff Type and Group for Diff types 1-3$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_range_id
  database.disconnect_db
  differentiators_diff.create_diff_range(@new_id, 'New Range', YML_DATA['type_1'], YML_DATA['dr_group_1'],
                                         YML_DATA['type_2'], YML_DATA['dr_group_2'])
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_1'], YML_DATA['size_1'], '100')
  differentiators_diff.save_and_close
end

Then(/^the Diff Range Header record is created in RMS and RMS DB$/) do
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_range_header_table(@new_id, 'New Range', YML_DATA['dr_group_1'], YML_DATA['dr_group_2'], 'R' )
  database.disconnect_db
  differentiators_diff.delete_diff_range
  login_page.logout_to_rms
end

Given(/^user has created the Diff Range Header$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_create_diff_range
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_range_id
  database.disconnect_db
  differentiators_diff.create_diff_range(@new_id, 'New Range', YML_DATA['type_1'], YML_DATA['dr_group_1'],
                                         YML_DATA['type_2'], YML_DATA['dr_group_2'])
end

When(/^user enters the Diff Range information$/) do
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_1'], YML_DATA['size_1'], '100')
  differentiators_diff.save_and_close
end

Then(/^the Diff Range Detail record is created in RMS and RMS DB$/) do
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
  differentiators_diff.verify_diff_range(expected_values:'KNG King BLACK Black 100')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_range_detail_table(@new_id, YML_DATA['size_1'], YML_DATA['colour_1'], '100.0', '1')
  database.disconnect_db
  differentiators_diff.delete_diff_range
  login_page.logout_to_rms
end

Given(/^a user is in Manage Diff Range screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_create_diff_range
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_range_id
  database.disconnect_db
  differentiators_diff.create_diff_range(@new_id, 'New Range', YML_DATA['type_1'], YML_DATA['dr_group_1'],
                                         YML_DATA['type_2'], YML_DATA['dr_group_2'])
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_1'], YML_DATA['size_1'],'100')
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_2'], YML_DATA['size_2'],'100')
  differentiators_diff.save_and_close
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
end

When(/^user enters the Diff Range details to a existent Range Header$/) do
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_3'], YML_DATA['size_3'],'100')
  differentiators_diff.save_and_close
end

Then(/^the Diff Range details is created in RMS and RMS DB$/) do
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
  differentiators_diff.verify_diff_range(expected_values:'KNG King BLACK Black 100')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_range_detail_table(@new_id, YML_DATA['size_1'], YML_DATA['colour_1'], '100.0')
  database.disconnect_db
  differentiators_diff.delete_diff_range
  login_page.logout_to_rms
end

Given(/^a user retrieves the Range Header and Range Details$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_create_diff_range
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_range_id
  database.disconnect_db
  differentiators_diff.create_diff_range(@new_id, 'New Range', YML_DATA['type_1'], YML_DATA['dr_group_1'],
                                         YML_DATA['type_2'], YML_DATA['dr_group_2'])
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_1'], YML_DATA['size_1'],'100')
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_3'], YML_DATA['size_3'],'100')
  differentiators_diff.save_and_close
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)

end

When(/^user updates the Diff Range Detail$/) do
  differentiators_diff.select_diff_range_detail(YML_DATA['size_3'])
  differentiators_diff.edit_diff_range_detail(YML_DATA['colour_2'], YML_DATA['size_2'],'100')

end

Then(/^the Diff Range Detail is updated in RMS and RMS DB$/) do
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
  differentiators_diff.select_diff_range_detail(YML_DATA['size_2'])
  differentiators_diff.verify_diff_range(expected_values:'QN Queen WHITE White 100')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_range_detail_table(@new_id, YML_DATA['size_2'], YML_DATA['colour_2'], '100.0')
  database.disconnect_db
  differentiators_diff.delete_diff_range
  login_page.logout_to_rms
end

When(/^user deletes the Range Details$/) do
  differentiators_diff.select_diff_range_detail(YML_DATA['size_3'])
  differentiators_diff.delete_diff_range_detail
  differentiators_diff.select_diff_range_detail('')
  differentiators_diff.save_and_close
end

Then(/^the Range Details is removed in RMS and RMS DB$/) do
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
  differentiators_diff.select_diff_range_detail(YML_DATA['size_3'])
  differentiators_diff.verify_diff_range(expected_values:'No data to display.')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_diff_range_detail_table(@new_id, YML_DATA['size_3'])
  database.disconnect_db
  differentiators_diff.delete_diff_range
  login_page.logout_to_rms

end

############### Diff Ratio ######################

Given(/^a user is in Create Diff Ratio screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_create_diff_ratio
end

When(/^user enters the relevant Merchandise details, Sub-Department, Category, Sub-Category$/) do
  @new_id = differentiators_diff.diff_ratio_id
  differentiators_diff.create_diff_ratio('New Diff Ratio', YML_DATA['subdpt'], YML_DATA['category'], YML_DATA['subcategory'], YML_DATA['Test_Group_colour'],
                                          YML_DATA['Test_Group_Compatibility'], YML_DATA['Test_Diff_Group_Flavour'], '2')
  differentiators_diff.save_and_close
end


Then(/^the Diff Ratio is created in RMS and RMS DB$/) do
  differentiators_diff.open_manage_diff_ratio
  differentiators_diff.search_diff_ratio(@new_id)
  differentiators_diff.verify_diff_ratio(expected_values:'New Diff Ratio 44 Test Department 1 Test Class 1 Test Subclass')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_ratio_table(@new_id, 'New Diff Ratio', YML_DATA['department'], YML_DATA['class'], YML_DATA['subclass'], YML_DATA['Test_Group_colour'],
                                   YML_DATA['Test_Group_Compatibility'], YML_DATA['Test_Diff_Group_Flavour'], '2')
  database.disconnect_db
  differentiators_diff.delete_diff_ratio
  login_page.logout_to_rms
end

Given(/^a user is in Manage Diff Ratio screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_manage_diff_ratio

end

When(/^user enters Ratio the search criteria$/) do
  differentiators_diff.search_diff_ratio('')
end

Then(/^the results for the search criteria is displayed in the Results table$/) do
  differentiators_diff.add_diff_ratio
  @new_id = differentiators_diff.diff_ratio_id
  differentiators_diff.create_diff_ratio('New Diff Ratio', YML_DATA['department'], YML_DATA['class'], YML_DATA['subclass2'],
                                         YML_DATA['Test_Group_colour'], YML_DATA['Test_Group_Compatibility'], YML_DATA['Test_Diff_Group_Flavour'], '2')
  differentiators_diff.save_and_close
  differentiators_diff.search_diff_ratio(@new_id)
  differentiators_diff.verify_diff_ratio(expected_values:'New Diff Ratio 44 Test Department 1 Test Class 2 Test Subclass')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_ratio_table(@new_id, 'New Diff Ratio', YML_DATA['department'], YML_DATA['class'], YML_DATA['subclass2'],
                                   YML_DATA['Test_Group_colour'], YML_DATA['Test_Group_Compatibility'], YML_DATA['Test_Diff_Group_Flavour'], '2')
  database.disconnect_db
  differentiators_diff.delete_diff_ratio
  login_page.logout_to_rms
end


Then(/^user can create a new Ratio by entering Ratio Description and Merchandise Hierarchy details$/) do
  differentiators_diff.add_diff_ratio
  @new_id = differentiators_diff.diff_ratio_id
  differentiators_diff.create_diff_ratio('New Diff Ratio', YML_DATA['department'], YML_DATA['class'], YML_DATA['subclass2'],
                                         YML_DATA['Test_Group_colour'], YML_DATA['Test_Group_Compatibility'], YML_DATA['Test_Diff_Group_Flavour'], '2')
  differentiators_diff.save_and_close
  differentiators_diff.search_diff_ratio(@new_id)
  differentiators_diff.verify_diff_ratio(expected_values:'New Diff Ratio 44 Test Department 1 Test Class 2 Test Subclass')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_ratio_table(@new_id, 'New Diff Ratio', YML_DATA['department'], YML_DATA['class'], YML_DATA['subclass2'],
                                   YML_DATA['Test_Group_colour'], YML_DATA['Test_Group_Compatibility'], YML_DATA['Test_Diff_Group_Flavour'], '2')
  database.disconnect_db
  differentiators_diff.delete_diff_ratio
  login_page.logout_to_rms
end

Then(/^user amend the Ratio Description and Merchandise Hierarchy details$/) do
  differentiators_diff.add_diff_ratio
  @new_id = differentiators_diff.diff_ratio_id
  differentiators_diff.create_diff_ratio('New Diff Ratio', YML_DATA['department'], YML_DATA['class'], YML_DATA['subclass3'],
                                         YML_DATA['Test_Group_colour'], YML_DATA['Test_Group_Compatibility'], YML_DATA['Test_Diff_Group_Flavour'], '2')
  differentiators_diff.save_and_close
end

Then(/^the Diff Ratio will be updated in RMS DB$/) do
  differentiators_diff.search_diff_ratio(@new_id)
  differentiators_diff.edit_diff_ratio('Change Diff Ratio', '3', '9/20/19')
  differentiators_diff.search_diff_ratio(@new_id)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_ratio_table(@new_id, 'Change Diff Ratio', YML_DATA['department'], YML_DATA['class'], YML_DATA['subclass'], YML_DATA['Test_Group_colour'],
                                   YML_DATA['Test_Group_Compatibility'], YML_DATA['Test_Diff_Group_Flavour'], '3')
  database.disconnect_db
  differentiators_diff.verify_diff_ratio(expected_values:'Change Diff Ratio 44 Test Department 1 Test Class 3 Test Subclass')
  differentiators_diff.delete_diff_ratio
  login_page.logout_to_rms
end

############### Diffs Data ######################

Given(/^a user is in Download screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_download
end

When(/^user selects Template Type, Template and opts for Download$/) do
  foundation_data_loading.download_file('Items', 'Differentiators')
end
Then(/^a excel file is downloaded containing multiple tabs, namely, Diff Types and Diff IDs$/) do
  login_page.logout_to_rms
end

Given(/^a user is in Upload screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  foundation_data_loading.open_data_loading
  foundation_data_loading.open_data_loading_upload
end

When(/^user selects the Template Type and Template which auto populates the Process Description with timestamp$/) do
  foundation_data_loading.upload_options_screen('Items', 'Differentiators')
  @process_description = foundation_data_loading.process_description
end

Then(/^user upload the source file with changes on Diff Type tab for Action, Diff Type and Description$/) do
  foundation_data_loading.upload_a_file('Differentiators - diff_types.ods')
  foundation_data_loading.verify_upload(@process_description)
  login_page.logout_to_rms
end

Then(/^upload the source file with changes on Diff IDs tab for Action, Diff ID, Description and Diff Type$/) do
  differentiators_diff.upload_a_file('Differentiators - diff_ids.ods')
  differentiators_diff.verify_upload(@process_description)
  login_page.logout_to_rms
end

