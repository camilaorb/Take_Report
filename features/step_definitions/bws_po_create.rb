

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

  bws_po_create.get_order_id


  #independent
  bws_item.delete_created
  login_page.log_out_from_bws
end