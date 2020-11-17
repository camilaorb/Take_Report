## Supplier ##
Given(/^a buyer is in Manage Supplier screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier.open_supplier_and_partner
  supplier.open_supplier
end

When(/^buyer enters Supplier information the search criteria$/) do
  supplier.search_supplier(YML_DATA['supplier_id'])
end

Then(/^the results for the Supplier search criteria is displayed in the Results table$/) do
  supplier.verify_supplier_results(expected_values:YML_DATA['supplier_id'])
end

When(/^a buyer access Suppliers edits page$/) do
  supplier.select_supplier(YML_DATA['supplier_id'])
  supplier.select_supplier_site('')
  supplier.access_supplier
end

Then(/^the buyer is able to amend the details of the Supplier Address$/) do
  supplier.access_address
end

### Manage Address ###

Given(/^a buyer access the Address page for a supplier$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier.open_supplier_and_partner
  supplier.open_supplier
  supplier.search_supplier(YML_DATA['supplier_id'])
  supplier.select_supplier(YML_DATA['supplier_id'])
  supplier.select_supplier_site('')
  supplier.access_supplier
  supplier.access_address
  supplier.close_supplier
end

When(/^the buyer is able to add address details$/) do
  supplier.create_address(YML_DATA['a_type_1'], 'test st no 1', 'Vila Nova de Gaia', YML_DATA['country_1'], YML_DATA['state_1'])
  shared.save_and_close
end

Then(/^the new Address is add for the Supplier on RMS and RMS DB$/) do
  super_supplier.reopen_address
end

When(/^the buyer is able to edit address details$/) do
  supplier.edit_address('test st no 2', 'ABC', YML_DATA['country_2'], YML_DATA['state_2'])
  shared.save_and_close
end

Then(/^the Address is update for the Supplier on RMS and RMS DB$/) do
  super_supplier.reopen_address
end

When(/^the buyer is able to opt 'Add From Existing'$/) do
  supplier.add_existing_address(YML_DATA['a_type_1'])
end

Then(/^the Address is add for the Supplier on RMS and RMS DB$/) do
  super_supplier.reopen_address
end