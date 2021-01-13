
Given(/^the Assistant Buyer on 'Item & Ordering Worklist' page$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['bws_group']

end

When(/^the assistant Buyer manually adds an Add New Item to the Buyers Worklist$/) do
  bws_item_menu.access_create_new_item_button

end

Then(/^the assistant Buyer is able add specific details$/) do
  bws_items_tabs.fields_item_bws(YML_DATA['BWS']['add_item']['Sub_Department'],
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
  bws_item_actions.delete_created
  login_page.log_out_from_bws
end

#Comun Step
Given(/^an Assistant Buyer on item create tab$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['bws_group']
  bws_item_menu.access_create_new_item
end

#

When(/^an assistant buyer enters the Sub-Department$/) do
  bws_item_actions.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

Then(/^the values listed for the Category are specific for the selected sub-department$/) do
  bws_item_actions.delete_created
  login_page.log_out_from_bws
end

#

When(/^an assistant buyer enters a the Category$/) do
  bws_03_item_create.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

Then(/^the values listed for the sub-category are specific to the selected sub-department and category$/) do
  bws_item_actions.delete_created
  login_page.log_out_from_bws
end

#Check Characters limit
When(/^the assistant buyer enters the Main Description for the Item$/) do
  bws_03_item_create.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

When(/^the assistant buyer enters the Marketing Description for the Item$/) do
  bws_03_item_create.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

When(/^the assistant buyer enters the Detailed Description for the Item$/) do
  bws_03_item_create.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

When(/^an assistant buyer enters description for the Supplier Label$/) do
  bws_03_item_create.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

Then(/^the field is limited to '([^"]*)' Characters$/) do |_arg|
  bws_item_actions.delete_created
  login_page.log_out_from_bws
end

#

When(/^the assistant buyer enters the Colour ID$/) do
  bws_03_item_create.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

Then(/^the colour Diff is created$/) do
  bws_item_actions.delete_created
  login_page.log_out_from_bws
end

#

When(/^the assistant buyer enters the Size ID$/) do
  bws_03_item_create.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

Then(/^the Size Diffs are created$/) do
  bws_item_actions.delete_created
  login_page.log_out_from_bws
end