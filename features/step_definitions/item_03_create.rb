
Given(/^the Assistant Buyer on 'Item & Ordering Worklist' page$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
end

When(/^the assistant Buyer manually adds an Add New Item to the Buyers Worklist$/) do

end

Then(/^the assistant Buyer is able add specific details$/) do
  bws_item_menu.add_item_select_options("add_new_item")
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
  bws_item.delete_created
  login_page.log_out_from_bws
end

#Comun Step
Given(/^an Assistant Buyer on Item tab$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['bws_group']
  bws_item_menu.access_create_new_item
end

#

When(/^an assistant buyer enters the Sub-Department$/) do
  bws_item.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

Then(/^the values listed for the Category are specific for the selected sub-department$/) do

  bws_item_menu.add_item_select_options("add_new_item")
  bws_item.verify_category_list_against_sub_dept(YML_DATA['input_Sub_Department'])
  #  bws_item_actions.delete_created
  #login_page.log_out_from_bws
  #


end

#

When(/^an assistant buyer enters a the Category$/) do
  bws_item.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

Then(/^the values listed for the sub-category are specific to the selected sub-department and category$/) do
  bws_item.delete_created
  login_page.log_out_from_bws
end

#Check Characters limit
When(/^the assistant buyer enters the Main Description for the Item$/) do
  bws_item.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

When(/^the assistant buyer enters the Marketing Description for the Item$/) do
  bws_item.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

When(/^the assistant buyer enters the Detailed Description for the Item$/) do
  bws_item.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

When(/an assistant buyer enters the Supplier Style No$/) do
  bws_item.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

Then(/^the field is limited to '([^"]*)' Characters$/) do |_arg|
  bws_item.delete_created
  login_page.log_out_from_bws
end

#

When(/^the assistant buyer enters the Colour ID$/) do
  bws_item.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

Then(/^the colour Diff is created$/) do
  bws_item.delete_created
  login_page.log_out_from_bws
end

#

When(/^the assistant buyer enters the Size ID$/) do
  bws_item.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

Then(/^the Size Diffs are created$/) do
  bws_item.delete_created
  login_page.log_out_from_bws
end

#

When(/^the assistant buyer enters the colour differentiator on Supplier Diff 1 field$/) do
  bws_item.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

Then(/^the assistant buyer is able to enter the supplier colour$/) do
  bws_item.delete_created
  login_page.log_out_from_bws
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

#

When(/^an assistant buyer enters the special instructions$/) do
  bws_item.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
end

#

When(/^the assistant buyer selects the Swing Tag button$/) do

end

Then(/^the user is able to add new swing tab$/) do
  bws_item.add_swing_tag
  login_page.log_out_from_bws
  login_page.verify_logout
end

#

Given(/^an assistant buyer enters the details for the Swing Tag$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_item_menu.add_item_select_options("add_new_item")
end

When(/^the assistant buyer attempts to create more than 3 swing tags by the Add button$/) do

end

Then(/^a message appears prompting user to remove the additional swing tags$/) do
  bws_item.delete_created
  login_page.log_out_from_bws
end

#

Given(/^an admin updates System Options 'Swing Tag' column to 5$/) do

end

When(/^the user accesses the swing tag placeholder in Item tab$/) do

end

Then(/^the number of tags allowed in the placeholder does not exceed the value set at the System Options$/) do

end

#

When(/^an assistant buyer enters the Supplier Site for the Style$/) do

end

Then(/^the field must display the supplier site ID and name$/) do

end

#

When(/^an assistant buyer enters the Country of Sourcing$/) do

end

Then(/^the field must display the ID-Country and Description$/) do

end

#

When(/^an assistant buyer enters the Country of Manufacture$/) do

end

Then(/^the field must display the ID-Country Description$/) do

end

#

When(/^an assistant buyer opts to enter the Port of Lading$/) do

end

Then(/^the assistant buyer is able view the ID and Port Description in the field$/) do

end

#

When(/^the assistant buyer enters the Cost Zone Group ID$/) do

end

Then(/^the Cost Zone Groups are displayed$/) do

end

#

When(/^the user enters the Base Cost$/) do

end

Then(/^the Base Cost value will default to Supplier Currency$/) do

end

#

Given(/^an assistant buyer accesses the Base Cost displayed in Supplier Currency$/) do

end

Then(/^the field alongside the Base Cost will display the Base Cost converted to the System Currency which is ZAR$/) do

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

#

Given(/^the assistant buyer accesses the PMO field$/) do

end

When(/^the assistant buyer enter the Cost and Initial Retail Value$/) do

end

Then(/^the PMO is calculated, correct value is displayed and is non-editable$/) do

end

#
