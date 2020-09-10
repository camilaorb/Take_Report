
############### Diff Groups ######################

Given(/^a user is in Differentiator Groups screen$/) do
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_diff_groups
end

When(/^they create a Diff Group where Group, Group Description, Type are mandatory are mandatory$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['colour'], YML_DATA['CRC'], YML_DATA['division'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['colour_2'])
  differentiators_diff.save_and_close
end

Then(/^the new Diff Group is add on the top of Diff Group table and created RMS DB$/) do
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.verify_actions(expected_values:'New Diff Group')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_group_table(@new_id, 'New Diff Group', YML_DATA['colour'] )
  database.disconnect_db
  login_page.logout_to_rms
end


When(/^the user is able to update Group Description, Chain, Division in RMS$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['colour'], YML_DATA['CRC'], YML_DATA['division'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['colour_2'])
  differentiators_diff.save_and_close
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.edit_diff_group('Changed Group', YML_DATA['CRC'], YML_DATA['division'])
  differentiators_diff.save_and_close
end
Then(/^the record is update to the Diff Group table and RMS DB$/) do
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.verify_actions(expected_values:'Changed Group')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_group_table(@new_id, 'Changed Group', YML_DATA['colour'] )
  database.disconnect_db
  login_page.logout_to_rms
end


When(/^a user delete a the Diff Groups$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['colour'], YML_DATA['CRC'], YML_DATA['division'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['colour_2'])
  differentiators_diff.save
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.delete_diff_group
end

Then(/^the record is removed from the Diff Groups table and RMS DB$/) do
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.verify_actions(expected_values:'No data to display.')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_diff_group_table(@new_id)
  database.disconnect_db
  login_page.logout_to_rms
end



########## Group Details ##########

When(/^a user enter Group Details, Sequence and Colour in the Group Detail window$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['colour'], YML_DATA['CRC'], YML_DATA['division'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['colour_2'])
  differentiators_diff.save_and_close
end

Then(/^a record is created to the Group Detail window and RMS DB$/) do
  differentiators_diff.open_diff_groups
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.select_diff_group_detail('1')
  differentiators_diff.verify_diff_group_detail(expected_values:'1012 Black 2')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_group_detail_table(@new_id, YML_DATA['colour_2'], '1')
  database.disconnect_db
  login_page.logout_to_rms
end

When(/^a user update the Sequence in the Group Detail table$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['colour'], YML_DATA['CRC'], YML_DATA['division'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['colour_2'])
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
  differentiators_diff.verify_diff_group_detail(expected_values:'1012')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_group_detail_table(@new_id, YML_DATA['colour_2'], '2')
  database.disconnect_db
  login_page.logout_to_rms
end

When(/^a user delete a Group Details$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_group_id
  database.disconnect_db
  differentiators_diff.create_diff_group(@new_id, 'New Diff Group', YML_DATA['colour'], YML_DATA['CRC'], YML_DATA['division'])
  differentiators_diff.select_diff_group(@new_id)
  differentiators_diff.create_diff_group_detail('1', YML_DATA['colour_1'])
  differentiators_diff.create_diff_group_detail('2', YML_DATA['colour_2'])
  differentiators_diff.create_diff_group_detail('3', YML_DATA['colour_3'])
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
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_create_diff_range
end

When(/^user enters the Range, Range Type and selects a Diff Type and Group for Diff types 1-3$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_range_id
  database.disconnect_db
  differentiators_diff.create_diff_range(@new_id, 'New Range', YML_DATA['colour'], YML_DATA['Test_Group_colour'],
                                         YML_DATA['compatibility'], YML_DATA['Test_Group_Compatibility'], YML_DATA['flavour'],
                                         YML_DATA['Test_Diff_Group_Flavour'])
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_2'], YML_DATA['compatibility_1'], YML_DATA['flavour_1'],'123')
end

Then(/^the Diff Range Header record is created in RMS and RMS DB$/) do
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_range_header_table(@new_id, 'New Range', YML_DATA['Test_Group_colour'], YML_DATA['Test_Group_Compatibility'], YML_DATA['Test_Diff_Group_Flavour'], 'R' )
  database.disconnect_db
  login_page.logout_to_rms
end

Given(/^user has created the Diff Range Header$/) do
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_create_diff_range
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_range_id
  database.disconnect_db
  differentiators_diff.create_diff_range(@new_id, 'New Range', YML_DATA['colour'], YML_DATA['Test_Group_colour'],
                                         YML_DATA['compatibility'], YML_DATA['Test_Group_Compatibility'], YML_DATA['flavour'],
                                         YML_DATA['Test_Diff_Group_Flavour'])
end

When(/^user enters the Diff Range informations$/) do
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_2'], YML_DATA['compatibility_1'], YML_DATA['flavour_1'],'123')
end

Then(/^the Diff Range Detail record is created in RMS and RMS DB$/) do
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
  differentiators_diff.verify_diff_range(expected_values:'1012 Black 2 40701 Option 1 30701 Almond 123')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_range_detail_table(@new_id, YML_DATA['colour_2'], YML_DATA['compatibility_1'], YML_DATA['flavour_1'],'123.0', '1')
  database.disconnect_db
  login_page.logout_to_rms
end

Given(/^a user is in Manage Diff Range screen$/) do
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_create_diff_range
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_range_id
  database.disconnect_db
  differentiators_diff.create_diff_range(@new_id, 'New Range', YML_DATA['colour'], YML_DATA['Test_Group_colour'],
                                         YML_DATA['compatibility'], YML_DATA['Test_Group_Compatibility'], YML_DATA['flavour'],
                                         YML_DATA['Test_Diff_Group_Flavour'])
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_2'], YML_DATA['compatibility_1'], YML_DATA['flavour_1'],'123')
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
end

When(/^user enters the Diff Range details to a existent Range Header$/) do
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_3'], YML_DATA['compatibility_2'], YML_DATA['flavour_2'],'2')
end

Then(/^the Diff Range details is created in RMS and RMS DB$/) do
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
  differentiators_diff.verify_diff_range(expected_values:'1012 Black 2 40701 Option 1 30701 Almond 123')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_range_detail_table(@new_id, YML_DATA['colour_3'], YML_DATA['compatibility_2'], YML_DATA['flavour_2'],'2.0', '2')
  database.disconnect_db
  login_page.logout_to_rms
end

Given(/^a user retrieves the Range Header and Range Details$/) do
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_create_diff_range
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.diff_range_id
  database.disconnect_db
  differentiators_diff.create_diff_range(@new_id, 'New Range', YML_DATA['colour'], YML_DATA['Test_Group_colour'],
                                         YML_DATA['compatibility'], YML_DATA['Test_Group_Compatibility'], YML_DATA['flavour'],
                                         YML_DATA['Test_Diff_Group_Flavour'])
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_2'], YML_DATA['compatibility_1'], YML_DATA['flavour_1'],'123')
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)

end

When(/^user updates the Diff Range Detail$/) do
  differentiators_diff.edit_diff_range_detail(YML_DATA['colour_3'], YML_DATA['compatibility_2'], YML_DATA['flavour_2'],'321')

end

Then(/^the Diff Range Detail is updated in RMS and RMS DB$/) do
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
  differentiators_diff.verify_diff_range(expected_values:'1013 Black 3 40702 Option 2 30702 Hazelnut 321')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_diff_range_detail_table(@new_id, YML_DATA['colour_3'], YML_DATA['compatibility_2'], YML_DATA['flavour_2'],'321.0', '1')
  database.disconnect_db
  login_page.logout_to_rms
end

When(/^user deletes the Range Details$/) do
  differentiators_diff.create_diff_range_detail(YML_DATA['colour_3'], YML_DATA['compatibility_2'], YML_DATA['flavour_2'],'321')
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
  differentiators_diff.select_diff_range_detail('123')
  differentiators_diff.delete_diff_range_detail
  differentiators_diff.select_diff_range_detail('')
  differentiators_diff.save_and_close
end

Then(/^the Range Details is removed in RMS and RMS DB$/) do
  differentiators_diff.open_manage_diff_range
  differentiators_diff.select_diff_range(@new_id)
  differentiators_diff.select_diff_range_detail('123')
  differentiators_diff.verify_diff_range(expected_values:'No data to display.')
  differentiators_diff.select_diff_range_detail('')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_diff_range_detail_table(@new_id)
  database.disconnect_db
  login_page.logout_to_rms
end

############### Diff Ratio ######################

Given(/^a user is in Create Diff Ratio screen$/) do
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_create_diff_ratio
end

When(/^user enters Ratio Description, Generated By, Merch Hier Details, Group, Sales Type and Build Time Period$/) do
  @new_id = differentiators_diff.diff_ratio_id
  differentiators_diff.create_diff_ratio('New Diff Ratio', YML_DATA['department'], YML_DATA['class'], YML_DATA['subclass'], YML_DATA['Test_Group_colour'],
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
  visit(EnvConfig['url'])
  login_page.login_to_rms(EnvConfig['user'], EnvConfig['pw'])
  differentiators_diff.open_differentiators
  differentiators_diff.open_manage_diff_ratio

end

When(/^Search for a diff ratio by using basic or advanced search criteria$/) do
  differentiators_diff.search_diff_ratio('')
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