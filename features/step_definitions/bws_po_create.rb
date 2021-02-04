

Given(/^a user accesses the Order Information tab$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer_user'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_super_item.goto_order_information_tab
end

#-------------------------------------------------------------------#

When(/^the user Add a delivery drop$/) do
  bws_po_create.add_order_information_bws
end

Then(/^a new delivery drop record in the delivery drop table$/) do
  @order_no = bws_po_create.get_order_no(0)

  @item_id_auto_generated = bws_item.item_id
  bws_po_create.cancel_order
  bws_item.delete_created
  login_page.log_out_from_bws(TE.environment['bws_buyer_user'])
end

#-------------------------------------------------------------------#

When(/^the user Delete a a new delivery drop$/) do
  bws_po_create.add_order_information_bws
  @order_no = bws_po_create.get_order_no(0)
  bws_po_create.delete_order_information_bws(0)
end

Then(/^the record is removed from the Delivery Drop table$/) do
  @item_id_auto_generated = bws_item.item_id
  bws_item.cancel_order
  bws_item.delete_bws_item(@item_id_auto_generated)
  login_page.log_out_from_bws
end

#-------------------------------------------------------------------#

And(/^select a specified delivery$/) do
  bws_po_create.add_order_information_bws
  bws_po_create.set_delivery_drop_qty(0, '10')
end

When(/^the user opts to 'Split Delivery'$/) do
  bws_po_create.split_delivery_order_inf_bws(0)
end

Then(/^a new Delivery Drop record is created with the exact same attributes has the selected delivery drop$/) do
  @order_no_1 = bws_po_create.get_order_ref_id(0)
  @order_no_2 = bws_po_create.get_order_ref_id(1)
end

And(/^the Delivery Drop is set to 0 'Zero'$/) do
  bws_po_create.verify_split_order_inf_bws(1)

  @item_id_auto_generated = bws_item.item_id
  bws_po_create.cancel_order
  bws_item.delete_created
  login_page.log_out_from_bws(TE.environment['bws_buyer_user'])
end

#-------------------------------------------------------------------#

Given(/^an assistant buyer completes the setup of the Item$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer_user'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_super_item.goto_order_information_tab
end

When(/^the assistant buyer accesses the Order Information tab$/) do
  bws_po_create.add_order_information_bws
  @order_no = bws_po_create.get_order_no(0)
  bws_po_create.delete_order_information_bws(0)
end

Then(/^the partioned screen displays 3 sections 'Delivery Drop section', 'SKU Distribution section' and 'Packs Create section'$/) do
  @item_id_auto_generated = bws_item.item_id
  bws_item.cancel_order
  bws_item.delete_bws_item(@item_id_auto_generated)
  login_page.log_out_from_bws
end

#-------------------------------------------------------------------#

Given(/^an assistant buyer accesses the Delivery Drop panel$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer_user'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_super_item.goto_order_information_tab
end

When(/^the user selects the checkbox against the Swing Tag Req$/) do
  bws_po_create.add_order_information_bws
  @order_no = bws_po_create.get_order_no(0)
  bws_po_create.delete_order_information_bws(0)
end

Then(/^the the Swing Tags associated to the Item will be defaulted to the Purchase Order$/) do
  @item_id_auto_generated = bws_item.item_id
  bws_item.cancel_order
  bws_item.delete_bws_item(@item_id_auto_generated)
  login_page.log_out_from_bws
end

#-------------------------------------------------------------------#

Given(/^a user has fully distributed the quantities derived in Order Information tab$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer_user'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_super_item.goto_order_information_tab
end

When(/^the Total Quantities are successfully Distributed$/) do
  bws_po_create.add_order_information_bws
  @order_no = bws_po_create.get_order_no(0)
  bws_po_create.delete_order_information_bws(0)
end

Then(/^the indicator contained in the Order Information details displays 'Green'$/) do
  @item_id_auto_generated = bws_item.item_id
  bws_item.cancel_order
  bws_item.delete_bws_item(@item_id_auto_generated)
  login_page.log_out_from_bws
end

#-------------------------------------------------------------------#

Given(/^a user has distributed the quantities derived in Order Information tab$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer_user'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_super_item.goto_order_information_tab
end

When(/^the Total Quantities are either partially or none Distributed$/) do
  bws_po_create.add_order_information_bws
  @order_no = bws_po_create.get_order_no(0)
  bws_po_create.delete_order_information_bws(0)
end

Then(/^the indicator contained in the Order Information details displays 'Red'$/) do
  @item_id_auto_generated = bws_item.item_id
  bws_item.cancel_order
  bws_item.delete_bws_item(@item_id_auto_generated)
  login_page.log_out_from_bws
end

#-------------------------------------------------------------------#

Given(/^an assistant buyer accesses the Delivery Drop table$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer_user'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_super_item.goto_order_information_tab
end





When(/^the assistant buyer views the delivery drop details$/) do
  bws_po_create.add_order_information_bws
end

Then(/^the Order No which holds the Purchase Order ID is displayed and is non-editable$/) do
  @order_no = bws_po_create.get_order_no(0)
  bws_po_create.delete_order_information_bws(0)
  @item_id_auto_generated = bws_item.item_id
  bws_item.cancel_order
  bws_item.delete_bws_item(@item_id_auto_generated)
  login_page.log_out_from_bws
end

#-------------------------------------------------------------------#

When(/^a new Delivery Drop is added$/) do
  bws_po_create.add_order_information_bws
  bws_po_create.add_order_information_bws
end

Then(/^the Order Ref ID increases sequentially$/) do
  @order_ref_id_1 = bws_po_create.get_order_ref_id(1)
  @order_ref_id_2 = bws_po_create.get_order_ref_id(0)
  bws_po_create.verify_increase(@order_no_1, @order_no_2)

  @item_id_auto_generated = bws_item.item_id
  bws_po_create.cancel_order
  bws_item.delete_created
  login_page.log_out_from_bws(TE.environment['bws_buyer_user'])
end

#-------------------------------------------------------------------#

When(/^a new Delivery Drop is deleted$/) do
  bws_po_create.add_order_information_bws
  bws_po_create.add_order_information_bws
  bws_po_create.add_order_information_bws
  @order_ref_id_1 = bws_po_create.get_order_ref_id(2)
  @order_ref_id_2 = bws_po_create.get_order_ref_id(1)
  @order_ref_id_3 = bws_po_create.get_order_ref_id(0)
  bws_po_create.delete_order_information_bws(1)
  @new_order_ref_id_1 = bws_po_create.get_order_ref_id(1)
  @new_order_ref_id_3 = bws_po_create.get_order_ref_id(0)
end

Then(/^the Order Ref ID is not adjusted$/) do
  bws_po_create.verify_delte_order_id(@order_ref_id_1, @order_ref_id_2, @order_ref_id_3, @new_order_ref_id_1, @new_order_ref_id_3)
  @item_id_auto_generated = bws_item.item_id
  bws_po_create.cancel_order
  bws_item.delete_created
  login_page.log_out_from_bws(TE.environment['bws_buyer_user'])
end