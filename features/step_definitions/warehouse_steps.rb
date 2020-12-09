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
  database.verify_warehouse_create_update(@new_id, YML_DATA['Warehouse']['name'])


  ## Independent ##

  ## Delete Warehouse ##
  warehouse.edit_warehouse @new_id
  warehouse.delete_warehouse

  ## Delete Warehouse Creation Verification ##
  database.verify_dlyprg_table(@new_id)
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

  ## Independent ##
  ## Delete Warehouse ##
  warehouse.edit_warehouse @new_id
  warehouse.delete_warehouse

  ## Delete Warehouse Creation Verification ##
  database.verify_dlyprg_table(@new_id)
  database.disconnect_db

end

When(/^a buyer access the Address page for a wh$/) do

end

Then(/^the buyer is able to add Address WH for the new create physical WH$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')

  warehouse.edit_warehouse YML_DATA['Warehouse']['edit_warehouse']

  ## Add Address ##
  warehouse.add_address(YML_DATA['Warehouse']['address_type_option'],
                        YML_DATA['Warehouse']['manage_address'],
                        YML_DATA['Warehouse']['manage_city'],
                        YML_DATA['Warehouse']['manage_country'])

  ## Independent  - Delete - Address ##
  warehouse.delete_address(YML_DATA['Warehouse']['edit_warehouse'], YML_DATA['Warehouse']['manage_address'])

  ## Delete Address Database Verification ##
  database.verify_delete_address(YML_DATA['Warehouse']['edit_warehouse'], YML_DATA['Warehouse']['manage_address'])
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
  ## Warehouse Details Only -  Edit Verification ##
  database.verify_warehouse_create_update(YML_DATA['Warehouse']['edit_warehouse'], YML_DATA['Warehouse']['updated_warehouse_name'])
  database.disconnect_db

end

When(/^buyer update address of warehouse with mandatory details$/) do

end

Then(/^the buyer is able to update WH address for the selected physical WH$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')

  warehouse.edit_warehouse YML_DATA['Warehouse']['edit_warehouse']

  warehouse.edit_address
  warehouse.update_address(YML_DATA['Warehouse']['updated_address'],
                           YML_DATA['Warehouse']['updated_city'],
                           YML_DATA['Warehouse']['updated_country'])

  ## Address Verification ##
  database.verify_warehouse_address_table(YML_DATA['Warehouse']['edit_warehouse'], YML_DATA['Warehouse']['updated_address'], YML_DATA['Warehouse']['updated_city'],
                                          YML_DATA['Warehouse']['updated_country'])

  database.disconnect_db
end

When(/^buyer add address for the created warehouse with mandatory details$/) do

end

Then(/^the buyer is able to add address for the selected physical WH$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')

  warehouse.edit_warehouse YML_DATA['Warehouse']['edit_warehouse']

  ## Add Address On the Top of the Address mentioned for the WH ##
  warehouse.add_address(YML_DATA['Warehouse']['address_type_option'],
                        YML_DATA['Warehouse']['manage_address'],
                        YML_DATA['Warehouse']['manage_city'],
                        YML_DATA['Warehouse']['manage_country'])

  ## Address Verification ##
  database.verify_manage_add_address(YML_DATA['Warehouse']['edit_warehouse'], YML_DATA['Warehouse']['manage_address'], YML_DATA['Warehouse']['manage_city'],
                                     YML_DATA['Warehouse']['manage_country'])

  ## Independent - Delete Added New Address ##
  warehouse.delete_address(YML_DATA['Warehouse']['edit_warehouse'], YML_DATA['Warehouse']['manage_address'])

  database.disconnect_db

end

When(/^buyer add address from existing for the created warehouse with mandatory details$/) do

end

Then(/^the buyer is able to add address from existing for the selected physical WH$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')

  warehouse.edit_warehouse YML_DATA['Warehouse']['edit_warehouse']
  warehouse.manage_add_from_existing_address(YML_DATA['Warehouse']['address_type_option'],
                                             YML_DATA['Warehouse']['manage_existing_address'],
                                             YML_DATA['Warehouse']['manage_existing_city'],
                                             YML_DATA['Warehouse']['manage_existing_country'])

  ## Address Verification ##
  database.verify_manage_add_address(YML_DATA['Warehouse']['edit_warehouse'], YML_DATA['Warehouse']['manage_existing_address'], YML_DATA['Warehouse']['manage_existing_city'],
                                     YML_DATA['Warehouse']['manage_existing_country'])


  ## Independent - Delete Added New Address ##
  warehouse.delete_address(YML_DATA['Warehouse']['edit_warehouse'], YML_DATA['Warehouse']['manage_existing_address'])

  database.disconnect_db

end

When(/^a buyer delete a the Warehouse$/) do

end

Then(/^the record is removed from the Warehouse table and RMS DB$/) do

  # Independent Create
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

  ## Delete Warehouse ##
  warehouse.edit_warehouse @new_id
  warehouse.delete_warehouse

  ## Delete Warehouse Creation Verification ##
  database.verify_dlyprg_table(@new_id)
  database.disconnect_db

end

When(/^buyer add currency of VWH not equal to Pricing Location$/) do

end

Then(/^RMS will create a New Zone for the location with the currency of the new VWH$/) do
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
  @vwh_name = YML_DATA['Warehouse']['name'] + SecureRandom.random_number(100).to_s
  warehouse.add_vwh(@vwh_id,
                    @vwh_name,
                    YML_DATA['Warehouse']['org_en_type_opt'],
                    YML_DATA['Warehouse']['transfer_entity'],
                    YML_DATA['Warehouse']['org_unit'],
                    YML_DATA['Warehouse']['channel'],
                    YML_DATA['Warehouse']['pricing_location_diff_from_currency'],
                    YML_DATA['Warehouse']['primary_virtual_warehouse'])

  ## Virtual Warehouse Verification ##
  database.verify_virtual_warehouse_create_update(@vwh_id, YML_DATA['Warehouse']['name'], @new_id)

  ## new zone created verification  - because currency is different from pricing loc ##
  database.verify_system_creates_new_zone @vwh_name

  #### Independent - Delete Warehouse ####
  ## Delete Warehouse ##
  warehouse.edit_warehouse @new_id
  warehouse.delete_warehouse

  ## Delete Warehouse Creation Verification ##
  database.verify_dlyprg_table(@new_id)
  database.disconnect_db
end

Then(/^RMS will add the VWH to to the existing Zone$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_warehouse_id;

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
  @vwh_name = YML_DATA['Warehouse']['name'] + SecureRandom.random_number(100).to_s
  warehouse.add_vwh(@vwh_id,
                    @vwh_name,
                    YML_DATA['Warehouse']['org_en_type_opt'],
                    YML_DATA['Warehouse']['transfer_entity'],
                    YML_DATA['Warehouse']['org_unit'],
                    YML_DATA['Warehouse']['channel'],
                    YML_DATA['Warehouse']['pricing_location'],
                    YML_DATA['Warehouse']['primary_virtual_warehouse'])

  ## Virtual Warehouse Verification ##
  database.verify_virtual_warehouse_create_update(@vwh_id, YML_DATA['Warehouse']['name'], @new_id)

  ## new zone is not created verification  - because currency is same as pricing loc ##
  database.verify_system_not_creates_new_zone @vwh_name

  #### Independent - Delete ####
  ## Delete Warehouse ##
  warehouse.edit_warehouse @new_id
  warehouse.delete_warehouse

  ## Delete Warehouse Creation Verification ##
  database.verify_dlyprg_table(@new_id)
  database.disconnect_db
end

When(/^buyer add currency of VWH equal to Pricing Location$/) do

end