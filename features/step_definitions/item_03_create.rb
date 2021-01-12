
Given(/^the Assistant Buyer on 'Item & Ordering Worklist' page$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer'], TE.environment['bws_buyer_pw'])
  bws_items_01.select_task YML_DATA['bws_group']

end

When(/^the assistant Buyer manually adds an Add New Item to the Buyers Worklist$/) do
  bws_03_item_create.access_create_new_item

end

Then(/^the assistant Buyer is able add specific details$/) do
  bws_03_item_create.fields_item_bws(YML_DATA['BWS']['add_item']['Sub_Department'],
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
  bws_03_item_create.calcel_and_delete_created
  bws_03_item_create.log_out_from_bws
end

Given(/^an Assistant Buyer on item create tab$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer'], TE.environment['bws_buyer_pw'])
  bws_items_01.select_task YML_DATA['bws_group']
  bws_03_item_create.access_create_new_item
end

When(/^an assistant buyer enters the Sub-Department$/) do
  bws_03_item_create.bws_item_check_fields(YML_DATA['item_element_subdepartment'], YML_DATA['input_Sub_Department'] )
  bws_items_01.delete_created
  bws_items_01.log_out_from_bws
end



When(/^the Assistant Buyer manually adds an Item$/) do |table|
  table.hashes.each do |value|
    login_page.user_login value[:username], value[:password]
    shared.navigate_to_screen 'New Order'
    master_order.complete_orders_section(value[:location], value[:department], value[:buyer], value[:supplier], value[:payment_method], value[:factory], value[:c_o_manufacturer], value[:inco_terms_01], value[:exit_port], value[:transport_mode])
    shared.navigate_to_next_screen
    style.verify_style_screen
    style.add_style_header
    style.complete_style_header value[:style_description], value[:style_season], value[:class], value[:subclass]
    @style_no = style.return_style_number
    super_method_test.fulfill_cfd "Regular"
    super_method_test.fulfill_cfd_additional

    style.enter_style_detailed_description
    shared.navigate_to_tab 'Colours & Sizes'
    colours_and_sizes.select_colours_and_sizes_group value[:colour_group], value[:size_group]
    colours_and_sizes.select_colours_and_sizes value[:colour], value[:size]
    shared.navigate_to_tab 'Prices & Ticketing'
    @destination = prices_and_ticketing.define_retail_price_for_price_zone value[:price_region], value[:price]
    prices_and_ticketing.select_supplier_provides_tickets 'Regular Swing Tickets'
    shared.navigate_to_tab 'Attributes'
    attributes.verify_attributes_tab
    attributes.set_all_mandatory_attributes
    shared.navigate_to_tab 'Grading'
    grading.verify_grading_tab
    grading.apply_grade_usa
    shared.save_details
    shared.navigate_to_screen 'Costs'
    costs.verify_costs_screen
    costs.set_cost_screen_values
    sleep 5
    shared.navigate_to_screen screen
    deliveries.verify_deliveries_screen
    shared.save_details
    deliveries.select_add_pack_grouping
    deliveries.create_pack_group 'Assorted'
    sleep 4
    shared.save_details
    deliveries.navigate_to_tab tab
    deliveries.verify_deliveries_tab
  end
  shared.save_and_close
end

Then(/^the Item is created$/) do
  login_page.logout_to_rms
end