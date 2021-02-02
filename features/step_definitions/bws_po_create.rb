

Given(/^a user accesses the Order Information tab$/) do
  visit(TE.environment['bws_url'])
  login_page.login_to_bws(TE.environment['bws_buyer_user'], TE.environment['bws_buyer_pw'])
  bws_shared.select_task YML_DATA['BWS']['bws_group']
  bws_super_item.goto_order_information_tab

end

When(/^the user Add a delivery drop$/) do
  bws_po_create.add_order_information_bws
end

Then(/^a new delivery drop record in the delivery drop table$/) do

  @order_no = bws_po_create.get_order_no

  #independent
  @item_id_auto_generated = bws_item.item_id
  bws_po_create.cancel_order
  bws_item.delete_created
  login_page.log_out_from_bws
end

When(/^the user Delete a a new delivery drop$/) do
  bws_po_create.add_order_information_bws
  bws_po_create.delete_order_information_bws
end

Then(/^the record is removed from the Delivery Drop table$/) do

  @order_no = bws_po_create.get_order_no

  #independent
  @item_id_auto_generated = bws_item.item_id
  bws_item.cancel_order
  bws_item.delete_bws_item(@item_id_auto_generated)
  login_page.log_out_from_bws
end

