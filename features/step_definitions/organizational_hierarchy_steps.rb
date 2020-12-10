#org_hierarchy#
# create
Given(/^buyer is on the organizations hierarchy screen$/) do
  visit(TE.environment['url'])
  login_page.login_to_rms(TE.environment['user'], TE.environment['pw'])
  organizational_hierarchy.open_org_hierarchy
end

When(/^buyer create division where division and name are mandatory$/) do

end

Then(/^the new Division is add on top of Division table and created RMS DB$/) do

  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_division_id

  #Create
  organizational_hierarchy.add_division
  organizational_hierarchy.create_division(@new_id, YML_DATA['Division']['division_create'],
                                           YML_DATA['Division']['division_manager'], YML_DATA['Division']['division_currency'])

  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_division_create(@new_id, YML_DATA['Division']['division_create'])
  database.disconnect_db

  #independency
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_division(@new_id)
  login_page.logout_to_rms

end

When(/^buyer update where division name are mandatory$/) do

end

Then(/^the record is update to the Division table and RMS DB/) do

  #Independent
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_division_id

  organizational_hierarchy.add_division
  organizational_hierarchy.create_division(@new_id, YML_DATA['Division']['division_create'],
                                           YML_DATA['Division']['division_manager'], YML_DATA['Division']['division_currency'])

  organizational_hierarchy.from_org_hierarchy

  #Update
  organizational_hierarchy.edit_division(@new_id)
  organizational_hierarchy.update_division(YML_DATA['Division']['division_edit'],
                                           YML_DATA['Division']['division_manager'], YML_DATA['Division']['division_currency'])

  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_division_edit(@new_id, YML_DATA['Division']['division_edit'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_division(@new_id)
  login_page.logout_to_rms

end

When(/^a buyer delete a the Division$/) do

end

Then(/^the record is removed from the Division table and RMS DB$/) do

  #Independent
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_division_id

  organizational_hierarchy.add_division
  organizational_hierarchy.create_division(@new_id, YML_DATA['Division']['division_create'],
                                           YML_DATA['Division']['division_manager'], YML_DATA['Division']['division_currency'])

  organizational_hierarchy.from_org_hierarchy


  #Delete
  organizational_hierarchy.delete_division(@new_id)

  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_division_delete(@new_id, YML_DATA['Division']['division_create'])
  database.disconnect_db
  login_page.logout_to_rms

end

When(/^buyer create country where country id and country name are mandatory$/) do

end

Then(/^the new Country is add on top of Country table and created RMS DB$/) do

  #Create
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_country_id

  organizational_hierarchy.add_country
  organizational_hierarchy.createCountry(@new_id, YML_DATA['Country']['country_create'],
                                         YML_DATA['Country']['country_manager'], YML_DATA['Country']['country_currency'], YML_DATA['Country']['country_division'])
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_country_create(@new_id,YML_DATA['Country']['country_create'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_country @new_id

  login_page.logout_to_rms
end


When(/^buyer clicks on the Country link$/) do

end

When(/^buyer update country  where country name are mandatory$/)do

end

Then(/^the record is update to the Country table and RMS DB$/) do
  #Independent
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_country_id

  organizational_hierarchy.add_country
  organizational_hierarchy.createCountry(@new_id, YML_DATA['Country']['country_create'],
                                         YML_DATA['Country']['country_manager'], YML_DATA['Country']['country_currency'], YML_DATA['Country']['country_division'])

  organizational_hierarchy.from_org_hierarchy

  #Update
  organizational_hierarchy.edit_country @new_id
  organizational_hierarchy.update_country(YML_DATA['Country']['country_edit'],YML_DATA['Country']['country_manager'],
                                          YML_DATA['Country']['country_currency'], YML_DATA['Country']['country_division'])

  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_country_edit(@new_id, YML_DATA['Country']['country_edit'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_country @new_id

  login_page.logout_to_rms
end


When(/^a buyer delete a the Country$/) do

end

Then(/^the record is removed country record from the Country table and RMS DB$/) do
  #Independent
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_country_id

  organizational_hierarchy.add_country
  organizational_hierarchy.createCountry(@new_id, YML_DATA['Country']['country_create'],
                                         YML_DATA['Country']['country_manager'], YML_DATA['Country']['country_currency'], YML_DATA['Country']['country_division'])

  organizational_hierarchy.from_org_hierarchy

  #Delete
  organizational_hierarchy.delete_country @new_id

  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_country_delete(@new_id, YML_DATA['Country']['country_create'])
  database.disconnect_db
  login_page.logout_to_rms
end

When(/^buyer create region where region and name are mandatory$/)do

end

Then(/^the new Region is add on top of Region table and created RMS$/) do

  #Create
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_region_id

  organizational_hierarchy.add_region
  organizational_hierarchy.create_region(@new_id, YML_DATA['Region']['region_create'],
                                         YML_DATA['Region']['region_manager'], YML_DATA['Region']['region_currency'], YML_DATA['Region']['region_division'])
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_region_create(@new_id,YML_DATA['Region']['region_create'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_region @new_id

  login_page.logout_to_rms

end


When(/^buyer update region where region name are mandatory$/) do

end

Then(/^the record is update to the Region table and RMS DB$/) do

  #Independent
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_region_id

  organizational_hierarchy.add_region
  organizational_hierarchy.create_region(@new_id, YML_DATA['Region']['region_create'],
                                         YML_DATA['Region']['region_manager'], YML_DATA['Region']['region_currency'], YML_DATA['Region']['region_country'])
  organizational_hierarchy.from_org_hierarchy

  #Edit
  organizational_hierarchy.edit_region(@new_id)
  organizational_hierarchy.update_region(YML_DATA['Region']['region_edit'],
                                         YML_DATA['Region']['region_manager'], YML_DATA['Region']['region_currency'], YML_DATA['Region']['region_country'])
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_region_edit(@new_id, YML_DATA['Region']['region_edit'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_region(@new_id)

  login_page.logout_to_rms
end

When(/^a buyer delete a the Region$/) do

end

Then(/^the record is removed from the Region table and RMS DB$/) do
  #Independent
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_region_id

  organizational_hierarchy.add_region
  organizational_hierarchy.create_region(@new_id, YML_DATA['Region']['region_create'],
                                         YML_DATA['Region']['region_manager'], YML_DATA['Region']['region_currency'], YML_DATA['Region']['region_country'])
  organizational_hierarchy.from_org_hierarchy

  #Delete
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_region(@new_id)

  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_region_delete(@new_id)
  database.disconnect_db

  login_page.logout_to_rms
end


When(/^buyer create area where area and name are mandatory$/) do

end

Then(/^the new Area is add on top of Area table and created RMS$/) do

  #Create
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_area_id

  organizational_hierarchy.add_area
  organizational_hierarchy.createArea(@new_id, YML_DATA['Area']['area_create'],
                                      YML_DATA['Area']['area_manager'], YML_DATA['Area']['area_currency'], YML_DATA['Area']['area_region'])
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_area_create(@new_id,YML_DATA['Area']['area_create'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_area @new_id

  login_page.logout_to_rms
end

When(/^buyer update where Area name are mandatory$/)do

end

Then(/^the record is update to the Area table and RMS DB$/) do

  #Independent
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @new_id = database.last_area_id

  organizational_hierarchy.add_area
  organizational_hierarchy.createArea(@new_id, YML_DATA['Area']['area_create'],
                                      YML_DATA['Area']['area_manager'], YML_DATA['Area']['area_currency'], YML_DATA['Area']['area_region'])
  organizational_hierarchy.from_org_hierarchy

  #Edit
  organizational_hierarchy.editArea(@new_id)
  organizational_hierarchy.updateArea(YML_DATA['Area']['area_edit'],
                                      YML_DATA['Area']['area_manager'], YML_DATA['Area']['area_currency'], YML_DATA['Area']['area_region'])
  #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_area_edit(@new_id, YML_DATA['Area']['area_edit'])
  database.disconnect_db

  #Independent
  organizational_hierarchy.from_org_hierarchy
  organizational_hierarchy.delete_area @new_id

  login_page.logout_to_rms
end


And(/^selects the District button$/) do

end

When(/^buyer clicks on the District link against the District that is marked for deletionAND opts for Action > Delete$/) do

end

Then(/^the buyer is able to remove the District$/) do |table|
  @area_data = table.hashes.first
  organizational_hierarchy.delete_area(@area_data)

  # #Data-Base Verification
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_area_delete(@area_data[:area])
  database.disconnect_db
  login_page.logout_to_rms
end

And(/^selects the District button or selects the District Create icon on the Region page$/) do

end

Then(/^the buyer is able to enter details for the District$/) do

end

When(/^buyer clicks on the District linkAND opts Action > Edit$/) do

end

Then(/^the buyer is able to amend and update details for the District$/) do

end
