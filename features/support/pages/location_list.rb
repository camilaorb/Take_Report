require 'test-evolve/core/page_object'

module Pages
  def location_list
    @location_list ||= LocationList.new
  end

  class LocationList < TestEvolve::Core::PageObject

    include Pages

    ################################ Objects #############################

    #Path
    element(:tasks_button) { a(:id, 'pt1:eachSidebarItem:2:l1') }
    element(:tasks_foundation_data_link) { a(:text, 'Foundation Data') }
    element(:location_foundation) { span(:text, 'Location Foundation') }
    element(:create_location_list) { a(:text, 'Create Location List') }
    element(:menage_location_list) { a(:text, 'Manage Location List') }

    #Comuns elements
    element(:add_button) { div(:title, 'Add') }
    element(:create_button) { div(:title, 'Create') }
    element(:edit_button) { div(:id, /_ATp:edit/) }
    element(:delete_button) { div(:id, /_ATp:delete/) }
    element(:query_button) { div(:id, /_ATp:_qbeTbr/) }
    element(:ok_button) { div(:text, 'OK') }
    element(:save_and_close_button) { a(:text, /Save and Close/) }
    element(:save_button) { a(:text, 'Save') }
    element(:delete_popup) { div(:text, /delete/) }
    element(:yes_button) { a(:text, 'Yes') }
    element(:no_button) { a(:text, 'No') }
    element(:no_results) { div(:text, 'No data to display.') }
    element(:result_table) { table(:class, 'x14q x15f').tbody.table }
    element(:done_button) { a(:text, 'Done') }
    element(:add_details_button) { a(:text, 'Add Details') }
    element(:search_button) { a(:text, 'Search') }
    element(:loading_list) { div(:class, 'AFAutoSuggestBusyStyle') }
    element(:cancel_button) { a(:text, /Cancel/) }
    element(:more_actions_dropdown) { a(:title, /More Actions/) }
    element(:clear_all_filters) { a(:title, /Clear All/) }
    element(:goto_tab) { |text| a(:text, text) }
    element(:expand_labelbox) { |text| a(:title, text) }

    #Location List search
    element(:location_list_id_field) { text_field(:id, /mR:qryId1:val00::content/) }

    #Location List Head
    element(:location_list_id) { text_field(:id, /mr1:locListId::content/) }
    element(:location_list_name) { text_field(:id, /mr1:it1::content/) }
    element(:location_list_comments) { text_field(:id, /mr1:commentDescBLoclist::content/) }
    element(:location_list_division) { text_field(:id, /mr1:filterOrgIdId::content/) }
    element(:static_checkbox) { checkbox(:id, /mr1:staticIndBLoclist::content/) }
    element(:private_checkbox) { checkbox(:id, /mr1:userSecurityIndBLoclist::content/) }
    element(:batch_rebuild_checkbox) { checkbox(:id, /mr1:batchRebuildIndBLoclist::content/) }

    #More Actions
    element(:location_option) { a(:title, 'Locations') }
    element(:criteria_option) { a(:title, 'Criteria') }
    element(:location_list_rebuild_option) { a(:title, 'Location List Rebuild') }

    # Locations Details
    element(:location_id_filter) { text_field(:id, /_ATp:tbb:_afrFltrMdlc4::content/) }
    element(:location_type_field) { select(:id, /_ATp:soc1::content/) }
    element(:location_type_list) { |text| select(:id, /_ATp:soc1::content/).option(:title, text) }
    element(:location_id_field) { text_field(:id, /_ATp:locationId::content/) }

    # Criteria
    element(:criteria_list) { |text| span(:text, text) }
    element(:logic_op_page_list) { td xpath: "//td[contains(@id,'mR:pc1:_ATp:t1:1:c2')]/following-sibling::td/following-sibling::td/span//select" }
    element(:logic_op_page_option) { |text| td xpath: "//td[contains(@id,'mR:pc1:_ATp:t1:1:c2')]/following-sibling::td/following-sibling::td/span//select/option[text()='#{text}']" }
    element(:open_parenthesis) { text_field(:id, /mR:it7::content/) }
    element(:close_parenthesis) { text_field(:id, /it8::content/) }
    element(:element_field) { select(:id, /mR:soc9::content/) }
    element(:element_list) { |text| select(:id, /mR:soc9::content/).option(:title, text) }
    element(:comparison_field) { select(:id, /mR:soc5::content/) }
    element(:comparison_list) { |text| select(:id, /mR:soc5::content/).option(:title, text) }
    element(:value_text_field) { text_field(:id, /mR:it6::content/) }
    element(:logic_op_popup_field) { select(:id, /mR:soc7::content/) }
    element(:logic_op_popup_list) { |text| select(:id, /mR:soc7::content/).option(:title, text) }
    element(:build_list_button) { div(:id, /mR:pc1:_ATp:cb1/) }
    element(:locations_menu_button) { div(:id, /mR:pc1:_ATp:cb2/) }
    element(:test_sql_button) { div(:id, /mR:pc1:_ATp:cb3/) }

    # Location List Rebuild
    element(:static_popup_checkbox) { checkbox(:id, /mr1:r1:0:sbc3::content/) }
    element(:rebuild_location_list_checkbox) { checkbox(:id, /mr1:r1:0:sbc1::content/) }
    element(:execute_and_close_button) { div(:id, /:mr1:r1:0:cb3/) }


    ############################### Paths ###############################

    def access_create_location_list
      TryWith.attempts(attempts: 5, sleep: 2) do
        tasks_button.wait_until_present.click
        wait_for_db_activity
        tasks_foundation_data_link.click
        wait_for_db_activity
        location_foundation.click
        wait_for_db_activity
        create_location_list.click
        wait_for_db_activity
      end
    end

    def access_menage_location_list
      TryWith.attempts(attempts: 5, sleep: 2) do
        tasks_button.wait_until_present.click unless menage_location_list.present?
        wait_for_db_activity
        tasks_foundation_data_link.click unless menage_location_list.present?
        wait_for_db_activity
        location_foundation.click unless menage_location_list.present?
        wait_for_db_activity
        menage_location_list.click
        wait_for_db_activity
      end
    end

    ############################### Methods ###############################

    def search_location_list(location_list_id)
      location_list_id_field.set location_list_id
      wait_for_db_activity
      search_button.click
      wait_for_db_activity
    end

    def new_location_list_id
      wait_for_db_activity
      location_list_id.wait_until_present
      @new_id = location_list_id.value
    end

    def add_location_list_head(name, division)
      location_list_name.wait_until_present.set name
      wait_for_db_activity
      #location_list_comments.set comments
      # wait_for_db_activity
      location_list_division.set division
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      sleep 3
      wait_for_db_activity
    end

    def add_location_detail(type, location)
      create_button.click
      wait_for_db_activity
      select_list(location_type_list(type), location_type_field, type)
      wait_for_db_activity
      location_id_field.set location
      wait_for_db_activity
      ok_button.click
    end

    def select_location_detail(location_id)
      filter_activity(location_id_filter, location_id)
      wait_for_db_activity
      list = result_table.text
      raise "Location id no #{location_id} not found" unless list.include? location_id.to_s
    end

    def add_criteria(logic, element, comparison, value, logic2 )
      select_list(logic_op_page_option(logic), logic_op_page_list, logic)
      wait_for_db_activity
      add_button.click
      wait_for_db_activity
      open_parenthesis. set '('
      select_list(element_list(element), element_field, element)
      wait_for_db_activity
      select_list(comparison_list(comparison), comparison_field, comparison)
      value_text_field.set value
      close_parenthesis. set ')'
      wait_for_db_activity
      select_list(logic_op_popup_list(logic2), logic_op_popup_field, logic2)
      ok_button.click
    end

    def select_criteria(location_id)
      criteria_list(location_id).click
      wait_for_db_activity
    end















  end
end
