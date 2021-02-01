When(/^buyer create store with mandatory details$/) do
  ## Create ##
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_store_id
  database.disconnect_db
  org_stores.add_store
  org_stores.create_store(
    @new_id,
    YML_DATA['CreateStore']['Store_Name'],
    YML_DATA['CreateStore']['10_Character_Name'],
    YML_DATA['CreateStore']['3_Character_Name'],
    YML_DATA['CreateStore']['Channel'],
    YML_DATA['CreateStore']['Area'],
    YML_DATA['CreateStore']['Transfer_Zone'],
    YML_DATA['CreateStore']['Currency'],
    YML_DATA['CreateStore']['Language'],
    YML_DATA['CreateStore']['Time_Zone'],
    YML_DATA['CreateStore']['VAT_Region'],
    YML_DATA['CreateStore']['Org_Unit'],
    YML_DATA['CreateStore']['Store_Open_Date'],
    YML_DATA['CreateStore']['Start_Order_Days'],
    YML_DATA['CreateStore']['Manager'],
    YML_DATA['ZoningLocations']['Pricing_Store'],
    YML_DATA['ZoningLocations']['CostLocation'],
    YML_DATA['BusinessAddress']['Address'],
    YML_DATA['BusinessAddress']['City'],
    YML_DATA['BusinessAddress']['Country']

  )

end

Then(/^the new Store is add on top of Store table and created RMS DB$/) do
  ##data-base verification##
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_store_create_update @new_id, YML_DATA['CreateStore']['Store_Name']
  database.disconnect_db

  #Independent - Delete##
  org_stores.edit_store @new_id
  org_stores.delete_store
end

When(/^buyer update store with mandatory details$/) do
  super_org_hier.access_existing_store
  ## Update  - Update Store ##
  org_stores.edit_store @new_id
  org_stores.update_store(
    @new_id,
    YML_DATA['UpdateStore']['Store_Name'],
    YML_DATA['CreateStore']['10_Character_Name'],
    YML_DATA['CreateStore']['3_Character_Name'],
    YML_DATA['CreateStore']['Channel'],
    YML_DATA['CreateStore']['Area'],
    YML_DATA['CreateStore']['Transfer_Zone'],
    YML_DATA['CreateStore']['Language'],
    YML_DATA['CreateStore']['Time_Zone'],
    YML_DATA['CreateStore']['VAT_Region'],
    YML_DATA['CreateStore']['Store_Open_Date'],
    YML_DATA['CreateStore']['Start_Order_Days'],
    YML_DATA['CreateStore']['Manager'],
    YML_DATA['ZoningLocations']['Pricing_Store'],
    YML_DATA['ZoningLocations']['CostLocation'],
    YML_DATA['BusinessAddress']['Address'],
    YML_DATA['BusinessAddress']['City'],
    YML_DATA['BusinessAddress']['Country']
  )
end

Then(/^the record is update to the Store table and RMS DB$/) do
   ##data-base verification##
   database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
   database.verify_store_create_update @new_id, YML_DATA['UpdateStore']['Store_Name']
   database.disconnect_db

  #Independent - Delete Store##
  org_stores.edit_store @new_id
  org_stores.delete_store
end

Given(/^buyer completes the setup of a store$/) do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  organizational_hierarchy.open_org_hierarchy
end

When(/^buyer add location trait for the store with mandatory details$/) do
  ## Add Location ##
  org_stores.edit_store YML_DATA['Store_ID']
  org_stores.add_location YML_DATA['LocationTrait']
end

Then(/^the new Location is add on top of Store Location Traits table and created RMS DB$/) do
  ##data-base verification##
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_add_location YML_DATA['Store_ID'].to_i
  database.disconnect_db

  ## Independent  - Delete Location ##
  org_stores.edit_store YML_DATA['Store_ID']
  org_stores.delete_location
end

When(/^buyer delete location trait for the store$/) do
  ## Independent - Add Location ##
  org_stores.edit_store YML_DATA['Store_ID']
  org_stores.add_location YML_DATA['LocationTrait']

  ## Delete Location ##
  org_stores.edit_store YML_DATA['Store_ID']
  org_stores.delete_location
