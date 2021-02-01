

Given(/^a user is in Merchandise Hierarchy screen$/) do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  merchandise_hierarchy.open_merchandise_hierarchy
end

############### Division ######################

When(/^they create a new Division where Division ID, Name, Total Market Amounts, Buyer Name and Merchandiser name are mandatory$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_div = database.division_id
  database.disconnect_db
  merchandise_hierarchy.create_new_division(@new_div,YML_DATA['mh_new_div_name'], YML_DATA['mh_buyer'],
                                            YML_DATA['mh_merchandiser'], YML_DATA['mh_total_mkt_amount'])
end

Then(/^the new Division is add on the Division table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_division
  merchandise_hierarchy.select_division(@new_div)
  merchandise_hierarchy.verify_actions(expected_values:'New Division 1003 Ann Woodley 845 Automotive Merchandiser 100.000,00')
end

And(/^the Division will be created RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_mh_division_table(@new_div, YML_DATA['mh_new_div_name'], YML_DATA['mh_buyer_no'], YML_DATA['mh_merchandiser_no'])
  database.disconnect_db
  merchandise_hierarchy.delete_item
  login_page.logout_to_rms
end


When(/^the user edits the fields Name, Total Market Amounts, Buyer Name and Merchandiser name on a Division$/) do
  @new_div = super_merch_hier.existing_division
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_division
  merchandise_hierarchy.select_division(@new_div)
  merchandise_hierarchy.edit_division(YML_DATA['mh_change_div_name'], YML_DATA['mh_buyer_2'],
                                      YML_DATA['merchandiser_2'], YML_DATA['mh_change_mkt_amount'])

end

Then(/^the changes is visible on the Division table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_division
  merchandise_hierarchy.select_division(@new_div)
  merchandise_hierarchy.verify_actions(expected_values: 'Changed Division 620 Billy Sharp 601 Beer, Liquor, Wine Merchandiser 100.000,00')
end

And(/^the division record will be updated in RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_mh_division_table(@new_div, YML_DATA['mh_change_div_name'], YML_DATA['mh_buyer_no_2'], YML_DATA['mh_merchandiser_no_2'])
  database.disconnect_db
  merchandise_hierarchy.delete_item
  login_page.logout_to_rms
end

When(/^they delete a Division$/) do
  @new_div = super_merch_hier.existing_division
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_division
  merchandise_hierarchy.select_division(@new_div)
  merchandise_hierarchy.delete_item

end

Then(/^the Division is removed from RMS$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_division
  merchandise_hierarchy.select_division(@new_div)
  merchandise_hierarchy.verify_actions(expected_values:'No data to display.')
  login_page.logout_to_rms
end

And(/^the Division is removed from RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_division_table(@new_div)
  database.disconnect_db
end

############### Department ######################

When(/^they create a new Department where Department, Name and Division are mandatory$/) do
  merchandise_hierarchy.access_dept
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_dept = database.department_id
  database.disconnect_db
  merchandise_hierarchy.create_new_dept(@new_dept, YML_DATA['mh_new_dept_name'], YML_DATA['mh_buyer'],
                                        YML_DATA['mh_merchandiser'], YML_DATA['mh_division'])

end

Then(/^the new Department is add on the Department table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_dept
  merchandise_hierarchy.select_dept(@new_dept)
  merchandise_hierarchy.verify_actions(expected_values: YML_DATA['mh_new_dept_name'])
end

And(/^The Department will be created RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_department_table(@new_dept, YML_DATA['mh_new_dept_name'],
                                   YML_DATA['mh_buyer_no'], YML_DATA['mh_merchandiser_no'])
  database.disconnect_db
  merchandise_hierarchy.delete_item
  login_page.logout_to_rms
end


When(/^the user edits the fields Name, Division, Buyer Name and Merchandiser Name on a Department where Name is mandatory$/) do
  @new_dept = super_merch_hier.existing_department
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_dept
  merchandise_hierarchy.select_dept(@new_dept)
  merchandise_hierarchy.edit_dept(YML_DATA['mh_change_dept_name'], YML_DATA['mh_buyer_no_2'], YML_DATA['merchandiser_2'])#this popup fields are different from the others.

end

Then(/^the changes is visible on the Department table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_dept
  merchandise_hierarchy.select_dept(@new_dept)
  merchandise_hierarchy.verify_actions(expected_values:YML_DATA['mh_change_dept_name'])

end

And(/^The Department will be updated in RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_department_table(@new_dept, YML_DATA['mh_change_dept_name'], YML_DATA['buyer_no_2'], YML_DATA['merchandiser_no_2'])
  database.disconnect_db
  merchandise_hierarchy.delete_item
  login_page.logout_to_rms
end

When(/^they delete a Department$/) do
  @new_dept = super_merch_hier.existing_department
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_dept
  merchandise_hierarchy.select_dept(@new_dept)
  merchandise_hierarchy.delete_item
end

Then(/^the Department is removed from RMS$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_dept
  merchandise_hierarchy.select_dept(@new_dept)
  merchandise_hierarchy.verify_actions(expected_values:'No data to display.')
  login_page.logout_to_rms
end

And(/^The Department is removed from RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_department_table(@new_dept)
  database.disconnect_db
end

############### Category ######################

When(/^create a new Category where Category ID and Name are mandatory$/) do
  merchandise_hierarchy.access_category(YML_DATA['mh_subdpt'])
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_cat = database.category_id(YML_DATA['mh_subdpt'])
  database.disconnect_db
  merchandise_hierarchy.create_new_category(@new_cat, YML_DATA['mh_new_catg_name'])

end

Then(/^the new Category is add on the Category table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_category(YML_DATA['mh_subdpt'])
  merchandise_hierarchy.select_category(@new_cat)
  merchandise_hierarchy.verify_actions(expected_values:YML_DATA['mh_new_catg_name'])
end

And(/^The Category will be created RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_category_table(@new_cat, YML_DATA['mh_subdpt'], YML_DATA['mh_new_catg_name'])
  merchandise_hierarchy.delete_category
  login_page.logout_to_rms
  database.disconnect_db
end

When(/^the user edits the mandatory fields on a Category$/) do
  @new_cat = super_merch_hier.existing_category
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_category(YML_DATA['mh_subdpt'])
  merchandise_hierarchy.select_category(@new_cat)
  merchandise_hierarchy.edit_category(YML_DATA['mh_change_catg_name'])

end

Then(/^the changes is visible on the Category table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_category(YML_DATA['mh_subdpt'])
  merchandise_hierarchy.select_category(@new_cat)
  merchandise_hierarchy.verify_actions(expected_values:YML_DATA['mh_change_catg_name'])
end

And(/^The Category will be updated in RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_category_table(@new_cat, YML_DATA['mh_subdpt'], YML_DATA['mh_change_catg_name'])
  merchandise_hierarchy.delete_category
  login_page.logout_to_rms
  database.disconnect_db
end

When(/^they delete a Category$/) do
  @new_cat = super_merch_hier.existing_category
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_category(YML_DATA['mh_subdpt'])
  merchandise_hierarchy.select_category(@new_cat)
  merchandise_hierarchy.delete_category
end

Then(/^the Category is removed from RMS$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_category(YML_DATA['mh_subdpt'])
  merchandise_hierarchy.select_category(@new_cat)
end

And(/^the Category is on the Daily Purge table to be remove from RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_dlyprg_table("00#{YML_DATA['mh_subdpt']};000#{@new_cat}")
  database.disconnect_db
  login_page.logout_to_rms
end

############### Sub Category ######################

When(/^create a new Sub Category where Sub Category ID and Name are mandatory$/) do
  merchandise_hierarchy.access_subcategory(YML_DATA['mh_subdpt'], YML_DATA['mh_category'])
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_subcat = database.subcategory_id(YML_DATA['mh_subdpt'], YML_DATA['mh_category'])
  database.disconnect_db
  merchandise_hierarchy.create_new_subcategory(@new_subcat, YML_DATA['mh_new_scatg_name'])

end

Then(/^the new Sub Category is add on the Sub Category table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_subcategory(YML_DATA['mh_subdpt'], YML_DATA['mh_category'])
  merchandise_hierarchy.select_subcategory(@new_subcat)
  merchandise_hierarchy.verify_actions(expected_values:YML_DATA['mh_new_scatg_name'])
end

And(/^The Sub Category will be created RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_subcategory_table(@new_subcat, YML_DATA['mh_subdpt'], YML_DATA['mh_category'], YML_DATA['mh_new_scatg_name'])
  database.disconnect_db
  merchandise_hierarchy.delete_subcategory
  login_page.logout_to_rms
end


When(/^the user edits the mandatory fields on a Sub Category$/) do
  @new_subcat = super_merch_hier.existing_subcategory
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_subcategory(YML_DATA['mh_subdpt'], YML_DATA['mh_category'])
  merchandise_hierarchy.select_subcategory(@new_subcat)
  merchandise_hierarchy.edit_subcategory(YML_DATA['mh_change_scatg_name'])
end

Then(/^the changes is visible on the Sub Category table$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_subcategory(YML_DATA['mh_subdpt'], YML_DATA['mh_category'])
  merchandise_hierarchy.select_subcategory(@new_subcat)
  merchandise_hierarchy.verify_actions(expected_values:YML_DATA['mh_change_scatg_name'])
end

And(/^the Sub Category will be updated in RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_subcategory_table(@new_subcat, YML_DATA['mh_subdpt'], YML_DATA['mh_category'], YML_DATA['mh_change_scatg_name'])
  database.disconnect_db
  merchandise_hierarchy.delete_subcategory
  login_page.logout_to_rms
end


When(/^they delete a Sub Category$/) do
  @new_subcat = super_merch_hier.existing_subcategory
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_subcategory(YML_DATA['mh_subdpt'], YML_DATA['mh_category'])
  merchandise_hierarchy.select_subcategory(@new_subcat)
  merchandise_hierarchy.delete_subcategory
end

Then(/^the Sub Category is removed from RMS$/) do
  merchandise_hierarchy.reopen_merchandise_hierarchy
  merchandise_hierarchy.access_subcategory(YML_DATA['mh_subdpt'], YML_DATA['mh_category'])
  merchandise_hierarchy.select_subcategory(@new_subcat)
  merchandise_hierarchy.verify_delete_batch_message
end

And(/^the Sub Category is on the Daily Purge table to be remove from RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_dlyprg_table("00#{YML_DATA['mh_subdpt']};00#{YML_DATA['mh_category']};000#{@new_subcat}")
  database.disconnect_db
  login_page.logout_to_rms
end

############### Sub-Department ######################

When(/^Create a new Sub-Department by enter the mandatory fields$/) do
  merchandise_hierarchy.access_subdpt
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_subdept = database.subdpt_id
  database.disconnect_db
  merchandise_hierarchy.create_new_subdpt(@new_subdept,'New Sub-Department', YML_DATA['mh_dept'], YML_DATA['mh_buyer'], YML_DATA['mh_merchandiser'],
                                          '10', '10', '1', '1', YML_DATA['profit_calc_type'], YML_DATA['otb_calc_type'], YML_DATA['purchase_type'], '10000' )
  merchandise_hierarchy.access_new_vat
  merchandise_hierarchy.create_multiple_vat
  merchandise_hierarchy.save_and_close_subdpt_actions

end

Then(/^the new Sub-Department is add on the Sub-Department table$/) do
  merchandise_hierarchy.access_subdpt
  merchandise_hierarchy.select_subdpt(@new_subdept)
  merchandise_hierarchy.verify_actions(expected_values:'New Sub-Department')
end

And(/^The Sub-Department will be created RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_subsubdept_table(@new_subdept, 'New Sub-Department', YML_DATA['mh_buyer_no'], YML_DATA['mh_merchandiser_no'], '1',	'0',	'33',
                                   '9.0909', '10', '10000000', 'R', 'C', '1 ','1')
  database.disconnect_db
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end

When(/^the user edits the mandatory fields on a Sub-Department$/) do
  merchandise_hierarchy.access_subdpt
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_subdept = database.subdpt_id
  database.disconnect_db
  merchandise_hierarchy.create_new_subdpt(@new_subdept,'New Sub-Department', YML_DATA['mh_dept'], YML_DATA['mh_buyer'], YML_DATA['mh_merchandiser'],
                                          '10', '10', '1', '1', YML_DATA['profit_calc_type'], YML_DATA['otb_calc_type'], YML_DATA['purchase_type'], '10000' )
  merchandise_hierarchy.access_new_vat
  merchandise_hierarchy.create_multiple_vat
  merchandise_hierarchy.save_and_close_subdpt_actions
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(@new_subdept)
  merchandise_hierarchy.edit_subdpt('Change Sub-Department', YML_DATA['mh_dept'], YML_DATA['mh_buyer_no_2'], YML_DATA['merchandiser_2'],
  '20', '20', '2', '2', YML_DATA['profit_calc_type_2'], YML_DATA['otb_calc_type_2'], YML_DATA['purchase_type_2'], '20000')
end

Then(/^the changes is visible on the Sub-Department table$/) do
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(@new_subdept)
  merchandise_hierarchy.verify_actions(expected_values:'Change Sub-Department')
end

And(/^The Sub-Department will be updated in RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_edit_subsubdept_table(@new_subdept, 'Change Sub-Department')
  database.disconnect_db
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end

When(/^they delete a Sub-Department$/) do
  merchandise_hierarchy.access_subdpt
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_subdept = database.subdpt_id
  database.disconnect_db
  merchandise_hierarchy.create_new_subdpt(@new_subdept, YML_DATA['mh_new_subdept_name'], YML_DATA['mh_dept'], YML_DATA['mh_buyer'],
                                          YML_DATA['mh_merchandiser'], YML_DATA['mh_merchandiser'], YML_DATA['markup_perct_cost'],
                                          '10', '10', '1', '1', YML_DATA['profit_calc_type'], YML_DATA['otb_calc_type'],
                                          YML_DATA['purchase_type'], '10000' )
  merchandise_hierarchy.access_new_vat
  merchandise_hierarchy.create_multiple_vat
  merchandise_hierarchy.save_and_close_subdpt_actions
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(@new_subdept)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.delete_subdpt

end

Then(/^the Sub-Department is removed from RMS$/) do
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(@new_subdept)
  merchandise_hierarchy.subdpt_confirm_delete
end

And(/^the Sub-Department is removed from RMS DB$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_dlyprg_table("#{@new_subdept}")
  database.disconnect_db
  login_page.logout_to_rms
end


############### VAT ######################

Given(/^a user create a Sub-Department$/) do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  merchandise_hierarchy.open_merchandise_hierarchy
  merchandise_hierarchy.access_subdpt
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_subdept = database.subdpt_id
  database.disconnect_db
  merchandise_hierarchy.create_new_subdpt(@new_subdept,'New Sub-Department', YML_DATA['mh_dept'], YML_DATA['mh_buyer'], YML_DATA['mh_merchandiser'],
                                          '10', '10', '1', '1', YML_DATA['profit_calc_type'], YML_DATA['otb_calc_type'], YML_DATA['purchase_type'], '10000' )
end

When(/^user adds VAT region$/) do
  merchandise_hierarchy.access_new_vat
  merchandise_hierarchy.create_multiple_vat
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^VAT regions and VAT codes that are entered at the Sub-Department level become default for items within the Sub-Department$/) do
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(@new_subdept)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_vat
  merchandise_hierarchy.select_vat(YML_DATA['VR1'], YML_DATA['v_code_1'], YML_DATA['DB_R'])
  merchandise_hierarchy.verify_vat(expected_values:'Vat Region 1000')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_vat_table(@new_subdept, YML_DATA['VR1'], YML_DATA['v_code_1'], YML_DATA['DB_R'])
  database.disconnect_db
  merchandise_hierarchy.close_vat
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end

Given(/^a user access a Sub-Department$/) do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  merchandise_hierarchy.open_merchandise_hierarchy
  @new_subdept = super_merch_hier.access_sub_department
end

When(/^user updates VAT Details$/) do
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(@new_subdept)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_vat
  merchandise_hierarchy.select_vat(YML_DATA['VR1'], YML_DATA['v_code_1'], YML_DATA['DB_C'])
  merchandise_hierarchy.edit_vat(YML_DATA['v_code_4'])
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^The Vat Details are update for the Sub-department and RMS DB$/) do
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(@new_subdept)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_vat
  merchandise_hierarchy.select_vat(YML_DATA['VR1'], YML_DATA['v_code_4'], YML_DATA['DB_C'])
  merchandise_hierarchy.verify_vat(expected_values: YML_DATA['VR1'])
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_vat_table(@new_subdept, YML_DATA['VR1'], YML_DATA['v_code_4'], YML_DATA['DB_C'])
  database.disconnect_db
  merchandise_hierarchy.close_vat
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end

When(/^user deletes VAT region$/) do
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(@new_subdept)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_vat
  merchandise_hierarchy.select_vat(YML_DATA['VR1'], YML_DATA['v_code_1'], YML_DATA['DB_C'])
  merchandise_hierarchy.delete_vat
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^VAT regions and VAT codes are delete at the Sub-Department level$/) do
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(@new_subdept)
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_vat
  merchandise_hierarchy.select_vat(YML_DATA['VR1'], YML_DATA['v_code_1'], YML_DATA['DB_C'])
  merchandise_hierarchy.verify_vat(expected_values:'No data to display.')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_vat_table(@new_subdept, YML_DATA['VR1'], YML_DATA['v_code_1'], YML_DATA['DB_C'])
  database.disconnect_db
  merchandise_hierarchy.close_vat
  merchandise_hierarchy.delete_subdpt
  login_page.logout_to_rms
end

############### Merch Hier Defaults ######################

Given(/^a user access a existent Sub-Department$/) do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  merchandise_hierarchy.open_merchandise_hierarchy
  merchandise_hierarchy.access_subdpt
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(YML_DATA['mh_subdpt'])
  merchandise_hierarchy.access_select_subdpt
end

When(/^a user adds Default with Information, Category and Sub Category by the Merchandise Hierarchy Default window$/) do
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.create_merch_hier_defaults(YML_DATA['information2'], '1', '2')
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^the default information for the Sub-Department is created in RMS RMS database only for the Categories and Subcategories within that Sub-Department$/) do
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(YML_DATA['mh_subdpt'])
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.select_merch_hier_defaults(YML_DATA['information2'])
  merchandise_hierarchy.verify_merch_hier_defaults(expected_values:'DIFF Diffs')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_merch_hier_table(YML_DATA['mh_subdpt'], YML_DATA['information2'], '1', '2', 'N')
  database.disconnect_db
  merchandise_hierarchy.delete_merch_hier_defaults
  merchandise_hierarchy.save_and_close_subdpt_actions
  login_page.logout_to_rms
end

When(/^a user update the 'Required' checkbox by setting it to 'Y' by the Merch Hier Default window$/) do
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.create_merch_hier_defaults(YML_DATA['information4'], '1', '2')
  merchandise_hierarchy.save_and_close_subdpt_actions
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(YML_DATA['mh_subdpt'])
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.select_merch_hier_defaults(YML_DATA['information4'])
  merchandise_hierarchy.edit_merch_hier_defaults
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^All Items that are set up with the Sub-Department that has the 'Required' set to 'Y' for an Item Information$/) do
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(YML_DATA['mh_subdpt'])
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.select_merch_hier_defaults(YML_DATA['information4'])
  merchandise_hierarchy.verify_merch_hier_defaults(expected_values:'DIMO Case Dimensions')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_merch_hier_table(YML_DATA['mh_subdpt'], YML_DATA['information4'], '1', '2', 'Y')
  database.disconnect_db
  merchandise_hierarchy.delete_merch_hier_defaults
  merchandise_hierarchy.save_and_close_subdpt_actions
  login_page.logout_to_rms
end


When(/^a user deletes a Merch Hier Default$/) do
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.create_merch_hier_defaults(YML_DATA['information3'], '1', '2')
  merchandise_hierarchy.save_and_close_subdpt_actions
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(YML_DATA['mh_subdpt'])
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.select_merch_hier_defaults(YML_DATA['information3'])
  merchandise_hierarchy.delete_merch_hier_defaults
  merchandise_hierarchy.save_and_close_subdpt_actions
end


Then(/^record is deleted successfully$/) do
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(YML_DATA['mh_subdpt'])
  merchandise_hierarchy.access_select_subdpt
  merchandise_hierarchy.access_merch_hier_defaults
  merchandise_hierarchy.select_merch_hier_defaults(YML_DATA['information3'])
  merchandise_hierarchy.verify_merch_hier_defaults(expected_values:'No data to display.')
  login_page.logout_to_rms
end

When(/^a user access Up Charges page$/) do
  shared.more_actions_select('Up Charges')

end


Then(/^the user is able to add the upcharges to the new location$/) do
  shared.clear_filters
  merchandise_hierarchy.select_subdpt(YML_DATA['mh_subdpt'])
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