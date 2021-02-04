Given(/^the Assistant Buyer on 'Item & Ordering Worklist' page$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_ba_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
end

When(/^the assistant Buyer manually adds an Add New Item to the Buyers Worklist$/) do
  bws_item_menu.add_item_select_options("add_new_item")
end

Then(/^the assistant Buyer is able add specific details$/) do
  bws_item.adds_item_bws(YML_DATA['BWS']['add_item']['Sub_Department'],
                         YML_DATA['BWS']['add_item']['Category'],
                         YML_DATA['BWS']['add_item']['Sub_Category'],
                         YML_DATA['BWS']['add_item']['Main_Desc'],
                         YML_DATA['BWS']['add_item']['Marketing_Desc'],
                         YML_DATA['BWS']['add_item']['Differentiator_1'],
                         YML_DATA['BWS']['add_item']['Differentiator_2'],
                         YML_DATA['BWS']['add_item']['Supplier_Site'],
                         YML_DATA['BWS']['add_item']['Country_of_Sourcing'],
                         YML_DATA['BWS']['add_item']['Country_of_Manufacture'],
                         YML_DATA['BWS']['add_item']['Port_Of_Lading'],
                         YML_DATA['BWS']['add_item']['Cost_Zone_Group_ID'],
                         YML_DATA['BWS']['add_item']['Cost'],
                         YML_DATA['BWS']['add_item']['Supplier_Pack_Size'],
                         YML_DATA['BWS']['add_item']['Inner_Pack_Size'],
                         YML_DATA['BWS']['add_item']['Case_Pack_Qty'],
                         YML_DATA['BWS']['add_item']['Packing_Method'])
  #ADF Verification
  bws_item.check_adf_error
  bws_item.to_be_complete_steps

  bws_item.delete_created
  login_page.log_out_from_bws
end

#Comun Step
Given(/^an Assistant Buyer on Item tab$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_ba_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
end

When(/^an assistant buyer enters the Sub-Department$/) do

end

Then(/^the values listed for the Category are specific for the selected sub-department$/) do
  bws_database.connect_to_bws_db('db_hostname', 'db_port', 'db_servicename', 'db_bws_username', 'db_password')

  bws_item_menu.add_item_select_options("add_new_item")

  #extract values from LOV
  @category_values = bws_item.get_category_list(YML_DATA['input_Sub_Department'])

  #data-base verification
  bws_database.verify_subdept_category(YML_DATA['input_Sub_Department'].split.first.to_i, @category_values)

  #after verification
  bws_item.after_lov_verification

  #independent
  bws_item.delete_created
  login_page.log_out_from_bws
end

#

When(/^an assistant buyer enters a the Category$/) do
  #extract values from LOV
  @sub_categories = bws_item.get_sub_category_list(YML_DATA['input_Sub_Department'], YML_DATA['input_Category'])
end

Then(/^the values listed for the sub-category are specific to the selected sub-department and category$/) do
  bws_database.connect_to_bws_db('db_hostname', 'db_port', 'db_servicename', 'db_bws_username', 'db_password')

  #data-base verification
  bws_database.verify_sub_category(YML_DATA['input_Category'].split.first.to_i, @sub_categories)

  #after verification
  bws_item.after_lov_verification

  #independent
  bws_item.delete_created
  login_page.log_out_from_bws

end

#Check Characters limit
When(/^the assistant buyer enters the Description for the Item$/) do
  @item_tab_element = YML_DATA['item_element_main_desc']
  bws_item.character_limit_insert(YML_DATA['item_element_main_desc'], '31',
                                  YML_DATA['input_Sub_Department'], YML_DATA['input_Category'], YML_DATA['input_Sub_Category'])

end

When(/^the assistant buyer enters the Marketing Description for the Item$/) do
  @item_tab_element = YML_DATA['item_element_markting_desc']
  bws_item.character_limit_insert(YML_DATA['item_element_markting_desc'], '121',
                                  YML_DATA['input_Sub_Department'], YML_DATA['input_Category'], YML_DATA['input_Sub_Category'])
end

When(/^the assistant buyer enters the Detailed Description for the Item$/) do
  @item_tab_element = YML_DATA['item_element_detail_desc']
  bws_item.character_limit_insert(YML_DATA['item_element_detail_desc'], '251',
                                  YML_DATA['input_Sub_Department'], YML_DATA['input_Category'], YML_DATA['input_Sub_Category'])
end

When(/an assistant buyer enters the Supplier Style No$/) do
  @item_tab_element = YML_DATA['item_element_supp_stile_no']
  bws_item.character_limit_insert(YML_DATA['item_element_supp_stile_no'], '31',
                                  YML_DATA['input_Sub_Department'], YML_DATA['input_Category'], YML_DATA['input_Sub_Category'])
end

Then(/^the assistant buyer is able to enter the supplier colour$/) do
  @item_tab_element = YML_DATA['item_element_supp_colour']
  bws_item.character_limit_insert(YML_DATA['item_element_supp_colour'], '121')
end

When(/^an assistant buyer enters the special instructions$/) do
  @item_tab_element = YML_DATA['item_element_special_instc']
  bws_item.character_limit_insert(YML_DATA['item_element_special_instc'], '2001',
                                  YML_DATA['input_Sub_Department'], YML_DATA['input_Category'], YML_DATA['input_Sub_Category'])
end

Then(/^the field is limited to '([^"]*)' Characters$/) do |_arg|
  bws_item.character_limit_cont(@item_tab_element, _arg)
  bws_item.item_id
  bws_item.delete_created
  login_page.log_out_from_bws
end

#

When(/^the assistant buyer enters the Colour ID$/) do

end

Then(/^the colour Diff is created$/) do
  bws_item.add_diff(YML_DATA['Diffs_Sub_Department'],
                    YML_DATA['Diffs_Category'],
                    YML_DATA['Diffs_Sub_Category'],
                    YML_DATA['Diffs_Main_Desc'],
                    YML_DATA['Diffs_Marketing_Desc'],
                    YML_DATA['Diffs_Differentiator_1'],
                    YML_DATA['Diffs_Differentiator_2'],
                    YML_DATA['Diffs_Supplier_Site'],
                    YML_DATA['Diffs_Country_of_Sourcing'],
                    YML_DATA['Diffs_Country_of_Manufacture'],
                    YML_DATA['Diffs_Port_Of_Lading'],
                    YML_DATA['Diffs_Cost_Zone_Group_ID'],
                    YML_DATA['Diffs_Cost'],
                    YML_DATA['Diffs_Inner_Pack_Size'],
                    YML_DATA['Diffs_Case_Pack_Qty'],
                    YML_DATA['Diffs_Packing_Method'],
                    YML_DATA['Diffs_initial_selling_retail'],
                    YML_DATA['Diffs_Selection_Solid'])


  bws_item.to_be_complete_steps

  bws_item.delete_created
  login_page.log_out_from_bws
end

#

When(/^the assistant buyer enters the Size ID$/) do

end

Then(/^the Size Diffs are created$/) do
  bws_item.add_diff(YML_DATA['Diffs_Sub_Department'],
                    YML_DATA['Diffs_Category'],
                    YML_DATA['Diffs_Sub_Category'],
                    YML_DATA['Diffs_Main_Desc'],
                    YML_DATA['Diffs_Marketing_Desc'],
                    YML_DATA['Diffs_Differentiator_1'],
                    YML_DATA['Diffs_Differentiator_2'],
                    YML_DATA['Diffs_Supplier_Site'],
                    YML_DATA['Diffs_Country_of_Sourcing'],
                    YML_DATA['Diffs_Country_of_Manufacture'],
                    YML_DATA['Diffs_Port_Of_Lading'],
                    YML_DATA['Diffs_Cost_Zone_Group_ID'],
                    YML_DATA['Diffs_Cost'],
                    YML_DATA['Diffs_Inner_Pack_Size'],
                    YML_DATA['Diffs_Case_Pack_Qty'],
                    YML_DATA['Diffs_Packing_Method'],
                    YML_DATA['Diffs_initial_selling_retail'],
                    YML_DATA['Diffs_Selection_Fashion'])


  bws_item.to_be_complete_steps

  bws_item.delete_created
  login_page.log_out_from_bws
end

#

When(/^the assistant buyer enters the colour differentiator on Supplier Diff 1 field$/) do
  bws_item.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'])
end


Then(/^a message must appear prompting user to remove the additional swing tags$/) do
  bws_item.add_swing_tag
  login_page.log_out_from_bws
  login_page.verify_logout
end


And(/^Only available if colour is defined using Differentiator Colour otherwise it is disabled$/) do
  bws_item.delete_created
  login_page.log_out_from_bws
end


When(/^the assistant buyer selects the Swing Tag button$/) do

end

Then(/^the user is able to add new swing tab$/) do
  bws_item.add_swing_tag YML_DATA['swing_tag_01']
  bws_item.delete_created
  login_page.log_out_from_bws
end

Given(/^an assistant buyer enters the details for the Swing Tag$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_ba_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
end

When(/^the assistant buyer attempts to create more than 3 swing tags by the Add button$/) do

end

Then(/^the Add button will not be displayed$/) do
  bws_item_menu.add_item_select_options("add_new_item")
  @swing_tags = [YML_DATA['swing_tag_01'], YML_DATA['swing_tag_02'], YML_DATA['swing_tag_03']]
  bws_item.verify_swing_tag_add_button_disappears(@swing_tags)
  bws_item.delete_created
  login_page.log_out_from_bws
end

#

Given(/^an admin updates System Options 'Swing Tag' column to "([^"]*)"$/) do |val|
  #Admin setup the value of coloumn with 5
  bws_database.connect_to_bws_db('db_hostname', 'db_port', 'db_servicename', 'db_bws_username', 'db_password')
  bws_database.set_swing_tag_column val

  #BWS
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_ba_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
end

When(/^the user accesses the swing tag placeholder in Item tab$/) do

end

Then(/^the number of tags allowed in the placeholder does not exceed the value set at the System Options$/) do
  @swing_tags = [YML_DATA['swing_tag_01'], YML_DATA['swing_tag_02']]
  bws_item.verify_swing_tag_add_button_disappears(@swing_tags)
  bws_item.delete_created
  login_page.log_out_from_bws

  # Reset The value to default
  bws_database.reset_swing_tag_column

  #Disconnect - DB
  bws_database.disconnect_db
end

#

When(/^an assistant buyer enters the Supplier Site for the Style$/) do

end

Then(/^the field must display the supplier site ID and name$/) do

  #database
  bws_database.connect_to_bws_db('db_hostname', 'db_port', 'db_servicename', 'db_bws_username', 'db_password')

  #bws verification
  bws_item.verify_supplier_site(YML_DATA['BWS']['add_item']['Sub_Department'],
                                YML_DATA['BWS']['add_item']['Category'],
                                YML_DATA['BWS']['add_item']['Sub_Category'],
                                YML_DATA['BWS']['add_item']['Main_Desc'],
                                YML_DATA['BWS']['add_item']['Marketing_Desc'],
                                YML_DATA['BWS']['add_item']['Differentiator_1'],
                                YML_DATA['BWS']['add_item']['Differentiator_2'],
                                YML_DATA['supplier_site'],
                                YML_DATA['predictive_supplier_site_text'])
  #data-base verification
  bws_database.verify_supplier_table(YML_DATA['bws_supplier_id'])

  #independent
  bws_item.delete_created
  login_page.log_out_from_bws

  #Disconnect - DB
  bws_database.disconnect_db
end

#

When(/^an assistant buyer enters the Country of Sourcing$/) do

end

Then(/^the field must display the ID-Country and Description$/) do
  #database
  bws_database.connect_to_bws_db('db_hostname', 'db_port', 'db_servicename', 'db_bws_username', 'db_password')

  #bws verification
  bws_item.verify_source_country(YML_DATA['BWS']['add_item']['Sub_Department'],
                                 YML_DATA['BWS']['add_item']['Category'],
                                 YML_DATA['BWS']['add_item']['Sub_Category'],
                                 YML_DATA['BWS']['add_item']['Main_Desc'],
                                 YML_DATA['BWS']['add_item']['Marketing_Desc'],
                                 YML_DATA['BWS']['add_item']['Differentiator_1'],
                                 YML_DATA['BWS']['add_item']['Differentiator_2'],
                                 YML_DATA['BWS']['add_item']['Supplier_Site'],
                                 YML_DATA['country_of_sourcing'],
                                 YML_DATA['predictive_country_of_sourcing_text'])

  #data-base verification
  bws_database.verify_country_table(YML_DATA['bws_country_of_sourcing_id'])

  #independent
  bws_item.delete_created
  login_page.log_out_from_bws

  #Disconnect - DB
  bws_database.disconnect_db
end

#

When(/^an assistant buyer enters the Country of Manufacture$/) do

end

Then(/^the field must display the ID-Country Description$/) do
  #database
  bws_database.connect_to_bws_db('db_hostname', 'db_port', 'db_servicename', 'db_bws_username', 'db_password')

  #bws verification
  bws_item.verify_country_of_manufacture(YML_DATA['BWS']['add_item']['Sub_Department'],
                                         YML_DATA['BWS']['add_item']['Category'],
                                         YML_DATA['BWS']['add_item']['Sub_Category'],
                                         YML_DATA['BWS']['add_item']['Main_Desc'],
                                         YML_DATA['BWS']['add_item']['Marketing_Desc'],
                                         YML_DATA['BWS']['add_item']['Differentiator_1'],
                                         YML_DATA['BWS']['add_item']['Differentiator_2'],
                                         YML_DATA['BWS']['add_item']['Supplier_Site'],
                                         YML_DATA['BWS']['add_item']['Country_of_Sourcing'],
                                         YML_DATA['country_of_manufracture'],
                                         YML_DATA['predictive_country_of_manufracture'])

  #data-base verification
  bws_database.verify_country_table(YML_DATA['bws_country_of_Manufacture_id'])

  #independent
  bws_item.delete_created
  login_page.log_out_from_bws

  #Disconnect - DB
  bws_database.disconnect_db
end

#

When(/^an assistant buyer opts to enter the Port of Lading$/) do

end

Then(/^the assistant buyer is able view the ID and Port Description in the field$/) do
  #database
  bws_database.connect_to_bws_db('db_hostname', 'db_port', 'db_servicename', 'db_bws_username', 'db_password')

  #bws verification
  bws_item.verify_port_of_landing(YML_DATA['BWS']['add_item']['Sub_Department'],
                                  YML_DATA['BWS']['add_item']['Category'],
                                  YML_DATA['BWS']['add_item']['Sub_Category'],
                                  YML_DATA['BWS']['add_item']['Main_Desc'],
                                  YML_DATA['BWS']['add_item']['Marketing_Desc'],
                                  YML_DATA['BWS']['add_item']['Differentiator_1'],
                                  YML_DATA['BWS']['add_item']['Differentiator_2'],
                                  YML_DATA['BWS']['add_item']['Supplier_Site'],
                                  YML_DATA['pol_country_of_sourcing'],
                                  YML_DATA['pol_country_of_manufracture'],
                                  YML_DATA['port_of_lading'],
                                  YML_DATA['predictive_port_of_lading'])

  #data-base verification
  bws_database.verify_port_of_lading_table(YML_DATA['lading_port_id'])

  #independent
  bws_item.delete_created
  login_page.log_out_from_bws

  #Disconnect - DB
  bws_database.disconnect_db
end

#

When(/^the assistant buyer enters the Cost Zone Group ID$/) do

end

Then(/^the Cost Zone Groups are displayed$/) do
  #database
  bws_database.connect_to_bws_db('db_hostname', 'db_port', 'db_servicename', 'db_bws_username', 'db_password')

  #bws verification
  bws_item.verify_cost_zone_group_id(YML_DATA['BWS']['add_item']['Sub_Department'],
                                     YML_DATA['BWS']['add_item']['Category'],
                                     YML_DATA['BWS']['add_item']['Sub_Category'],
                                     YML_DATA['BWS']['add_item']['Main_Desc'],
                                     YML_DATA['BWS']['add_item']['Marketing_Desc'],
                                     YML_DATA['BWS']['add_item']['Differentiator_1'],
                                     YML_DATA['BWS']['add_item']['Differentiator_2'],
                                     YML_DATA['BWS']['add_item']['Supplier_Site'],
                                     YML_DATA['pol_country_of_sourcing'],
                                     YML_DATA['pol_country_of_manufracture'],
                                     YML_DATA['pol'],
                                     YML_DATA['Cost_Zone_Group_ID'])

  #data-base verification
  bws_database.verify_cost_zone_group_table(YML_DATA['Cost_Zone_Group_ID'])

  #independent
  bws_item.delete_created
  login_page.log_out_from_bws

  #Disconnect - DB
  bws_database.disconnect_db
end

#

When(/^the user enters the Base Cost$/) do

end

Then(/^the Base Cost value will default to Supplier Currency$/) do
  #database
  bws_database.connect_to_bws_db('db_hostname', 'db_port', 'db_servicename', 'db_bws_username', 'db_password')

  #bws verification
  bws_item.verify_base_cost(YML_DATA['BWS']['add_item']['Sub_Department'],
                            YML_DATA['BWS']['add_item']['Category'],
                            YML_DATA['BWS']['add_item']['Sub_Category'],
                            YML_DATA['BWS']['add_item']['Main_Desc'],
                            YML_DATA['BWS']['add_item']['Marketing_Desc'],
                            YML_DATA['BWS']['add_item']['Differentiator_1'],
                            YML_DATA['BWS']['add_item']['Differentiator_2'],
                            YML_DATA['BWS']['add_item']['Supplier_Site'],
                            YML_DATA['pol_country_of_sourcing'],
                            YML_DATA['pol_country_of_manufracture'],
                            YML_DATA['pol'],
                            YML_DATA['BWS']['add_item']['Cost_Zone_Group_ID'],
                            YML_DATA['base_cost'],
                            YML_DATA['non_numeric_val'])

  #To Check Any ADF Error
  bws_item.check_adf_error

  #Extract the Supplier Currency from the UI
  @currency = bws_item.extract_supplier_currency

  # To be Completed Steps#
  bws_item.to_be_complete_steps

  #db verification for supplier along with the currency
  bws_database.verify_base_cost_default_to_supplier_currency(YML_DATA['BWS']['add_item']['Supplier_Site'].split("-").first, @currency)


  #independent
  bws_item.delete_created
  login_page.log_out_from_bws

end

#

Given(/^an assistant buyer accesses the Base Cost displayed in Supplier Currency$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_ba_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")

end

Then(/^the field alongside the Base Cost will display the Base Cost converted to the System Currency which is ZAR$/) do
  #database
  bws_database.connect_to_bws_db('db_hostname', 'db_port', 'db_servicename', 'db_bws_username', 'db_password')

  #bws verification
  bws_item.verify_converted_system_currency(YML_DATA['BWS']['add_item']['Sub_Department'],
                                            YML_DATA['BWS']['add_item']['Category'],
                                            YML_DATA['BWS']['add_item']['Sub_Category'],
                                            YML_DATA['BWS']['add_item']['Main_Desc'],
                                            YML_DATA['BWS']['add_item']['Marketing_Desc'],
                                            YML_DATA['BWS']['add_item']['Differentiator_1'],
                                            YML_DATA['BWS']['add_item']['Differentiator_2'],
                                            YML_DATA['BWS']['add_item']['Supplier_Site'],
                                            YML_DATA['pol_country_of_sourcing'],
                                            YML_DATA['pol_country_of_manufracture'],
                                            YML_DATA['pol'],
                                            YML_DATA['BWS']['add_item']['Cost_Zone_Group_ID'],
                                            YML_DATA['base_cost'],
                                            YML_DATA['amendable_base_cost'],
                                            YML_DATA['non_numeric_val'])

  #To Check Any ADF Error
  bws_item.check_adf_error

  # Base Cost is always defaulted to Supplier’s currency
  @supplier_currency = bws_item.supplier_currency

  # To be Completed Steps#
  bws_item.to_be_complete_steps

  #Data base verification - 04
  bws_database.verify_base_cost_default_to_supplier_currency(YML_DATA['BWS']['add_item']['Supplier_Site'].split("-").first, @supplier_currency)

  #independent
  bws_item.delete_created

  #Logout
  login_page.log_out_from_bws

  #Disconnect - DB
  bws_database.disconnect_db

end

And(/^the converted System Currency field is not editable$/) do

end

#

When(/^the user enters the Cost to Expenses to access "Enter Expenses"$/) do

end


And(/^adds the Expense Type and the Component for each Expense Type for the Style$/) do

end

Then(/^Then the Expense Type and Component details calculates the expenses which is published in the Expenses field$/) do

end

#

When(/^an Assistant Buyer opts to add HTS Cod$/) do

end


Then(/^the user is only able to add a code from a list of HTS codes$/) do

end

#

Then(/^the Unit ELC is calculated and the value is displayed and is non-editable$/) do

end

#

When(/^the assistant buyer enters the Initial Selling Price -ISP- with currency defaulted to ZAR$/) do

end


Then(/^this will be used to automatically assign the Selling Retail for the South Africa Price Zone in the Price by Zone Tab and calculated the foreign prices$/) do

end

Given(/^the assistant buyer accesses the PMO field$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_ba_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
end

When(/^the assistant buyer enter the Cost and Initial Retail Value$/) do

end

Then(/^the PMO is calculated, correct value is displayed and is non-editable$/) do
  #database
  bws_database.connect_to_bws_db('db_hostname', 'db_port', 'db_servicename', 'db_bws_username', 'db_password')
  #Vat To Perform PMO Calculation
  @vat = bws_database.extract_vat_of_sub_dept(YML_DATA['PMO_Sub_Department'].split("-").first)

  bws_item.verify_pmo(YML_DATA['PMO_Sub_Department'],
                      YML_DATA['PMO_Category'],
                      YML_DATA['PMO_Sub_Category'],
                      YML_DATA['PMO_Main_Desc'],
                      YML_DATA['PMO_Marketing_Desc'],
                      YML_DATA['PMO_Differentiator_1'],
                      YML_DATA['PMO_Differentiator_2'],
                      YML_DATA['PMO_Supplier_Site'],
                      YML_DATA['PMO_Country_of_Sourcing'],
                      YML_DATA['PMO_Country_of_Manufacture'],
                      YML_DATA['PMO_Port_Of_Lading'],
                      YML_DATA['PMO_Cost_Zone_Group_ID'],
                      YML_DATA['PMO_Cost'],
                      YML_DATA['PMO_Supplier_Pack_Size'],
                      YML_DATA['PMO_Inner_Pack_Size'],
                      YML_DATA['PMO_Case_Pack_Qty'],
                      YML_DATA['PMO_Packing_Method'],
                      YML_DATA['PMO_initial_selling_retail'], @vat)


  #ADF Verification
  bws_item.check_adf_error

  #independent
  bws_item.delete_created
end

#
#
# Given(/^an Assistant Buyer on Item tab$/) do
#   visit(TE.environment['bws_url'])
#   login_page.login_to_bws(TE.environment['bws_ba_user'], TE.environment['bws_ba_pw'])
#   bws_shared.select_task YML_DATA['BWS']['bws_group']
# end


Given(/^an assistant buyer create a new Item$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_ba_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
end

When(/^the assistant buyer navigates to the 'UDA' sub\-tab contained within  the "([^"]*)"Buy Details"([^"]*)" section of the screen and selects 'Add'$/) do |arg1, arg2|

end

Then(/^a blank UDA screen opens and the assistant buyer is able to enter the following UDA details, UDA, UDA Value, Mandatory, Apply To$/) do
  bws_item.adds_item_bws(YML_DATA['BWS']['add_item']['Sub_Department'],
                         YML_DATA['BWS']['add_item']['Category'],
                         YML_DATA['BWS']['add_item']['Sub_Category'],
                         YML_DATA['BWS']['add_item']['Main_Desc'],
                         YML_DATA['BWS']['add_item']['Marketing_Desc'],
                         YML_DATA['BWS']['add_item']['Differentiator_1'],
                         YML_DATA['BWS']['add_item']['Differentiator_2'],
                         YML_DATA['BWS']['add_item']['Supplier_Site'],
                         YML_DATA['BWS']['add_item']['Country_of_Sourcing'],
                         YML_DATA['BWS']['add_item']['Country_of_Manufacture'],
                         YML_DATA['BWS']['add_item']['Port_Of_Lading'],
                         YML_DATA['BWS']['add_item']['Cost_Zone_Group_ID'],
                         YML_DATA['BWS']['add_item']['Cost'],
                         YML_DATA['BWS']['add_item']['Supplier_Pack_Size'],
                         YML_DATA['BWS']['add_item']['Inner_Pack_Size'],
                         YML_DATA['BWS']['add_item']['Case_Pack_Qty'],
                         YML_DATA['BWS']['add_item']['Packing_Method'])

  #uda#
  bws_item.go_to(YML_DATA['uda'])
  bws_item.add_udas(YML_DATA['uda_id_1'], YML_DATA['uda_id_2'], YML_DATA['uda_val_1'], YML_DATA['uda_val_2'])

  bws_item.to_be_complete_steps
  bws_item.delete_created
  login_page.log_out_from_bws
end


Given(/^an Assistant Buyer on UDA tab$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_ba_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")


end

When(/^an assistant buyer selects one or more UDAs$/) do

end

Then(/^an assistant buyer is able to remove the UDA$/) do
  #Independent Create ITEM
  bws_item.adds_item_bws(YML_DATA['BWS']['add_item']['Sub_Department'],
                         YML_DATA['BWS']['add_item']['Category'],
                         YML_DATA['BWS']['add_item']['Sub_Category'],
                         YML_DATA['BWS']['add_item']['Main_Desc'],
                         YML_DATA['BWS']['add_item']['Marketing_Desc'],
                         YML_DATA['BWS']['add_item']['Differentiator_1'],
                         YML_DATA['BWS']['add_item']['Differentiator_2'],
                         YML_DATA['BWS']['add_item']['Supplier_Site'],
                         YML_DATA['BWS']['add_item']['Country_of_Sourcing'],
                         YML_DATA['BWS']['add_item']['Country_of_Manufacture'],
                         YML_DATA['BWS']['add_item']['Port_Of_Lading'],
                         YML_DATA['BWS']['add_item']['Cost_Zone_Group_ID'],
                         YML_DATA['BWS']['add_item']['Cost'],
                         YML_DATA['BWS']['add_item']['Supplier_Pack_Size'],
                         YML_DATA['BWS']['add_item']['Inner_Pack_Size'],
                         YML_DATA['BWS']['add_item']['Case_Pack_Qty'],
                         YML_DATA['BWS']['add_item']['Packing_Method'])
  ##Independent Create UDAs
  bws_item.add_udas(YML_DATA['uda_id_1'], YML_DATA['uda_id_2'], YML_DATA['uda_val_1'], YML_DATA['uda_val_2'])
  bws_item.to_be_complete_steps

  ## Edit Item
  bws_item.edit_created

  # Delete UDA
  bws_item.delete_udas(YML_DATA['uda_id_1'])

  # Independent Methods
  bws_item.to_be_complete_steps
  bws_item.delete_created
  login_page.log_out_from_bws

end


Given(/^a user opts to add packing method$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_ba_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
end

When(/^the user clicks on the Packing Method field$/) do

end

Then(/^the possible options are "([^"]*)" and "([^"]*)"$/) do |opt_1, opt_2|
  @possible_options = [opt_1, opt_2]
  bws_item.verify_packing_method_options(@possible_options)
end

When(/^the assistant buyer enters the Ti\/Hi$/) do

end

Then(/^the user is able to amend the value$/) do
  bws_item.adds_item_bws(YML_DATA['input_Sub_Department'],
                         YML_DATA['input_Category'],
                         YML_DATA['input_Sub_Category'],
                         YML_DATA['input_Main_Desc'],
                         YML_DATA['input_Marketing_Desc'],
                         YML_DATA['input_Differentiator_1'],
                         YML_DATA['input_Differentiator_2'],
                         YML_DATA['input_Supplier_Site'],
                         YML_DATA['input_Country_of_Sourcing'],
                         YML_DATA['input_Country_of_Manufacture'],
                         YML_DATA['input_Port_Of_Lading'],
                         YML_DATA['input_Cost_Zone_Group_ID'],
                         YML_DATA['input_Cost'],
                         YML_DATA['input_Supplier_Pack_Size'],
                         YML_DATA['input_Inner_Pack_Size'],
                         YML_DATA['input_Case_Pack_Qty'],
                         YML_DATA['input_Packing_Method'])
  #ADF Verification
  bws_item.check_adf_error

  ##verification ##
  bws_item.verify_Ti_Hi(YML_DATA['Ti'], YML_DATA['Hi'], YML_DATA['Ti_val'], YML_DATA['Hi_val'])

  #Delete created
  bws_item.delete_created

  #log_out
  login_page.log_out_from_bws
end

Given(/^an assistant buyer lands on the Inner Pack Size field$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_ba_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
end

When(/^the assistant buyer enters a number$/) do

end

Then(/^the number must be (\d+) digits in length with (\d+) decimal places$/) do |arg1, arg2|
  bws_item.adds_item_bws(YML_DATA['BWS']['add_item']['Sub_Department'],
                         YML_DATA['BWS']['add_item']['Category'],
                         YML_DATA['BWS']['add_item']['Sub_Category'],
                         YML_DATA['BWS']['add_item']['Main_Desc'],
                         YML_DATA['BWS']['add_item']['Marketing_Desc'],
                         YML_DATA['BWS']['add_item']['Differentiator_1'],
                         YML_DATA['BWS']['add_item']['Differentiator_2'],
                         YML_DATA['BWS']['add_item']['Supplier_Site'],
                         YML_DATA['BWS']['add_item']['Country_of_Sourcing'],
                         YML_DATA['BWS']['add_item']['Country_of_Manufacture'],
                         YML_DATA['BWS']['add_item']['Port_Of_Lading'],
                         YML_DATA['BWS']['add_item']['Cost_Zone_Group_ID'],
                         YML_DATA['BWS']['add_item']['Cost'],
                         YML_DATA['BWS']['add_item']['Supplier_Pack_Size'],
                         YML_DATA['BWS']['add_item']['Inner_Pack_Size'],
                         YML_DATA['BWS']['add_item']['Case_Pack_Qty'],
                         YML_DATA['BWS']['add_item']['Packing_Method'])

  bws_item.verify_inner_pack_size(YML_DATA['Expected_ips_size'], YML_DATA['Expected_ips_value'], YML_DATA['Actual_ips_value'])

  #ADF Verification
  bws_item.check_adf_error

end


Given(/^an assistant buyer lands on the Case Pack Qty field$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
end

Then(/^the Case Pack Qty number must be (\d+) digits in length with (\d+) decimal places$/) do |digits, decimals|
  bws_item.adds_item_bws(YML_DATA['BWS']['add_item']['Sub_Department'],
                         YML_DATA['BWS']['add_item']['Category'],
                         YML_DATA['BWS']['add_item']['Sub_Category'],
                         YML_DATA['BWS']['add_item']['Main_Desc'],
                         YML_DATA['BWS']['add_item']['Marketing_Desc'],
                         YML_DATA['BWS']['add_item']['Differentiator_1'],
                         YML_DATA['BWS']['add_item']['Differentiator_2'],
                         YML_DATA['BWS']['add_item']['Supplier_Site'],
                         YML_DATA['BWS']['add_item']['Country_of_Sourcing'],
                         YML_DATA['BWS']['add_item']['Country_of_Manufacture'],
                         YML_DATA['BWS']['add_item']['Port_Of_Lading'],
                         YML_DATA['BWS']['add_item']['Cost_Zone_Group_ID'],
                         YML_DATA['BWS']['add_item']['Cost'],
                         YML_DATA['BWS']['add_item']['Supplier_Pack_Size'],
                         YML_DATA['BWS']['add_item']['Inner_Pack_Size'],
                         YML_DATA['BWS']['add_item']['Case_Pack_Qty'],
                         YML_DATA['BWS']['add_item']['Packing_Method'])

  bws_item.verify_case_pack_qty(YML_DATA['Expected_ips_size'], YML_DATA['Expected_ips_value'], YML_DATA['Actual_ips_value'])

  #ADF Verification
  bws_item.check_adf_error
end


Then(/^the Expense Type and Component details calculates the expenses which is published in the Expenses field with Estimated Expense Value'>0$/) do
  bws_super_item.fill_item_tab
  bws_item.go_to_expense
  bws_item.check_expense_component_fields(YML_DATA['Expens_Fields'], YML_DATA['Component_Fields'])
  bws_item.add_expenses(YML_DATA['Exp_Zone'])
  bws_item.add_expenses(YML_DATA['Exp_Country'])
  bws_item.add_component_verify_expense(YML_DATA['CompID_01'])
  @item_id_auto_generated = bws_item.item_id
  bws_item.to_be_complete_steps
  bws_item.delete_bws_item(@item_id_auto_generated)
  login_page.log_out_from_bws
end


Given(/^an assistant buyer accesses the SKU tab$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
  ## Specific set of data
  bws_super_item.fill_item_tab_specific_data(YML_DATA['SKU'])
  @item_id_auto_generated = bws_item.item_id
end

When(/^the user opts to add a SKU to the Item \(style\)$/) do

end

And(/^selects 'By Group' option$/) do

end

Then(/^a pop\-up window opens prompting user to select the Diff Range labelled as 'Range'$/) do
  bws_item.skus_verifications(YML_DATA['skus_add_option_by_group'],YML_DATA['no_of_sku_size_01'])
  bws_item.to_be_complete_steps

  bws_item.delete_bws_item(@item_id_auto_generated)
  login_page.log_out_from_bws
end

Given(/^the user opts to add the SKU to the Item \(style\)$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_admin_user'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
  ## Specific set of data
  bws_super_item.add_diff_with_solid_or_fashion_option(YML_DATA['Diffs'])
  @item_id_auto_generated = bws_item.item_id
end

When(/^the user has selected a  Diff Range labelled 'Range' and Apply on the pop\-up$/) do

end

And(/^an assistant buyer selects size and colour from pop\-up$/) do

end

Then(/^a record for the selected size and colour are created$/) do
  bws_item.skus_verifications(YML_DATA['skus_add_option_by_group'],YML_DATA['no_of_sku_size_02'])
  bws_item.to_be_complete_steps

  bws_item.delete_bws_item(@item_id_auto_generated)
  login_page.log_out_from_bws
end

