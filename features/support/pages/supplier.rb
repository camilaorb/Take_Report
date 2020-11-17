require 'test-evolve/core/page_object'

module Pages
  def supplier
    @supplier ||= Supplier.new
  end

  class Supplier < TestEvolve::Core::PageObject

    ################################ Objects #############################

    #Path
    element(:tasks_button) { a(:id, 'pt1:eachSidebarItem:2:l1') }
    element(:tasks_foundation_data_link) { a(:text, 'Foundation Data') }
    element(:fd_items_link) { a(:text, 'Item Foundation') }
    element(:fd_supplier_and_partner_link) { a(:text, 'Supplier and Partner Foundatio...') }
    element(:fd_manage_supp_link) { a(:text, 'Manage Suppliers') }
    element(:supplier_search_page) { a(:text, 'Supplier Search') }

    #Comuns buttons
    element(:add_button) { div(:title, 'Add') }
    element(:create_button) { div(:title, 'Create') }
    element(:edit_button) { div(:id, /_ATp:edit/) }
    element(:delete_button) { a(:title, 'Delete') }
    element(:query_button) { div(:id, /_ATp:_qbeTbr/) }
    element(:ok_button) { div(:text, 'OK') }
    element(:save_and_close_button) { a(:text, 'Save and Close') }
    element(:save_button) { a(:text, 'Save') }
    element(:delete_popup) { div(:text, /delete/) }
    element(:yes_button) { a(:text, 'Yes') }
    element(:no_button) { a(:text, 'No') }
    element(:no_results) { div(:text, 'No data to display.') }
    element(:supplier_result_list) { div(:id, /mR:at1:_ATp:resId1::db/) }
    element(:done_button) { a(:text, 'Done') }
    element(:add_details_button) { a(:text, 'Add Details') }
    element(:search_button) { a(:text, 'Search') }
    element(:loading_list) { div(:class, 'AFAutoSuggestBusyStyle') }
    element(:cancel_button) { a(:text, 'Cancel') }

    #Suppliers
    element(:supplier_id_field) { text_field(:id, /mR:qryId1:val00::content/) }
    element(:supplier_name_field) { text_field(:id, /mR:qryId1:val10::content/) }
    element(:supplier_site_field) { text_field(:id, /:mR:qryId1:val20::content/) }
    element(:supplier_site_name_field) { text_field(:id, /mR:qryId1:val30::content/) }
    element(:status_dropdown) { select(:id, /mR:qryId1:val40::content/) }
    element(:status_dropdown_chose) { |text| select(:id, /mR:qryId1:val40::content/).option(:title, text) }
    element(:item_text_field) { text_field(:id, /mR:qryId1:val50::content/) }
    element(:order_no_text_field) { text_field(:id, /qryId1:val60::content/) }
    element(:supplier_id_filter) { text_field(:id, /resId1:it4::content/) }
    element(:supplier_site_id_filter) { text_field(:id, /resId1:it1::content/) }
    element(:more_actions_dropdown) { a(:title, 'More Actions') }
    element(:addredd_option) { tr(:title, 'Address') }

    #Address
    element(:add_existing_button) { a(:title, 'Add from Existing') }
    element(:address_type_field) { select(:id, /_ATp:tiAddressTypeBApply::content/) }
    element(:address_type_list) { |text| select(:id, /_ATp:tiAddressTypeBApply::content/).option(:title, text) }
    element(:address_1_field) { text_field(:id, /_ATp:tiAdd1BApply::content/) }
    element(:city_field) { text_field(:id, /_ATp:tiCityBApply::content/) }
    element(:country_dropdown_field) { text_field(:id, /_ATp:tiCountryIdBApply::content/) }
    element(:state_dropdown_field) { text_field(:id, /_ATp:tiStateBApply::content/) }

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


    ################################################ Supplier #######################################################

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
        @actual_values = supplier_result_list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end

    def select_supplier(supplier_id)
      query_button.wait_until_present
      query_button.click unless supplier_id_filter.present?
      wait_for_db_activity
      supplier_id_filter.set supplier_id
      supplier_id_filter.click
      send_keys :enter
      wait_for_db_activity
      list = supplier_result_list.text
      raise "Supplier id no #{new_id} not found" unless list.include? supplier_id.to_s
    end

    def select_supplier_site(supplier_site_id)
      query_button.wait_until_present
      query_button.click unless supplier_site_id_filter.present?
      wait_for_db_activity
      supplier_site_id_filter.set supplier_site_id
      supplier_site_id_filter.click
      send_keys :enter
      wait_for_db_activity
      list = supplier_result_list.text
      raise "Supplier Site id no #{new_id} not found" unless list.include? supplier_site_id.to_s
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

    def access_address
      wait_for_db_activity
      more_actions_dropdown.wait_until_present.click
      wait_for_db_activity
      addredd_option.wait_until_present.click
      wait_for_db_activity
    end

    def create_address(type, address_1, city, country, state)
      add_button.click
      wait_for_db_activity
      select_list(address_type_list(type), address_type_field, type)
      address_1_field.set address_1
      #adress_2_field.set adress_2
      #adress_3_field.set adress_3
      #name_field.set name
      #phone_field.set phone
      #fax_field.set fax
      #fax_field.set fax
      #pager_field.set pager
      #email_field.set email
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

      #postal_code_field.scroll.to
      #wait_for_db_activity
      #postal_code_fieldd.set postal_code
      #primary_address_check
      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def edit_address(address_1, city, country, state)
      edit_button.click
      wait_for_db_activity
      address_1_field.set address_1
      #adress_2_field.set adress_2
      #adress_3_field.set adress_3
      #name_field.set name
      #phone_field.set phone
      #fax_field.set fax
      #fax_field.set fax
      #pager_field.set pager
      #email_field.set email
      city_field.set city
      country_dropdown_field.set country
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      state_dropdown_field.set state
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      #postal_code_field.scroll.to
      #wait_for_db_activity
      #postal_code_fieldd.set postal_code
      #primary_address_check
      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def add_existing_address(type)
      add_existing_button.click
      wait_for_db_activity
      select_list(address_type_list(type), address_type_field, type)
      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def select_address(supplier_id)
      query_button.wait_until_present
      query_button.click unless supplier_id_filter.present?
      wait_for_db_activity
      supplier_id_filter.set supplier_id
      supplier_id_filter.click
      send_keys :enter
      wait_for_db_activity
      list = supplier_result_list.text
      raise "Supplier id no #{new_id} not found" unless list.include? supplier_id.to_s
    end

    def verify_address_results(expected_values:)
      if no_results.present?
      else
        @actual_values = supplier_result_list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end







  end
end


