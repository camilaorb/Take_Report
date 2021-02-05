
Given("a user access Cost Zone page") do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  cost_zone.access_cost_zones
end

When("the user adds new Cost Zone Group enter Zone Group, Description, Cost Level and Like Group") do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @cost_zone_group_id = database.last_cost_zone_group_id
  database.disconnect_db
  # Create Cost Zone Group
  cost_zone.create_cost_zone_group(@cost_zone_group_id, YML_DATA['CostZoneGroup']['cost_zone_group_description'], YML_DATA['CostZoneGroup']['cost_level'], YML_DATA['CostZoneGroup']['like_group'] )
end

Then("the Cost Zone Group is created") do
  cost_zone.reopen_cost_zones

  #cost_zone.search_cost_zone_group(@cost_zone_id)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_cost_zone_group_create(@cost_zone_group_id, YML_DATA['CostZoneGroup']['cost_zone_group_description'], YML_DATA['CostZoneGroup']['cost_level'])
  database.disconnect_db
  login_page.logout_to_rms
end

Given("a user created a Cost Zone Group") do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  cost_zone.access_cost_zones

  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @cost_zone_group_id = database.existing_cost_zone_group_id
  database.disconnect_db
  #cost_zone.create_cost_zone_group(@cost_zone_id, YML_DATA['CostZoneGroup']['cost_zone_group_description'], YML_DATA['CostZoneGroup']['cost_level'], YML_DATA['CostZoneGroup']['like_group'] )
end

When("a user opts to add a Cost Zone to the Cost Zone Group") do
  # Create a Cost Zone
  @cost_zone_id = (@cost_zone_group_id + 1).to_s
  cost_zone.create_cost_zone(@cost_zone_id, @cost_zone_group_id, YML_DATA['CostZone']['cost_zone_group_description'], YML_DATA['CostZone']['cost_zone_currency'])
end

Then("the Cost Zone is created") do

  #cost_zone.search_cost_zone_group(@cost_zone_id)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_cost_zone(@cost_zone_id, YML_DATA['CostZone']['cost_zone_group_description'], YML_DATA['CostZone']['cost_zone_currency'])
  database.disconnect_db

  login_page.logout_to_rms
end

When("a user opts to remove a Cost Zone") do

end

Then("the record is removed") do

end

Given("a user opts to add a Cost Zone Location for a Cost Zone") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("the user adds Location and Discharge Port for a selected Zone") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the user is able to add the Location to the Cost Zone") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("a user opts to edit a location for a specific Cost Zone") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("the user select or search for a new zone to move the current location to another zone") do
  pending # Write code here that turns the phrase above into concrete actions
end

And("select or search for another Discharge port") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the Cost Zone is update") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("a user opts to delete a Location for a selected Cost Zone") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the user is able to remove the location for a Cost Zone") do
  pending # Write code here that turns the phrase above into concrete actions
end