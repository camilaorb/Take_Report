When(/^buyer create Warehouse with mandatory details$/) do

end

Then(/^the new Warehouse is add on top of Warehouse table and created RMS$/) do

  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_warehouse_id

  warehouse.add_warehouse
  warehouse.create_warehouse(@new_id, YML_DATA['Warehouse']['warehouse_name'],
                             YML_DATA['Warehouse']['currency'],
                             YML_DATA['Warehouse']['vat_region'],
                             YML_DATA['Warehouse']['delivery_option'],
                             YML_DATA['Warehouse']['inblund_days'],
                             YML_DATA['Warehouse']['cost_location'],
                             YML_DATA['Warehouse']['warehouse_number'])

  warehouse.add_address(YML_DATA['Warehouse']['address_type_option'],
                        YML_DATA['Warehouse']['address'],
                        YML_DATA['Warehouse']['city'],
                        YML_DATA['Warehouse']['country'])

  @vwh_id = rand(1..999)
  warehouse.add_vwh(@vwh_id,
                    YML_DATA['Warehouse']['name'],
                    YML_DATA['Warehouse']['org_en_type_opt'],
                    YML_DATA['Warehouse']['transfer_entity'],
                    YML_DATA['Warehouse']['org_unit'],
                    YML_DATA['Warehouse']['channel'],
                    YML_DATA['Warehouse']['pricing_location'],
                    YML_DATA['Warehouse']['primary_virtual_warehouse'])

  ## Warehouse Creation Verification ##
  database.verify_warehouse_create_update(@new_id, ['Warehouse']['name'])
  database.disconnect_db

end

Given(/^a buyer completes the fields and descriptions for a new WH$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  organizational_hierarchy.open_org_hierarchy
end

When(/^buyer access the virtual wh page$/) do

end


Then(/^the buyer is able to set\-up the virtual WH for the new create physical WH$/) do

  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_warehouse_id

  warehouse.add_warehouse
  warehouse.create_warehouse(@new_id, YML_DATA['Warehouse']['warehouse_name'],
                             YML_DATA['Warehouse']['currency'],
                             YML_DATA['Warehouse']['vat_region'],
                             YML_DATA['Warehouse']['delivery_option'],
                             YML_DATA['Warehouse']['inblund_days'],
                             YML_DATA['Warehouse']['cost_location'],
                             YML_DATA['Warehouse']['warehouse_number'])

  warehouse.add_address(YML_DATA['Warehouse']['address_type_option'],
                        YML_DATA['Warehouse']['address'],
                        YML_DATA['Warehouse']['city'],
                        YML_DATA['Warehouse']['country'])

  @vwh_id = rand(1..999)

  warehouse.add_vwh(@vwh_id,
                    YML_DATA['Warehouse']['name'],
                    YML_DATA['Warehouse']['org_en_type_opt'],
                    YML_DATA['Warehouse']['transfer_entity'],
                    YML_DATA['Warehouse']['org_unit'],
                    YML_DATA['Warehouse']['channel'],
                    YML_DATA['Warehouse']['pricing_location'],
                    YML_DATA['Warehouse']['primary_virtual_warehouse'])

  ## Virtual Warehouse Verification ##
  database.verify_virtual_warehouse_create_update(@vwh_id, YML_DATA['Warehouse']['name'], @new_id)
  database.disconnect_db

end

When(/^a buyer access the Address page for a wh$/) do

end

Then(/^the buyer is able to add Address WH for the new create physical WH$/) do

  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_warehouse_id

  warehouse.add_warehouse
  warehouse.create_warehouse(@new_id, YML_DATA['Warehouse']['warehouse_name'],
                             YML_DATA['Warehouse']['currency'],
                             YML_DATA['Warehouse']['vat_region'],
                             YML_DATA['Warehouse']['delivery_option'],
                             YML_DATA['Warehouse']['inblund_days'],
                             YML_DATA['Warehouse']['cost_location'],
                             YML_DATA['Warehouse']['warehouse_number'])

  warehouse.add_address(YML_DATA['Warehouse']['address_type_option'],
                        YML_DATA['Warehouse']['address'],
                        YML_DATA['Warehouse']['city'],
                        YML_DATA['Warehouse']['country'])

  @vwh_id = rand(1..999)

  warehouse.add_vwh(@vwh_id,
                    YML_DATA['Warehouse']['name'],
                    YML_DATA['Warehouse']['org_en_type_opt'],
                    YML_DATA['Warehouse']['transfer_entity'],
                    YML_DATA['Warehouse']['org_unit'],
                    YML_DATA['Warehouse']['channel'],
                    YML_DATA['Warehouse']['pricing_location'],
                    YML_DATA['Warehouse']['primary_virtual_warehouse'])


  ## Address Verification ##
  database.verify_warehouse_address_table(@new_id, YML_DATA['Warehouse']['address'], YML_DATA['Warehouse']['city'],
                                          YML_DATA['Warehouse']['country'])

  database.disconnect_db
end

When(/^buyer update warehouse with mandatory details$/) do

end

Then(/^the buyer is able to update WH for the selected physical WH$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  warehouse.edit_warehouse YML_DATA['Warehouse']['edit_warehouse']
  warehouse.update_warehouse(YML_DATA['Warehouse']['updated_warehouse_name'],
                             YML_DATA['Warehouse']['updated_vat_region'],
                             YML_DATA['Warehouse']['updated_delivery_option'],
                             YML_DATA['Warehouse']['updated_inblund_days'])


end

When(/^buyer update address of warehouse with mandatory details$/) do

end

Then(/^the buyer is able to update WH address for the selected physical WH$/) do

end

When(/^buyer add address for the created warehouse with mandatory details$/) do

end

Then(/^the buyer is able to add address for the selected physical WH$/) do

end

When(/^buyer add address from existing for the created warehouse with mandatory details$/) do

end

Then(/^the buyer is able to add address from existing for the selected physical WH$/) do

end

When(/^a buyer delete a the Warehouse$/) do

end

Then(/^the record is removed from the Warehouse table and RMS DB$/) do

end