end

Then(/^the record is removed from the Store Location Traits table and RMS DB$/) do
  ##data-base verification##
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_location YML_DATA['Store_ID'].to_i
  database.disconnect_db
end

#Updated Scenario
Then(/^the buyer is able to enter Cost Location ID$/) do
  super_org_hier.access_existing_store

  ##data-base verification##
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_store_create_update @new_id, YML_DATA['CreateStore']['Store_Name']
  database.disconnect_db

  #Independent - Delete##
  org_stores.edit_store @new_id
  org_stores.delete_store
end

When(/^buyer create store with same currency$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_store_id
  @store_name  = YML_DATA['CreateStore']['Store_Name'] + SecureRandom.random_number(100).to_s
  database.disconnect_db
  org_stores.add_store
  org_stores.create_store(
    @new_id,
    @store_name,
    YML_DATA['CreateStore']['10_Character_Name'],
    YML_DATA['CreateStore']['3_Character_Name'],
    YML_DATA['CreateStore']['Channel'],
    YML_DATA['CreateStore']['Area'],
    YML_DATA['CreateStore']['Transfer_Zone'],
    YML_DATA['CreateStore']['Currency'],
    YML_DATA['CreateStore']['Language'],
    YML_DATA['CreateStore']['Time_Zone'],
    YML_DATA['CreateStore']['VAT_Region'],
    YML_DATA['CreateStore']['Org_Unit'],
    YML_DATA['CreateStore']['Store_Open_Date'],
    YML_DATA['CreateStore']['Start_Order_Days'],
    YML_DATA['CreateStore']['Manager'],
    YML_DATA['ZoningLocations']['Pricing_Store_Different_from_currency'],
    YML_DATA['ZoningLocations']['CostLocation'],
    YML_DATA['BusinessAddress']['Address'],
    YML_DATA['BusinessAddress']['City'],
    YML_DATA['BusinessAddress']['Country']
  )
end

Then(/^the new store will be add to each zone group and system create new zone for the pricing loc$/) do
  ##data-base verification##
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_store_create_update @new_id, @store_name
  database.verify_system_not_creates_new_zone @store_name
  database.disconnect_db

  #Independent - Delete##
  org_stores.edit_store @new_id
  org_stores.delete_store
end

When(/^buyer create store with different currency$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_store_id
  @store_name = YML_DATA['CreateStore']['Store_Name'] + SecureRandom.random_number(100).to_s
  database.disconnect_db
  org_stores.add_store
  org_stores.create_store(
    @new_id,
    @store_name,
    YML_DATA['CreateStore']['10_Character_Name'],
    YML_DATA['CreateStore']['3_Character_Name'],
    YML_DATA['CreateStore']['Channel'],
    YML_DATA['CreateStore']['Area'],
    YML_DATA['CreateStore']['Transfer_Zone'],
    YML_DATA['CreateStore']['Currency'],
    YML_DATA['CreateStore']['Language'],
    YML_DATA['CreateStore']['Time_Zone'],
    YML_DATA['CreateStore']['VAT_Region'],
    YML_DATA['CreateStore']['Org_Unit'],
    YML_DATA['CreateStore']['Store_Open_Date'],
    YML_DATA['CreateStore']['Start_Order_Days'],
    YML_DATA['CreateStore']['Manager'],
    YML_DATA['ZoningLocations']['Pricing_Store_Different_from_currency'],
    YML_DATA['ZoningLocations']['CostLocation'],
    YML_DATA['BusinessAddress']['Address'],
    YML_DATA['BusinessAddress']['City'],
    YML_DATA['BusinessAddress']['Country']
  )
end

Then(/^the new store will be add to each zone group and system create new zone with currency of new loc$/) do
  ##data-base verification##
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_store_create_update @new_id, @store_name
  database.verify_system_creates_new_zone @store_name
  database.disconnect_db

  #Independent - Delete##
  org_stores.edit_store @new_id
  org_stores.delete_store
end