#org_hierarchy#
# create
Given(/^buyer is on the organizations hierarchy screen$/) do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  organizational_hierarchy.open_org_hierarchy
end

When(/^buyer create division where division and name are mandatory$/) do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_div = database.last_division_id
  database.disconnect_db

  #Create
  organizational_hierarchy.add_division
  organizational_hierarchy.create_division(@new_div, ['division_create'],
                                           ['division_manager'], ['division_currency'])
end

Then(/^the new Division is add on top of Division table and created RMS DB$/) do
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_division_create(@new_div, ['division_create'])
  database.disconnect_db

  #independency
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_division(@new_div)
  login_page.logout_to_rms
end

When(/^buyer update where division name are mandatory$/) do
  #Independent
  @new_div = super_org_hier.access_existing_division

  #Update
  organizational_hierarchy.edit_division(@new_div)
  organizational_hierarchy.update_division(YML_DATA['Division']['division_edit'],
                                           YML_DATA['Division']['division_manager'], YML_DATA['Division']['division_currency'])
end

Then(/^the record is update to the Division table and RMS DB/) do
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_division_edit(@new_div, YML_DATA['Division']['division_edit'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_division(@new_div)
  login_page.logout_to_rms
end

When(/^a buyer delete a Division$/) do
  #Independent
  @new_div = super_org_hier.access_existing_division

  #Delete
  organizational_hierarchy.delete_division(@new_div)
end

Then(/^the record is removed from the Division table and RMS DB$/) do
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_division_delete(@new_div, YML_DATA['Division']['division_create'])
  database.disconnect_db
  login_page.logout_to_rms

end

When(/^buyer create country where country id and country name are mandatory$/) do
  #Create
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_country = database.last_country_id

  organizational_hierarchy.add_country
  organizational_hierarchy.createCountry(@new_country, YML_DATA['Country']['country_create'],
                                         YML_DATA['Country']['country_manager'], YML_DATA['Country']['country_currency'], YML_DATA['Country']['country_division'])
  database.disconnect_db
end

Then(/^the new Country is add on top of Country table and created RMS DB$/) do
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_country_create(@new_country,YML_DATA['Country']['country_create'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_country @new_country

  login_page.logout_to_rms
end


When(/^buyer update country where country name are mandatory$/)do
  @new_country = super_org_hier.access_existing_country
  #Update
  organizational_hierarchy.edit_country @new_country
  organizational_hierarchy.update_country(YML_DATA['Country']['country_edit'],YML_DATA['Country']['country_manager'],
                                          YML_DATA['Country']['country_currency'], YML_DATA['Country']['country_division'])
end

Then(/^the record is update to the Country table and RMS DB$/) do
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_country_edit(@new_country, YML_DATA['Country']['country_edit'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_country @new_country

  login_page.logout_to_rms
end


When(/^a buyer delete a Country$/) do
  @new_country = super_org_hier.access_existing_country
  #Delete
  organizational_hierarchy.delete_country @new_country
end

Then(/^the record is removed country record from the Country table and RMS DB$/) do
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_country_delete(@new_country, YML_DATA['Country']['country_create'])
  database.disconnect_db
  login_page.logout_to_rms
end

When(/^buyer create region where region and name are mandatory$/)do
  #Create
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_region = database.last_region_id
  database.disconnect_db

  organizational_hierarchy.add_region
  organizational_hierarchy.create_region(@new_region, YML_DATA['Region']['region_create'],
                                         YML_DATA['Region']['region_manager'], YML_DATA['Region']['region_currency'], YML_DATA['Region']['region_division'])
end

Then(/^the new Region is add on top of Region table and created RMS$/) do
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_region_create(@new_region, YML_DATA['Region']['region_create'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_region @new_region

  login_page.logout_to_rms
end


When(/^buyer update region where region name are mandatory$/) do
  @new_region = super_org_hier.access_existing_region
  #Edit
  organizational_hierarchy.edit_region(@new_region)
  organizational_hierarchy.update_region(YML_DATA['Region']['region_edit'],
                                         YML_DATA['Region']['region_manager'], YML_DATA['Region']['region_currency'], YML_DATA['Region']['region_country'])
end

Then(/^the record is update to the Region table and RMS DB$/) do
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_region_edit(@new_region, YML_DATA['Region']['region_edit'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.delete_region(@new_region)

  login_page.logout_to_rms
end

When(/^a buyer delete a Region$/) do
  @new_region = super_org_hier.access_existing_region
  #Delete
  organizational_hierarchy.delete_region(@new_region)
end

Then(/^the record is removed from the Region table and RMS DB$/) do
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_region_delete(@new_region)
  database.disconnect_db

  login_page.logout_to_rms
end


When(/^buyer create area where area and name are mandatory$/) do
  #Create
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_area = database.last_area_id
  database.disconnect_db
  organizational_hierarchy.add_area
  organizational_hierarchy.createArea(@new_area, YML_DATA['Area']['area_create'],
                                      YML_DATA['Area']['area_manager'], YML_DATA['Area']['area_currency'], YML_DATA['Area']['area_region'])
  organizational_hierarchy.from_org_hierarchy
end

Then(/^the new Area is add on top of Area table and created RMS$/) do
#Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_area_create(@new_area,YML_DATA['Area']['area_create'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.delete_area @new_area
  login_page.logout_to_rms
end

When(/^buyer update where Area name are mandatory$/)do
  @new_area = super_org_hier.access_existing_area
  #Edit
  organizational_hierarchy.editArea(@new_area)
  organizational_hierarchy.updateArea(YML_DATA['Area']['area_edit'],
                                      YML_DATA['Area']['area_manager'], YML_DATA['Area']['area_currency'], YML_DATA['Area']['area_region'])
end

Then(/^the record is update to the Area table and RMS DB$/) do
 #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_area_edit(@new_area, YML_DATA['Area']['area_edit'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_area @new_area

  login_page.logout_to_rms
end

When(/^a buyer delete a Area$/) do
  @new_area = super_org_hier.access_existing_area
  #Delete
  organizational_hierarchy.delete_region(@new_area)
end

Then(/^the record is removed from the Area table and RMS DB$/) do
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_region_delete(@new_area)
  database.disconnect_db

  login_page.logout_to_rms
end