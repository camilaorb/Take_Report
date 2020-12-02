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

  warehouse.add_vwh(YML_DATA['Warehouse']['vwh'],
                    YML_DATA['Warehouse']['name'],
                    YML_DATA['Warehouse']['org_en_type_opt'],
                    YML_DATA['Warehouse']['transfer_entity'],
                    YML_DATA['Warehouse']['org_unit'],
                    YML_DATA['Warehouse']['channel'],
                    YML_DATA['Warehouse']['pricing_location'],
                    YML_DATA['Warehouse']['primary_virtual_warehouse'])
end

Given(/^a buyer completes the fields and descriptions for a new WH$/) do

end

When(/^buyer access the virtual wh page$/) do

end

Then(/^the buyer is able to set\-up the virtual WH for the new create physical WH$/) do

end

When(/^a buyer access the Address page for a wh$/) do

end

Then(/^the buyer is able to add Address WH for the new create physical WH$/) do

end