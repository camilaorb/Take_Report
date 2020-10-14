

Given(/^a user is in Merchandise Hierarchy screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  merchandise_hierarchy.open_merchandise_hierarchy
end

############### Division ######################

When(/^they create a new Division where Division ID, Name, Total Market Amounts, Buyer Name and Merchandiser name are mandatory$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.division_id
  database.disconnect_db
  merchandise_hierarchy.create_new_division(@new_id,'New Division', YML_DATA['buyer'], YML_DATA['merchandiser'], '100000')
end

Then(/^the new Division is add on the Division table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_division
  merchandise_hierarchy.select_division(@new_id)
  merchandise_hierarchy.verify_actions(expected_values:'New Division 5674 AbigailGlover 7100 AadeelaBux 100,000.00')
end

And(/^the Division will be created RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_division_table(@new_id, 'New Division', YML_DATA['buyer_no'], YML_DATA['merchandiser_no'])
  database.disconnect_db
  merchandise_hierarchy.delete_item
  login_page.logout_to_rms
end


When(/^the user edits the fields Name, Total Market Amounts, Buyer Name and Merchandiser name on a Division$/) do
  merchandise_hierarchy.access_division
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.division_id
  database.disconnect_db
  merchandise_hierarchy.create_new_division(@new_id,'New Division', YML_DATA['buyer'], YML_DATA['merchandiser'], '100000')
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_division
  merchandise_hierarchy.select_division(@new_id)
  merchandise_hierarchy.edit_division('Change Division', YML_DATA['buyer_2'], YML_DATA['merchandiser_2'], '200000')

end

Then(/^the changes is visible on the Division table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_division
  merchandise_hierarchy.select_division(@new_id)
  merchandise_hierarchy.verify_actions(expected_values: 'Change Division 6895 BeaujolaisKerry 7001 BandileMbatha')
end

And(/^the division record will be updated in RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_division_table(@new_id, 'Change Division', YML_DATA['buyer_no_2'], YML_DATA['merchandiser_no_2'])
  database.disconnect_db
  merchandise_hierarchy.delete_item
  login_page.logout_to_rms
end

When(/^they delete a Division$/) do
  merchandise_hierarchy.access_division
  merchandise_hierarchy.access_division
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.division_id
  database.disconnect_db
  merchandise_hierarchy.create_new_division(@new_id,'New Division', YML_DATA['buyer'], YML_DATA['merchandiser'], '100000')
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_division
  merchandise_hierarchy.select_division(@new_id)
  merchandise_hierarchy.delete_item

end

Then(/^the Division is removed from RMS$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_division
  merchandise_hierarchy.select_division(@new_id)
  merchandise_hierarchy.verify_actions(expected_values:'No data to display.')
  login_page.logout_to_rms
end

And(/^the Division is removed from RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_division_table(@new_id)
  database.disconnect_db
end

############### Department ######################

When(/^they create a new Department where Department, Name and Division are mandatory$/) do
  merchandise_hierarchy.access_dept
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.department_id
  database.disconnect_db
  merchandise_hierarchy.create_new_dept(@new_id, 'New Department', YML_DATA['buyer'], YML_DATA['merchandiser'], YML_DATA['division'])

end

Then(/^the new Department is add on the Department table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_dept
  merchandise_hierarchy.select_dept(@new_id)
  merchandise_hierarchy.verify_actions(expected_values:'New Department')
end

And(/^The Department will be created RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_department_table(@new_id, 'New Department', YML_DATA['buyer_no'], YML_DATA['merchandiser_no'])
  database.disconnect_db
  merchandise_hierarchy.delete_item
  login_page.logout_to_rms
end


When(/^the user edits the fields Name, Division, Buyer Name and Merchandiser Name on a Department where Name is mandatory$/) do
  merchandise_hierarchy.access_dept
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.department_id
  database.disconnect_db
  merchandise_hierarchy.create_new_dept(@new_id, 'New Department', YML_DATA['buyer'], YML_DATA['merchandiser'], YML_DATA['division'])
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_dept
  merchandise_hierarchy.select_dept(@new_id)
  merchandise_hierarchy.edit_dept('Change Department', YML_DATA['buyer_2'], YML_DATA['merchandiser_2'])#this popup fields are different from the others.

end

Then(/^the changes is visible on the Department table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_dept
  merchandise_hierarchy.select_dept(@new_id)
  merchandise_hierarchy.verify_actions(expected_values:'Change Department')

end

And(/^The Department will be updated in RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_department_table(@new_id, 'Change Department', YML_DATA['buyer_no_2'], YML_DATA['merchandiser_no_2'])
  database.disconnect_db
  merchandise_hierarchy.delete_item
  login_page.logout_to_rms
end

When(/^they delete a Department$/) do
  merchandise_hierarchy.access_dept
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.department_id
  database.disconnect_db
  merchandise_hierarchy.create_new_dept(@new_id, 'New Department', YML_DATA['buyer'], YML_DATA['merchandiser'], YML_DATA['division'])
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_dept
  merchandise_hierarchy.select_dept(@new_id)
  merchandise_hierarchy.delete_item
end

Then(/^the Department is removed from RMS$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_dept
  merchandise_hierarchy.select_dept(@new_id)
  merchandise_hierarchy.verify_actions(expected_values:'No data to display.')
  login_page.logout_to_rms
end

And(/^The Department is removed from RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_department_table(@new_id)
  database.disconnect_db
end

############### Category ######################

When(/^create a new Category where Category ID and Name are mandatory$/) do
  merchandise_hierarchy.access_category(YML_DATA['subdpt'])
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.category_id(YML_DATA['subdpt'])
  database.disconnect_db
  merchandise_hierarchy.create_new_category(@new_id, 'New Category')

end

Then(/^the new Category is add on the Category table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_category(YML_DATA['subdpt'])
  merchandise_hierarchy.select_category(@new_id)
  merchandise_hierarchy.verify_actions(expected_values:'New Category')
end

And(/^The Category will be created RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_category_table(@new_id, YML_DATA['subdpt'], 'New Category')
  merchandise_hierarchy.delete_category
  login_page.logout_to_rms
  database.disconnect_db
end

When(/^the user edits the mandatory fields on a Category$/) do
  merchandise_hierarchy.access_category(YML_DATA['subdpt'])
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.category_id(YML_DATA['subdpt'])
  database.disconnect_db
  merchandise_hierarchy.create_new_category(@new_id,'New Category')
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_category(YML_DATA['subdpt'])
  merchandise_hierarchy.select_category(@new_id)
  merchandise_hierarchy.edit_category('Change Category')

end

Then(/^the changes is visible on the Category table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_category(YML_DATA['subdpt'])
  merchandise_hierarchy.select_category(@new_id)
  merchandise_hierarchy.verify_actions(expected_values:'Change Category')
end

And(/^The Category will be updated in RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_category_table(@new_id, YML_DATA['subdpt'],'Change Category')
  merchandise_hierarchy.delete_category
  login_page.logout_to_rms
  database.disconnect_db
end

When(/^they delete a Category$/) do
  merchandise_hierarchy.access_category(YML_DATA['subdpt'])
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.category_id(YML_DATA['subdpt'])
  database.disconnect_db
  merchandise_hierarchy.create_new_category(@new_id,'New Category')
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_category(YML_DATA['subdpt'])
  merchandise_hierarchy.select_category(@new_id)
  merchandise_hierarchy.delete_category
end

Then(/^the Category is removed from RMS$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_category(YML_DATA['subdpt'])
  merchandise_hierarchy.select_category(@new_id)
end

And(/^the Category is on the Daily Purge table to be remove from RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_dlyprg_table("00#{YML_DATA['subdpt']};000#{@new_id}")
  database.disconnect_db
  login_page.logout_to_rms
end

############### Sub Category ######################

When(/^create a new Sub Category where Sub Category ID and Name are mandatory$/) do
  merchandise_hierarchy.access_subcategory(YML_DATA['subdpt'], YML_DATA['category'])
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.subcategory_id(YML_DATA['subdpt'], YML_DATA['category'])
  database.disconnect_db
  merchandise_hierarchy.create_new_subcategory(@new_id, 'New Sub Category')

end

Then(/^the new Sub Category is add on the Sub Category table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_subcategory(YML_DATA['subdpt'], YML_DATA['category'])
  merchandise_hierarchy.select_subcategory(@new_id)
  merchandise_hierarchy.verify_actions(expected_values:'New Sub Category')
end

And(/^The Sub Category will be created RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_subcategory_table(@new_id, YML_DATA['subdpt'], YML_DATA['category'], 'New Sub Category')
  database.disconnect_db
  merchandise_hierarchy.delete_subcategory
  login_page.logout_to_rms
end


When(/^the user edits the mandatory fields on a Sub Category$/) do
  merchandise_hierarchy.access_subcategory(YML_DATA['subdpt'], YML_DATA['category'])
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.subcategory_id(YML_DATA['subdpt'], YML_DATA['category'])
  database.disconnect_db
  merchandise_hierarchy.create_new_subcategory(@new_id, 'New Sub Category')
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_subcategory(YML_DATA['subdpt'], YML_DATA['category'])
  merchandise_hierarchy.select_subcategory(@new_id)
  merchandise_hierarchy.edit_subcategory('Change Sub Category')
end

Then(/^the changes is visible on the Sub Category table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_subcategory(YML_DATA['subdpt'], YML_DATA['category'])
  merchandise_hierarchy.select_subcategory(@new_id)
  merchandise_hierarchy.verify_actions(expected_values:'Change Sub Category')
end

And(/^the Sub Category will be updated in RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_subcategory_table(@new_id, YML_DATA['subdpt'], YML_DATA['category'], 'Change Sub Category')
  database.disconnect_db
  merchandise_hierarchy.delete_subcategory
  login_page.logout_to_rms
end


When(/^they delete a Sub Category$/) do
  merchandise_hierarchy.access_subcategory(YML_DATA['subdpt'], YML_DATA['category'])
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.subcategory_id(YML_DATA['subdpt'], YML_DATA['category'])
  database.disconnect_db
  merchandise_hierarchy.create_new_subcategory(@new_id, 'New Sub Category')
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_subcategory(YML_DATA['subdpt'], YML_DATA['category'])
  merchandise_hierarchy.select_subcategory(@new_id)
  merchandise_hierarchy.delete_subcategory
end

Then(/^the Sub Category is removed from RMS$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_subcategory(YML_DATA['subdpt'], YML_DATA['category'])
  merchandise_hierarchy.select_subcategory(@new_id)
  merchandise_hierarchy.verify_delete_batch_message
end

And(/^the Sub Category is on the Daily Purge table to be remove from RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_dlyprg_table("00#{YML_DATA['subdpt']};00#{YML_DATA['category']};000#{@new_id}")
  database.disconnect_db
  login_page.logout_to_rms
end

############### Sub-Department ######################

When(/^Create a new Sub-Department by enter the mandatory fields$/) do
  merchandise_hierarchy.access_subdpt
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.subdpt_id
  database.disconnect_db
  merchandise_hierarchy.create_new_subdpt(@new_id,'New Sub-Department', YML_DATA['dept'], YML_DATA['buyer'], YML_DATA['merchandiser'],
                                          '10', '10', '1', '1', YML_DATA['profit_calc_type'], YML_DATA['otb_calc_type'], YML_DATA['purchase_type'], '10000' )
  merchandise_hierarchy.access_new_vat
  super_merch_hier.create_multiple_vat
  merchandise_hierarchy.save_and_close_subdpt_actions

end

Then(/^the new Sub-Department is add on the Sub-Department table$/) do
  merchandise_hierarchy.access_subdpt
  merchandise_hierarchy.select_subdpt(@new_id)
  merchandise_hierarchy.verify_actions(expected_values:'New Sub-Department')
end

And(/^The Sub-Department will be created RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_subsubdept_table(@new_id, 'New Sub-Department', YML_DATA['buyer_no'], YML_DATA['merchandiser_no'], '1',	'0',	'33',
                                   '9.0909', '10', '10000000', 'R', 'C', '1 ','1')
  database.disconnect_db
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end

When(/^the user edits the mandatory fields on a Sub-Department$/) do
  merchandise_hierarchy.access_subdpt
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.subdpt_id
  database.disconnect_db
  merchandise_hierarchy.create_new_subdpt(@new_id,'New Sub-Department', YML_DATA['dept'], YML_DATA['buyer'], YML_DATA['merchandiser'],
                                          '10', '10', '1', '1', YML_DATA['profit_calc_type'], YML_DATA['otb_calc_type'], YML_DATA['purchase_type'], '10000' )
  merchandise_hierarchy.access_new_vat
  super_merch_hier.create_multiple_vat
  merchandise_hierarchy.save_and_close_subdpt_actions
  merchandise_hierarchy.select_subdpt(@new_id)
  merchandise_hierarchy.edit_subdpt('Change Sub-Department', YML_DATA['dept'], YML_DATA['buyer_2'], YML_DATA['merchandiser_2'],
  '20', '20', '2', '2', YML_DATA['profit_calc_type_2'], YML_DATA['otb_calc_type_2'], YML_DATA['purchase_type_2'], '20000')
end

Then(/^the changes is visible on the Sub-Department table$/) do
  merchandise_hierarchy.select_subdpt(@new_id)
  merchandise_hierarchy.verify_actions(expected_values:'Change Sub-Department')
end

And(/^The Sub-Department will be updated in RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_edit_subsubdept_table(@new_id, 'Change Sub-Department')
  database.disconnect_db
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end

When(/^they delete a Sub-Department$/) do
  merchandise_hierarchy.access_subdpt
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.subdpt_id
  database.disconnect_db
  merchandise_hierarchy.create_new_subdpt(@new_id,'New Sub-Department', YML_DATA['dept'], YML_DATA['buyer'], YML_DATA['merchandiser'],
                                          '10', '10', '1', '1', YML_DATA['profit_calc_type'], YML_DATA['otb_calc_type'], YML_DATA['purchase_type'], '10000' )
  merchandise_hierarchy.access_new_vat
  super_merch_hier.create_multiple_vat
  merchandise_hierarchy.save_and_close_subdpt_actions
  merchandise_hierarchy.select_subdpt(@new_id)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.delete_subdpt

end

Then(/^the Sub-Department is removed from RMS$/) do
  merchandise_hierarchy.select_subdpt(@new_id)
  merchandise_hierarchy.subdpt_confirm_delete
end

And(/^the Sub-Department is removed from RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_dlyprg_table("#{@new_id}")
  database.disconnect_db
  login_page.logout_to_rms
end


############### VAT ######################

Given(/^a user access a Sub-Department$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  merchandise_hierarchy.open_merchandise_hierarchy
  merchandise_hierarchy.access_subdpt
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_dpt = database.subdpt_id
  database.disconnect_db
  merchandise_hierarchy.create_new_subdpt(@new_dpt,'New Sub-Department', YML_DATA['dept'], YML_DATA['buyer'], YML_DATA['merchandiser'],
                                          '10', '10', '1', '1', YML_DATA['profit_calc_type'], YML_DATA['otb_calc_type'], YML_DATA['purchase_type'], '10000' )
  merchandise_hierarchy.access_new_vat
  super_merch_hier.create_multiple_vat
end

When(/^user adds VAT region$/) do
  merchandise_hierarchy.create_vat(YML_DATA['SA'], YML_DATA['v_code_3'], YML_DATA['C'])
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^VAT regions and VAT codes that are entered at the Sub-Department level become default for items within the Sub-Department$/) do
  merchandise_hierarchy.select_subdpt(@new_dpt)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_vat
  merchandise_hierarchy.select_vat(YML_DATA['SA'], YML_DATA['v_code_3'], YML_DATA['DB_C'])
  merchandise_hierarchy.verify_vat(expected_values:'South Africa')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_vat_table(@new_dpt, YML_DATA['SA'], YML_DATA['v_code_3'], YML_DATA['DB_C'])
  database.disconnect_db
  merchandise_hierarchy.close_vat
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end


When(/^user updates VAT region$/) do
  merchandise_hierarchy.save_and_close_subdpt_actions
  merchandise_hierarchy.select_subdpt(@new_dpt)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_vat
  merchandise_hierarchy.select_vat(YML_DATA['NAM'], YML_DATA['v_code_1'], YML_DATA['DB_B'])
  merchandise_hierarchy.edit_vat(YML_DATA['v_code_30'])
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^updates VAT regions and VAT codes that are entered at the Sub-Department level become default for items within the Sub-Department$/) do
  merchandise_hierarchy.select_subdpt(@new_dpt)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_vat
  merchandise_hierarchy.select_vat(YML_DATA['NAM'], YML_DATA['v_code_30'], YML_DATA['DB_C'])
  merchandise_hierarchy.verify_vat(expected_values:'VAT STD RATE-SALES (OUTPUT)')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_vat_table(@new_dpt, YML_DATA['NAM'], YML_DATA['v_code_30'], YML_DATA['DB_B'])
  database.disconnect_db
  merchandise_hierarchy.close_vat
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end

When(/^user deletes VAT region$/) do
  merchandise_hierarchy.create_vat(YML_DATA['SA'], YML_DATA['v_code_3'], YML_DATA['C'])
  merchandise_hierarchy.save_and_close_subdpt_actions
  merchandise_hierarchy.select_subdpt(@new_dpt)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_vat
  merchandise_hierarchy.select_vat(YML_DATA['SA'], YML_DATA['v_code_3'], YML_DATA['DB_C'])
  merchandise_hierarchy.delete_vat
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^VAT regions and VAT codes are delete at the Sub-Department level$/) do
  merchandise_hierarchy.select_subdpt(@new_dpt)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_vat
  merchandise_hierarchy.select_vat(YML_DATA['SA'], YML_DATA['v_code_3'], YML_DATA['DB_C'])
  merchandise_hierarchy.verify_vat(expected_values:'No data to display.')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_vat_table(@new_dpt, YML_DATA['SA'], YML_DATA['v_code_3'], YML_DATA['DB_C'])
  database.disconnect_db
  merchandise_hierarchy.close_vat
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end

############### Merch Hier Defaults ######################

Given(/^a user access a existent Sub-Department$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  merchandise_hierarchy.open_merchandise_hierarchy
  merchandise_hierarchy.access_subdpt
  merchandise_hierarchy.select_subdpt(YML_DATA['subdpt'])
  merchandise_hierarchy.access_select_subdpt
end

When(/^a user adds Default with Information, Category and Sub Category by the Merchandise Hierarchy Default window$/) do
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.create_merch_hier_defaults(YML_DATA['information2'], '1', '1')
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^the default information for the Sub-Department is created in RMS RMS database only for the Categoryes and Subcategoryes within that Sub-Department$/) do
  merchandise_hierarchy.select_subdpt(YML_DATA['subdpt'])
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.select_merch_hier_defaults(YML_DATA['information2'])
  merchandise_hierarchy.verify_merch_hier_defaults(expected_values:'DIFF Diffs')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_merch_hier_table(YML_DATA['subdpt'], YML_DATA['information2'], '1', '1', 'N')
  database.disconnect_db
  merchandise_hierarchy.close_vat
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end

When(/^a user update the 'Required' checkbox by setting it to 'Y' by the Merch Hier Default windown$/) do
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.create_merch_hier_defaults(YML_DATA['information3'], '1', '1')
  merchandise_hierarchy.save_and_close_subdpt_actions
  merchandise_hierarchy.select_subdpt(YML_DATA['subdpt'])
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.select_merch_hier_defaults(YML_DATA['information3'], '1')
  merchandise_hierarchy.edit_merch_hier_defaults
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^All Items that are set up with the Sub-Department that has the 'Required' set to 'Y' for an Item Information$/) do
  merchandise_hierarchy.select_subdpt(YML_DATA['subdpt'])
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.select_merch_hier_defaults(YML_DATA['information3'], '1')
  merchandise_hierarchy.verify_merch_hier_defaults(expected_values:'DIMO Case Dimensions')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_merch_hier_table(YML_DATA['subdpt'], YML_DATA['information2'], '1', '1', 'Y')
  database.disconnect_db
  merchandise_hierarchy.close_vat
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end


When(/^a user deletes a Merch Hier Default$/) do
  merchandise_hierarchy.select_subdpt(YML_DATA['subdpt'])
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.create_merch_hier_defaults(YML_DATA['information2'], '1', '1')
  merchandise_hierarchy.save_and_close_subdpt_actions
  merchandise_hierarchy.select_subdpt(YML_DATA['subdpt'])
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.select_merch_hier_defaults(YML_DATA['information'], '1')
  merchandise_hierarchy.delete_merch_hier_defaults
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^record is deleted successfully$/) do
  merchandise_hierarchy.select_subdpt(YML_DATA['subdpt'])
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.select_merch_hier_defaults(YML_DATA['information'], '1')
  merchandise_hierarchy.verify_merch_hier_defaults(expected_values:'No data to display.')
  login_page.logout_to_rms
end

##################################################################3

  Given (/^the purge batch process is complete "([^"]*)"$/) do |batch_name|
    run_rms_batch(TE.environment['db_server'], TE.environment['unix_username'], TE.environment['unix_pwd'], batch_name, TE.environment['db_username'], TE.environment['db_password'])
end