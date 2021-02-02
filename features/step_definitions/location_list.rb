
Given("a buyer accesses Create Location Lists page") do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  location_list.access_create_location_list
end

When("the buyer enters the description, comments and region for the list") do
  @location_list_id = location_list.new_location_list_id
  location_list.add_location_list_head('Test Location list', YML_DATA['division_chain'])
end

Then("the buyer can either opt to save the interim details or select more actions and add locations") do
  shared.more_actions_select(YML_DATA['location_option'])
  location_list.add_location_detail(YML_DATA['location_type_1'], YML_DATA['Store_ID'])
  shared.save_and_close
  shared.save_and_close
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_location_head_table(@location_list_id, 'Test Location list', 'Test comments', YML_DATA['division_chain'], YML_DATA['dinamic'])
  database.verify_location_details_table(@location_list_id, YML_DATA['Store_ID'], YML_DATA['db_location_type_1'])
  database.disconnect_db
  location_list.access_menage_location_list
  location_list.search_location_list(@location_list_id)
  shared.access_edit_page
  shared.delete_item
  shared.done
  login_page.logout_to_rms
end

Given("a buyer completes the Location Lists page") do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  location_list.access_create_location_list
  @location_list_id = location_list.new_location_list_id
  location_list.add_location_list_head('Test Location list', 'Test comments', YML_DATA['division_chain'])
end

When("the Buyer accesses Locations page") do
  shared.more_actions_select(YML_DATA['location_option'])
end

Then("the buyer can add the details of the Location") do
  shared.more_actions_select(YML_DATA['location_option'])
  location_list.add_location_detail(YML_DATA['location_type_1'], YML_DATA['Store_ID'])
  shared.save_and_close
  shared.save_and_close
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_location_head_table(@location_list_id, 'Test Location list', 'Test comments', YML_DATA['division_chain'], YML_DATA['dinamic'])
  database.verify_location_details_table(@location_list_id, YML_DATA['Store_ID'], YML_DATA['db_location_type_1'])
  database.disconnect_db
  location_list.access_menage_location_list
  location_list.search_location_list(@location_list_id)
  shared.access_edit_page
  shared.delete_item
  shared.done
  login_page.logout_to_rms
end

Given("a buyer have added a location to the list") do
  visit(TE.environment['rms_url'])
  login_page.login_to_rms(TE.environment['rms_user'], TE.environment['rms_pw'])
  super_loc_list.add_location_list_with_location
end

When("the buyer opts to delete the Location from the List") do
  location_list.access_create_location_list
  shared.more_actions_select(YML_DATA['location_option'])
  select_location_detail(YML_DATA['Store_ID'])
  shared.delete_item
  shared.save_and_close
  shared.save_and_close

end

Then("the buyer can remove the location") do
  location_list.access_menage_location_list
  location_list.search_location_list(@location_list_id)
  shared.access_edit_page
  shared.more_actions_select(YML_DATA['location_option'])

  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
  database.verify_delete_location_details_table(@location_list_id, 'Test Location list', 'Test comments', YML_DATA['division_chain'], YML_DATA['dynamic'])
  database.disconnect_db
  shared.delete_item
  shared.done
  login_page.logout_to_rms
end

Given("accesses the Add Criteria page") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("completes the required details on the page") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the buyer can test the SQL to verify that the criteria is valid") do
  pending # Write code here that turns the phrase above into concrete actions
end

And("build the list by selecting the Build List button") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("the buyer is able to commit amendments to the Location List") do
  pending # Write code here that turns the phrase above into concrete actions
end

And("test the amendments by test the SQL") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the buyer is able to rebuild the list") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("buyer selects a record in the Location List Criteria page") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("the buyer opts to Delete a Location List Criteria") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("a confirmation message is displayed prior to deletion") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("a buyer selects a record in the location list criteria page") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("the buyer opts to Rebuild the Location List") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the buyer is able to rebuild the list") do
  pending # Write code here that turns the phrase above into concrete actions
end
