require 'test-evolve/core/page_object'

module Pages
  def supplier_partner
    @supplier_partner ||= SupplierPartner.new
  end

  class SupplierPartner < TestEvolve::Core::PageObject

    include Pages

    ################################ Objects #############################

    #Path
    element(:tasks_button) { a(:id, 'pt1:eachSidebarItem:2:l1') }
    element(:tasks_foundation_data_link) { a(:text, 'Foundation Data') }
    element(:fd_items_link) { a(:text, 'Item Foundation') }
    element(:fd_supplier_and_partner_link) { a(:text, 'Supplier and Partner Foundatio...') }
    element(:fd_manage_supp_link) { a(:text, 'Manage Suppliers') }
    element(:supplier_search_page) { a(:text, 'Supplier Search') }

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


    #Suppliers
    element(:supplier_id_field) { text_field(:id, /mR:qryId1:val00::content/) }
    element(:supplier_name_field) { text_field(:id, /mR:qryId1:val10::content/) }
    element(:status_dropdown) { select(:id, /mR:qryId1:val40::content/) }
    element(:status_dropdown_chose) { |text| select(:id, /mR:qryId1:val40::content/).option(:title, text) }
    element(:item_text_field) { text_field(:id, /mR:qryId1:val50::content/) }
    element(:order_no_text_field) { text_field(:id, /qryId1:val60::content/) }
    element(:supplier_id_filter) { text_field(:id, /resId1:it4::content/) }

    #Address
    element(:add_existing_button) { a(:text, /Add from Existing/) }
    element(:address_type_field) { select(:id, /_ATp:tiAddressTypeBApply::content/) }
    element(:address_type_list) { |text| select(:id, /_ATp:tiAddressTypeBApply::content/).option(:title, text) }
    element(:address_1_field) { text_field(:id, /_ATp:tiAdd1BApply::content/) }
    element(:city_field) { text_field(:id, /_ATp:tiCityBApply::content/) }
    element(:country_dropdown_field) { text_field(:id, /_ATp:tiCountryIdBApply::content/) }
    element(:state_dropdown_field) { text_field(:id, /_ATp:tiStateBApply::content/) }
    element(:address_type_filter) { text_field(:id, /_afrFltrMdlcl-tiAddrTypeBAddr::content/) }
    element(:city_filter) { text_field(:id, /_afrFltrMdlcl-tiCityBAddr::content/) }
    element(:country_filter) { text_field(:id, /_afrFltrMdlcl-tiCountryIdBAddr::content/) }

    #Supplier Site
    element(:supplier_site_field) { text_field(:id, /:mR:qryId1:val20::content/) }
    element(:supplier_site_name_field) { text_field(:id, /mR:qryId1:val30::content/) }
    element(:supplier_site_id_filter) { text_field(:id, /resId1:it1::content/) }
    #Inventory
    element(:new_information_message) { div(:text, /Do you want to create new information?/) }
    #Replenishment
    element(:expand_replenishment) { a(:title, 'Expand Replenishment') }
    element(:order_control_dropdown) { select(:id, /mR:soc12::content/) }
    element(:order_control_option) { |text| select(:id, /mR:soc12::content/).option(:title, text) }
    element(:review_cycle_dropdown) { select(:id, /mR:soc10::content/) }
    element(:review_cycle_option) { |text| select(:id, /mR:soc10::content/).option(:title, text) }
    element(:single_loc_checkbox) { checkbox(:id, /mR:sbc14::content/) }
    element(:sunday_checkbox) { checkbox(:id, /mR:sbc7::content/) }
    element(:monday_checkbox) { checkbox(:id, /mr1:sbc1::content/) }
    element(:tuesday_checkbox) { checkbox(:id, /mR:sbc2::content/) }
    element(:wednesday_checkbox) { checkbox(:id, /mR:sbc3::content/) }
    element(:thursday_checkbox) { checkbox(:id, /mR:sbc4::content/) }
    element(:friday_checkbox) { checkbox(:id, /mR:sbc5::content/) }
    element(:saturday_checkbox) { checkbox(:id, /mR:sbc6::content/) }
    #Due Order Processing
    element(:due_order_process_checkbox) { checkbox(:id, /mR:sbc11::content/) }
    element(:create_non_due_orders_checkbox) { checkbox(:id, /mR:sbc12::content/) }
    element(:due_order_level_dropdown) { select(:id, /mR:soc11::content/) }
    element(:due_order_level_option) { |text| select(:id, /mR:soc11::content/).option(:title, text) }
    element(:service_basis_dropdown) { select(:id, /mR:soc2::content/) }
    element(:service_basis_option) { |text| select(:id, /mR:soc2::content/).option(:title, text) }
    #Investment Buy
    element(:ib_eligibility_checkbox) { checkbox(:id, /mR:sbc16::content/) }
    element(:ib_order_control_dropdown) { select(:id, /mR:soc8::content/) }
    element(:ib_order_control_option) { |text| select(:id, /mR:soc8::content/).option(:title, text) }
    #Scaling
    element(:scale_orders_constraints_checkbox) { checkbox(:id, /mR:sbc8::content/) }
    element(:multiple_vehicles_checkbox) { checkbox(:id, /mR:sbc13::content/) }
    element(:scaling_objective_dropdown) { select(:id, /mR:soc8::content/) }
    element(:scaling_objective_option) { |text| select(:id, /mR:soc8::content/).option(:title, text) }
    element(:scaling_level_dropdown) { select(:id, /mR:soc8::content/) }
    element(:scaling_level_option) { |text| select(:id, /mR:soc8::content/).option(:title, text) }


    #Partner



    ############################### Paths ###############################

    def open_supplier_and_partner
      TryWith.attempts(attempts: 5, sleep: 2) do
        tasks_button.wait_until_present.click
        wait_for_db_activity
        tasks_foundation_data_link.click
        fd_supplier_and_partner_link.click
        wait_for_db_activity
      end
    end

    def open_supplier
      TryWith.attempts(attempts: 3, sleep: 2) do
        tasks_button.click unless fd_manage_supp_link.present?
      end
      #scroll_to dl_download_link
      fd_manage_supp_link.click
      wait_for_db_activity
    end

    def open_create_partner
      TryWith.attempts(attempts: 3, sleep: 2) do
        tasks_button.click unless fd_manage_supp_link.present?
      end
      #scroll_to dl_download_link
      fd_manage_supp_link.click
      wait_for_db_activity
    end

    def open_manage_partners
      TryWith.attempts(attempts: 3, sleep: 2) do
        tasks_button.click unless fd_manage_supp_link.present?
      end
      #scroll_to dl_download_link
      fd_manage_supp_link.click
      wait_for_db_activity
    end


    ####################### Supplier #######################

    def search_all_suppliers
      search_button.click
      wait_for_db_activity
    end

    def search_supplier(supplier_id)
      supplier_id_field.set supplier_id
      wait_for_db_activity
      search_button.click
      wait_for_db_activity
    end

    def search_supplier_site(supplier_site_id)
      supplier_site_field.set supplier_site_id
      wait_for_db_activity
      search_button.click
      wait_for_db_activity
    end

    def verify_supplier_results(expected_values:)
      if no_results.present?
      else
        @actual_values = result_table.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end

    def select_supplier(supplier_id)
      filter_activity(supplier_id_filter, supplier_id)
      wait_for_db_activity
      list = result_table.text
      raise "Supplier id no #{new_id} not found" unless list.include? supplier_id.to_s
    end

    def select_supplier_site(supplier_site_id)
      filter_activity(supplier_site_id_filter, supplier_site_id)
      wait_for_db_activity
      list = result_table.text
      raise "Supplier Site id no #{supplier_site_id} not found" unless list.include? supplier_site_id.to_s
    end

    def access_supplier
      edit_button.click
      wait_for_db_activity
    end

    def close_supplier
      TryWith.attempts(attempts: 10, sleep: 2) do
        supplier_search_page.click
        wait_for_db_activity
        done_button.click
        wait_for_db_activity
      end
    end

    ####################### Address #######################

    def create_address(type, address_1, city, country, state)
      add_button.click
      wait_for_db_activity
      select_list(address_type_list(type), address_type_field, type)
      address_1_field.set address_1
      city_field.set city

      TryWith.attempts(attempts: 3, sleep: 1) do
        country_dropdown_field.set country
        wait_until_enabled(loading_list)
        wait_for_db_activity
        send_keys :enter
        wait_for_db_activity
        sleep 3
        raise 'Country is blank' if country_dropdown_field.blank?
      end

      TryWith.attempts(attempts: 3, sleep: 1) do
        state_dropdown_field.set state
        wait_until_enabled(loading_list)
        wait_for_db_activity
        send_keys :enter
        wait_for_db_activity
        sleep 3
        raise 'State is blank' if state_dropdown_field.blank?
      end

      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def edit_address(address_1, city, country, state)
      edit_button.click
      wait_for_db_activity
      address_1_field.set address_1
      city_field.set city
      country_dropdown_field.set country
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      sleep 3
      state_dropdown_field.set state
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
      clear_all_filters.click
      wait_for_db_activity
    end

    def add_existing_address(type)
      add_existing_button.click
      wait_for_db_activity
      select_list(address_type_list(type), address_type_field, type)
      ok_button.click
      wait_for_db_activity
    end

    def delete_address
      delete_button.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
    end

    def select_address(address_type, country)
      filter_activity(address_type_filter, address_type)
      #filter_activity(city_filter, city)
      scroll_to country_filter
      filter_activity(country_filter, country)
      wait_for_db_activity
      list = result_table.text
      raise "Address not found" if list.nil?
    end

    def verify_address_results(expected_values:)
      if no_results.present?
      else
        @actual_values = result_table.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end

    ####################### Supplier Site #######################

    ######### Inventory Management #########

    def create_inventory
      yes_button.click if new_information_message.present?
      wait_for_db_activity
    end

    def replenishment
      expand_replenishment.click if expand_replenishment.present?
      select_list(address_type_list(type), address_type_field, type)
      wait_for_db_activity
    end








  end
end

