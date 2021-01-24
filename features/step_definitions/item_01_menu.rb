Given(/^a buyer selects the 'Item & Ordering Worklist' option from task menu$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
end

Then(/^the assistant buyer has the option to review a list of Items or either create new, copy or open an exiting item or merge, delete or reject an item$/) do
  bws_item_menu.verify_list_of_top_bar_items
  bws_item_menu.verify_list_of_worksheet_table
  bws_item_menu.verify_submit_ok_buttons
  login_page.log_out_from_bws
end

When(/^'Item & Ordering Worklist' task open$/) do

end


When(/^the assistant buyer is able to enter Item$/) do

end

Then(/^the Item is created$/) do

end

When(/^the Assistant Buyer manually adds an Item$/) do

end

And(/^select Manual create Packs Item$/) do

end

And(/^select Auto create Packs Item$/) do

end

Given(/^the Assistant Buyer on Item tab$/) do

end

When(/^the assistant buyer is able to enter Item details$/) do

end

Then(/^the Assistant Buyer is able to move to the next tab$/) do

end


When(/^the assistant buyer selects the 'Green Plus' button located next to the 'Swing Tag' field$/) do

end

Then(/^the assistant buyer is able to enters more then (\d+) swing tag$/) do |arg|

end

When(/^an Assistant Buyer opts to add Expenses$/) do

end

Then(/^the Expense Type and Component details calculates the expenses which is published in the Expenses field$/) do

end

When(/^an Assistant Buyer opts to add HTS Code$/) do

end


When(/^an assistant buyer opts to add UDA$/) do

end

Then(/^the user enters more then (\d+) swing tags$/) do |arg|

end

When(/^the 'Item sub\-tab' displays within the Item Information section$/) do

end

Then(/^the assistant Buyer is able add specific details including Item’s merchandise hierarchy, Supplier Site, Country of Sources and Country of Manufacturing, Base Cost and Differentiators$/) do

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

  bws_item.to_be_complete_steps

  bws_item.delete_created
  login_page.log_out_from_bws
end

When(/^the assistant buyer selects the Add Existing Item$/) do

end

Then(/^the buyer will be presented with a pop\-up to search from approved Items from RMS$/) do
  bws_item_menu.add_item_select_options "add_existing_item"
  bws_item_menu.verify_add_item_popup
  login_page.log_out_from_bws
end

When(/^the assistant buyer selects the Copy From Existing Item$/) do

end

Then(/^the user will be presented with a pop\-up to search from approved Items from RMS to Copy From$/) do
  bws_item_menu.add_item_select_options "copy_from_existing"
  bws_item_menu.verify_add_item_popup
  login_page.log_out_from_bws
end

Then(/^Item ID will be copied form the existing item and Item ID will be automatically generated using ORIN Type$/) do
  bws_item_menu.add_item_select_options "copy_from_existing"
  bws_item.existing_item_details YML_DATA['BWS']['copy_from_existing']['existing_item'],
                                 YML_DATA['BWS']['copy_from_existing']['existing_supplier'],
                                 YML_DATA['BWS']['copy_from_existing']['existing_country_of_source']

  #To change the details of the copy from existing Item
  bws_item.update_copy_from_exsiting_item_details(YML_DATA['BWS']['copy_from_existing']['main_desc'],
                                                  YML_DATA['BWS']['copy_from_existing']['marketing_desc'],
                                                  YML_DATA['BWS']['copy_from_existing']['detail_desc'],
                                                  YML_DATA['BWS']['copy_from_existing']['supplier_site'],
                                                  YML_DATA['BWS']['copy_from_existing']['country_of_sourcing'],
                                                  YML_DATA['BWS']['copy_from_existing']['Country_of_Manufacture'],
                                                  YML_DATA['BWS']['copy_from_existing']['cost_zone_group_id'],
                                                  YML_DATA['BWS']['copy_from_existing']['cost'],
                                                  YML_DATA['BWS']['copy_from_existing']['packing_method'],
                                                  YML_DATA['BWS']['copy_from_existing']['inner_pack_size'],
                                                  YML_DATA['BWS']['copy_from_existing']['case_pack_qty'])
  bws_item.delete_created
  login_page.log_out_from_bws
end

When(/^the buyer selects the Item & Ordering Line using the checkbox and Delete Item \(red cross logo\) from the menu$/) do

end

Then(/^the Item & Ordering Line from the worklist will be deleted$/) do
  # Independent
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
  bws_item.to_be_complete_steps
  # Verify Delete
  bws_item.delete_created
  login_page.log_out_from_bws
end

And(/^the Item is on a repeating Purchase Order$/) do

end

Then(/^the Item & Ordering Line from the worklist will be  deleted but the Item will "([^"]*)" be deleted from RMS$/) do |arg|

end

When(/^the buyer review the Item & Ordering Line and selects one or more Item & Ordering line from the worklist$/) do

end

And(/^selects the Reject button$/) do

end

Then(/^the Item & Ordering Line will be set to Reject Status and assigned to the assistant buyer with a comment$/) do

end

Given(/^a buyer or planner rejects an Item & Ordering Line$/) do

end

When(/^the assistant buyer has submitted the Item & Ordering Line$/) do

end

Then(/^a confirmation message pop\-up prompting the buyer\/planner to Assign to the the assistant buyer coupled with a comments that explains the reasons for rejection$/) do

end