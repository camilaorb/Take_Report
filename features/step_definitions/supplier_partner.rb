## Supplier ##
Given(/^a buyer access Manage Supplier screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
  supplier_partner.open_supplier
end

When(/^buyer enters Supplier information the search criteria$/) do
  supplier_partner.search_supplier(YML_DATA['supplier_id'])
end

Then(/^the results for the Supplier search criteria is displayed in the Results table$/) do
  supplier_partner.verify_supplier_results(expected_values:YML_DATA['supplier_id'])
end

When(/^a buyer access Suppliers edits page$/) do
  supplier_partner.select_supplier(YML_DATA['supplier_id'])
  supplier_partner.access_supplier
end

Then(/^the buyer is able to amend the details of the Supplier Address$/) do
  shared.more_actions_select(YML_DATA['address'])
  login_page.logout_to_rms
end

### Supplier Site ###

When(/^buyer enters Supplier Site information the search criteria$/) do
  supplier_partner.search_supplier_site(YML_DATA['supplier_site_id'])
end

Then(/^the results for the Supplier Site search criteria is displayed in the Results table$/) do
  supplier_partner.verify_supplier_results(expected_values:YML_DATA['supplier_site_id'])
end

### Manage Address Supplier ###

####### Create ########

## Supplier ##
Given(/^a buyer access the Address page for a supplier$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
  supplier_partner.open_supplier
  supplier_partner.search_supplier(YML_DATA['supplier_id'])
  supplier_partner.select_supplier(YML_DATA['supplier_id'])
  supplier_partner.access_supplier
  shared.more_actions_select(YML_DATA['address'])
  supplier_partner.close_supplier
end

## Supplier Site ##
Given(/^a buyer access the Address page for a supplier site$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
  supplier_partner.open_supplier
  supplier_partner.search_supplier_site(YML_DATA['supplier_site_id'])
  supplier_partner.select_supplier_site(YML_DATA['supplier_site_id'])
  supplier_partner.access_supplier
  shared.more_actions_select(YML_DATA['address'])
  supplier_partner.close_supplier
end

## Partner ##
Given(/^a buyer access the Address page for a partner$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
  supplier_partner.open_supplier
  supplier_partner.search_supplier_site(YML_DATA['supplier_site_id'])
  supplier_partner.select_supplier_site(YML_DATA['supplier_site_id'])
  supplier_partner.access_supplier
  shared.more_actions_select(YML_DATA['address'])
  supplier_partner.close_supplier
end

## Communal ##
When(/^the buyer add address details$/) do
  supplier_partner.create_address(YML_DATA['a_type_1'], 'test st no 1', 'Vila Nova de Gaia', YML_DATA['country_1'], YML_DATA['state_1'])
  shared.save_and_close
end

## Supplier ##
Then(/^the new Address is add for the Supplier on RMS and RMS DB$/) do
  super_supp_part.open_supplier_address
  supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_1'])
  supplier_partner.verify_address_results(expected_values:'Vila Nova de Gaia')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_id'], YML_DATA['code_a_type_1'], 'test st no 1', 'Vila Nova de Gaia', YML_DATA['country_1'], YML_DATA['state_1'])
  database.disconnect_db
  super_supp_part.delete_address
  shared.save_and_close
  login_page.logout_to_rms
end

## Supplier Site##
Then(/^the new Address is add for the Supplier Site on RMS and RMS DB$/) do
  super_supp_part.open_supplier_site_address
  supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_1'])
  supplier_partner.verify_address_results(expected_values:'Vila Nova de Gaia')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_site_id'], YML_DATA['code_a_type_1'], 'test st no 1', 'Vila Nova de Gaia', YML_DATA['country_1'], YML_DATA['state_1'])
  database.disconnect_db
  super_supp_part.delete_address
  shared.save_and_close
  login_page.logout_to_rms
end

## Partner ##
Then(/^the new Address is add for the Partner on RMS and RMS DB$/) do
  super_supp_part.open_supplier_site_address
  supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_1'])
  supplier_partner.verify_address_results(expected_values:'Vila Nova de Gaia')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_site_id'], YML_DATA['code_a_type_1'], 'test st no 1', 'Vila Nova de Gaia', YML_DATA['country_1'], YML_DATA['state_1'])
  database.disconnect_db
  super_supp_part.delete_address
  shared.save_and_close
  login_page.logout_to_rms
end


####### Edit ########

## Supplier ##
Given(/^a buyer access a existing Address page for a supplier$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
  supplier_partner.open_supplier
  super_supp_part.access_existing_supplier_address
end

## Supplier Site ##
Given(/^a buyer access a existing Address page for a supplier site$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
  supplier_partner.open_supplier
  super_supp_part.access_existing_supp_site_address
end

## Partner ##
Given(/^a buyer access a existing Address page for a partner$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
  supplier_partner.open_supplier
  super_supp_part.access_existing_partner_address
end

## Communal ##
When(/^the buyer edit address details$/) do
  supplier_partner.edit_address('test st no 2', 'ABC', YML_DATA['country_2'], YML_DATA['state_2'])
  shared.save_and_close
end

## Supplier ##
Then(/^the Address is update for the Supplier on RMS and RMS DB$/) do
  super_supp_part.open_supplier_address
  supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_2'])
  supplier_partner.verify_address_results(expected_values:'ABC')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_id'], YML_DATA['code_a_type_1'], 'test st no 2', 'ABC', YML_DATA['country_2'], YML_DATA['state_2'])
  database.disconnect_db
  super_supp_part.delete_address
  shared.save_and_close
  login_page.logout_to_rms
end

## Supplier Site ##
Then(/^the Address is update for the Supplier Site on RMS and RMS DB$/) do
  super_supp_part.open_supplier_address
  supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_2'])
  supplier_partner.verify_address_results(expected_values:'ABC')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_site_id'], YML_DATA['code_a_type_1'], 'test st no 2', 'ABC', YML_DATA['country_2'], YML_DATA['state_2'])
  database.disconnect_db
  super_supp_part.delete_address
  shared.save_and_close
  login_page.logout_to_rms
end

## Partner ##
Then(/^the Address is update for the Partner on RMS and RMS DB$/) do
  super_supp_part.open_supplier_address
  supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_2'])
  supplier_partner.verify_address_results(expected_values:'ABC')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_id'], YML_DATA['code_a_type_1'], 'test st no 2', 'ABC', YML_DATA['country_2'], YML_DATA['state_2'])
  database.disconnect_db
  super_supp_part.delete_address
  shared.save_and_close
  login_page.logout_to_rms
end

When(/^the buyer opt for 'Add From Existing'$/) do
  supplier_partner.add_existing_address(YML_DATA['a_type_1'])
  shared.save_and_close
end

## Supplier ##
Then(/^the Address is add for the Supplier on RMS and RMS DB$/) do
  super_supp_part.open_supplier_address
  supplier_partner.verify_address_results(expected_values:'Vila Nova de Gaia')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_id'], YML_DATA['code_a_type_1'], 'test st no 1', 'Vila Nova de Gaia', YML_DATA['country_1'], YML_DATA['state_1'])
  database.count_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_id'], YML_DATA['country_1'])
  database.disconnect_db
  super_supp_part.delete_existing_address
  shared.save_and_close
  login_page.logout_to_rms
end

## Supplier Site ##
Then(/^the Address is add for the Supplier Site on RMS and RMS DB$/) do
  super_supp_part.open_supplier_address
  supplier_partner.verify_address_results(expected_values:'Vila Nova de Gaia')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_site_id'], YML_DATA['code_a_type_1'], 'test st no 1', 'Vila Nova de Gaia', YML_DATA['country_1'], YML_DATA['state_1'])
  database.count_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_site_id'], YML_DATA['country_1'])
  database.disconnect_db
  super_supp_part.delete_existing_address
  shared.save_and_close
  login_page.logout_to_rms
end

## Partner ##
Then(/^the Address is add for the Partner on RMS and RMS DB$/) do
  super_supp_part.open_supplier_address
  supplier_partner.verify_address_results(expected_values:'Vila Nova de Gaia')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_id'], YML_DATA['code_a_type_1'], 'test st no 1', 'Vila Nova de Gaia', YML_DATA['country_1'], YML_DATA['state_1'])
  database.count_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_id'], YML_DATA['country_1'])
  super_supp_part.delete_existing_address
  shared.save_and_close
  login_page.logout_to_rms
end

####### Delete ########

## Supplier non-Primary ##

When(/^the buyer delete the supplier address that is set up as non-primary$/) do
  super_supp_part.delete_address
  shared.save_and_close
end


Then(/^the Address is delete for the Supplier on RMS and RMS DB$/) do
  super_supp_part.open_supplier_address
  supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_1'])
  supplier_partner.verify_address_results(expected_values:'')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_id'], YML_DATA['code_a_type_1'], 'test st no 2', 'ABC', YML_DATA['country_2'], YML_DATA['state_2'])
  database.disconnect_db
  login_page.logout_to_rms
end

## Supplier Primary ##

Given(/^a buyer access a existing Primary Address for a supplier$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
  supplier_partner.open_supplier
  super_supp_part.access_primary_supp_address
end

When(/^the buyer attempt to delete the supplier address that is setup as a Primary Address$/) do
  supplier_partner.delete_primary_address
end

Then(/^the buyer is unable to delete the supplier address$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_id'], YML_DATA['code_a_type_1'], 'No.123', 'Durban', YML_DATA['country_3'], YML_DATA[''])
  database.disconnect_db
  shared.clear_filters
  shared.save_and_close
  login_page.logout_to_rms
end

## Supplier Site non-Primary ##

When(/^the buyer delete the supplier site address that is set up as non-primary$/) do
  super_supp_part.delete_address
  shared.save_and_close
end


Then(/^the Address is delete for the Supplier Site on RMS and RMS DB$/) do
  super_supp_part.open_supplier_site_address
  supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_1'])
  supplier_partner.verify_address_results(expected_values:'')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_site_id'], YML_DATA['code_a_type_1'], 'test st no 2', 'ABC', YML_DATA['country_2'], YML_DATA['state_2'])
  database.disconnect_db
  login_page.logout_to_rms
end

## Supplier Site Primary ##

Given(/^a buyer access a existing Primary Address for a supplier site$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
  supplier_partner.open_supplier
  super_supp_part.access_primary_supp_site_address
end

When(/^the buyer attempt to delete the supplier site address that is setup as a Primary Address$/) do
  supplier_partner.delete_primary_address
end

Then(/^the buyer is unable to delete the supplier site address$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_site_id'], YML_DATA['code_a_type_1'], 'No.123', 'Durban', YML_DATA['country_3'], YML_DATA[''])
  database.disconnect_db
  shared.clear_filters
  shared.save_and_close
  login_page.logout_to_rms
end

## Partner non-Primary ##

When(/^the buyer delete the partner address that is set up as non-primary$/) do
  super_supp_part.delete_address
  shared.save_and_close
end


Then(/^the Address is delete for the partner on RMS and RMS DB$/) do
  super_supp_part.open_supplier_site_address
  supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_1'])
  supplier_partner.verify_address_results(expected_values:'')
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_site_id'], YML_DATA['code_a_type_1'], 'test st no 2', 'ABC', YML_DATA['country_2'], YML_DATA['state_2'])
  database.disconnect_db
  login_page.logout_to_rms
end

## Partner Primary ##

Given(/^a buyer access a existing Primary Address for a partner$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
  supplier_partner.open_supplier
  super_supp_part.access_primary_supp_site_address
end

When(/^the buyer attempt to delete the partner address that is setup as a Primary Address$/) do
  supplier_partner.edit_address('test st no 2', 'ABC', YML_DATA['country_2'], YML_DATA['state_2'])
  shared.save_and_close
end

Then(/^the buyer is unable to delete the partner address$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_address_table(YML_DATA['db_supplier'], YML_DATA['supplier_site_id'], YML_DATA['code_a_type_1'], 'No.123', 'Durban', YML_DATA['country_3'], YML_DATA[''])
  database.disconnect_db
  shared.clear_filters
  shared.save_and_close
  login_page.logout_to_rms
end

### Supplier Site ###

When(/^a buyer access Suppliers Site edits page$/) do
  supplier_partner.select_supplier_site(YML_DATA['supplier_site_id'])
  supplier_partner.access_supplier
end

Then(/^buyer is able to create new inventory for the supplier site$/) do
  shared.more_actions_select(YML_DATA['inventory_management'])
  super_supp_part.create_inventory

end

Then(/^buyer is able to view Org Unit that is already setup by Finance$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

And(/^buyer is able to opt for the Org Unit for the supplier site$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^buyer is able to select a supplier trait to the Supplier Site$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


Then(/^buyer is able to delete a supplier trait to the Supplier Site$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


Then(/^the buyer is able to create documents for the selected supplier site$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


Then(/^the buyer is able to remove documents for the selected supplier site$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


Then(/^the buyer is able to create Import Attributes and Beneficiary Attributes$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


Then(/^the buyer is able to create expense details by entering Shipping Routes, Expenses and Rate Updates$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


### Partner ###

Given(/^a buyer access Manage Partners page$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
  supplier_partner.open_supplier
end

When(/^buyer enters Partner information the search criteria$/) do
  supplier_partner.search_supplier(YML_DATA['supplier_id'])
end

Then(/^the results for the Partner search criteria is displayed in the Results table$/) do
  supplier_partner.verify_supplier_results(expected_values:YML_DATA['supplier_id'])
end


Given(/^a buyer access Create Partners page$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  supplier_partner.open_supplier_and_partner
end

When(/^the buyer add partner details$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the new partner is add on RMS and RMS DB$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^the buyer edit partner details$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the partner is update on RMS and RMS DB$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


When(/^a buyer access Invoicing Attributes$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the Receive Invoice is save$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^a buyer access Partners edits page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


Then(/^the buyer is able to create documents for the selected Partner$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the buyer is able to remove documents for the selected Partner$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
