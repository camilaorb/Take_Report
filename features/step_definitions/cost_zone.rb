
Given("a user access Cost Zone page") do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  cost_zone.access_cost_zones
end

When("the user adds new Cost Zone Group enter Zone Group, Description, Cost Level and Like Group") do
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @cost_zone_id = database.new_cost_zone_id
  database.disconnect_db
  cost_zone.add_cost-zone_group(@cost_zone_id, 'Test Cost Zone', YML_DATA['cost_level2'])
end

Then("the Cost Zone Group is created") do
  cost_zone.reopen_cost_zones
  cost_zone.search_cost_zone_group(@cost_zone_id)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.cost_zone_group(@location_list_id, 'Test Location list', 'Test comments', YML_DATA['division_chain'], YML_DATA['dinamic'])
  database.disconnect_db
  cost_zone.delete_cost_zone_group
  shared.save_and_close
  login_page.logout_to_rms
end

Given("a user created a Cost Zone Group") do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  location_list.access_cost_zones
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  @cost_zone_id = database.new_cost_zone_id
  database.disconnect_db
  cost_zone.add_cost-zone_group(@cost_zone_id, 'Test Cost Zone', YML_DATA['cost_level2'])
end

When("a user opts to add a Cost Zone to the Cost Zone Group") do

end

Then("the Cost Zone is created") do

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