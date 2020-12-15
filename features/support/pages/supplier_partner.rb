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
    element(:fd_manage_partners_link) { a(:text, 'Manage Partners') }
    element(:fd_create_partners_link) { a(:text, 'Create Partner') }

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



    #Suppliers
    element(:supplier_id_field) { text_field(:id, /mR:qryId1:val00::content/) }
    element(:supplier_name_field) { text_field(:id, /mR:qryId1:val10::content/) }
    element(:status_dropdown) { select(:id, /mR:qryId1:val40::content/) }
    element(:status_dropdown_chose) { |text| select(:id, /mR:qryId1:val40::content/).option(:title, text) }
    element(:item_text_field) { text_field(:id, /mR:qryId1:val50::content/) }
    element(:order_no_text_field) { text_field(:id, /qryId1:val60::content/) }
    element(:supplier_id_filter) { text_field(:id, /resId1:it4::content/) }

    #Address
    element(:add_existing_button) { img(:id, /_ATp:duplicate::icon/) }
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

    #Supplier Trait
    element(:supplier_traits_field) { text_field(:id, /_ATp:supTraitId::content/) }

    #Import / Beneficiary Attributes
    element(:ia_partner_1_dropdown) { select(:id, /mR:soc1::content/) }
    element(:ia_partner_1_option) { |text| select(:id, /mR:soc1::content/).option(:title, text) }
    element(:ia_partner_1_field) { text_field(:id, /mR:partner11Id::content/) }
    element(:beneficiary_checkbox) { checkbox(:id, /mR:sbc2::content/) }
    element(:place_of_expiry) { text_field(:id, /mR:placeOfExpiry2Id::content/) }
    element(:presentation_terms_dropdown) { select(:id, /mR:soc6::content/) }
    element(:presentation_terms_option) { |text| select(:id, /mR:soc6::content/).option(:title, text) }
    element(:variance_percent) { text_field(:id, /mR:it1::content/) }



    #Partner
    element(:partner_type_field) { select(:id, /soc1::content/) }
    element(:partner_type_list) { |text| select(:id, /soc1::content/).option(:title, text) }
    element(:partner_id_field) { text_field(:id, /mr1:partnerIdBPartner::content/) }
    element(:partner_name_field) { text_field(:id, /mr1:it4::content/) }
    element(:part_currency) { text_field(:id, /mr1:iclov3::content/) }
    element(:partner_status_field) { select(:id, /:mr1:soc4::content/) }
    element(:partner_status_list) { |text| select(:id, /:mr1:soc4::content/).option(:title, text) }
    element(:partner_terms) { text_field(:id, /mr1:iclov4::content/) }
    element(:contact_name) { text_field(:id, /mr1:it6::content/) }
    element(:contact_phone) { text_field(:id, /mr1:it7::content/) }

    #Invoincing Attribute
    element(:receive_invoice_field) { select(:id, /mr1:soc2::content/) }
    element(:receive_invoice_list) { |text| select(:id, /mr1:soc2::content/).option(:title, text) }
    element(:pay_invoice_field) { select(:id, /mr1:soc1::content/) }
    element(:pay_invoice_list) { |text| select(:id, /mr1:soc1::content/).option(:title, text) }



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

    def search_all_results
      search_button.click
      wait_for_db_activity
    end

    ####################### Supplier #######################


    def open_supplier
      TryWith.attempts(attempts: 3, sleep: 2) do
        tasks_button.click unless fd_manage_supp_link.present?
      end
      #scroll_to dl_download_link
      fd_manage_supp_link.click
      wait_for_db_activity
    end

    def search_supplier(supplier_id)
      supplier_id_field.set supplier_id
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

    def access_edit_page
      edit_button.click
      wait_for_db_activity
    end

    def close_supplier
      TryWith.attempts(attempts: 10, sleep: 2) do
        supplier_search_page.click
        wait_for_db_activity
        done_button.click
        wait_for_db_activity
        goto_tab('Addresses')
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

    def delete_primary_address
      delete_button.click
      raise "Address can be delete" if delete_popup.present?
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

    def search_supplier_site(supplier_site_id)
      supplier_site_field.set supplier_site_id
      wait_for_db_activity
      search_button.click
      wait_for_db_activity
    end

    def select_supplier_site(supplier_site_id)
      filter_activity(supplier_site_id_filter, supplier_site_id)
      wait_for_db_activity
      list = result_table.text
      raise "Supplier Site id no #{supplier_site_id} not found" unless list.include? supplier_site_id.to_s
    end

    ######### Inventory Management #########

    def create_inventory
      yes_button.click if new_information_message.present?
      wait_for_db_activity
    end

    def replenishment(order, cicle)
      expand_labelbox('Replenishment').click unless order_control_dropdown.present?
      select_list(order_control_option(order), order_control_dropdown, order)
      wait_for_db_activity
      select_list(review_cycle_option(cicle), review_cycle_dropdown, cicle)
      wait_for_db_activity
    end

    def due_order_processing
      expand_labelbox('Due Order Processing').click unless due_order_process_checkbox.present?
      due_order_process_checkbox.click
      wait_for_db_activity
    end

    def investment_buy(order)
      expand_labelbox('Investment Buy').click unless ib_eligibility_checkbox.present?
      ib_eligibility_checkbox.click
      select_list(ib_order_control_option(order), ib_order_control_dropdown, order)
      wait_for_db_activity
    end

    def scaling
      expand_labelbox('Scaling').click unless scale_orders_constraints_checkbox.present?
      scale_orders_constraints_checkbox.click
    end

    def rounding
      #expand_labelbox('Rounding').click unless ordem_control_field.present?
    end

    def supplier_minimums
      #expand_labelbox('Supplier Minimums').click unless ordem_control_field.present?
    end

    def truck_splitting
      #expand_labelbox('Truck Splitting').click unless ordem_control_field.present?
    end

    def bracket_constraints
      #expand_labelbox('Bracket Constraints').click unless ordem_control_field.present?
    end

    def other_attributes
      #expand_labelbox('Other Attributes').click unless ordem_control_field.present?
    end

    ######### Org Unit #########

    def view_org_unit(expected_values)
      if no_results.present?
        raise "No results"
      else
        @actual_values = result_table.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end

    def add_org_unit(org_unit)
      add_button.click
      wait_for_db_activity
      org_unit_field.set org_unit
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      sleep 3
      ok_button.click
    end

    ######### Supplier Traits #########

    def add_supplier_traits(supp_traits)
      add_button.click
      wait_for_db_activity
      supplier_traits_field.set supp_traits
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      sleep 3
      ok_button.click
    end

    ######### Documents #########

    def add_documents(doc_type, text)
      add_button.click
      wait_for_db_activity
      document_dropdown_field.set doc_type
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      sleep 3
      text_field.set text
    end

    def select_documents(doc_type)
      filter_activity(document_filter, doc_type)
      wait_for_db_activity
    end

    ######### Import Attributes #########

    def import_attributes(partner_type,partner_id)
      expand_labelbox('Import Attributes').click unless ia_partner_1_dropdown.present?
      select_list(ia_partner_1_option(partner_type), ia_partner_1_dropdown, partner_type)
      ia_partner_1_field.set partner_id
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      sleep 3
      wait_for_db_activity
    end

    def beneficiary_attributes(expiry, variance, terms)
      expand_labelbox('Beneficiary Attributes').click unless beneficiary_checkbox.present?
      beneficiary_checkbox.click unless beneficiary_checkbox.check?
      wait_for_db_activity
      place_of_expiry.set expiry
      variance_percent.set variance
      select_list(presentation_terms_option(terms), presentation_terms_dropdown, terms)
      wait_for_db_activity
    end

    ######### Expenses #########

    def shipping_routes
      expand_labelbox('Shipping Routes').click unless ordem_control_field.present?

      document_dropdown_field.set doc_type
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      sleep 3

      wait_for_db_activity
    end

    def expenses_box(order, cicle)
      expand_labelbox('Expenses').click unless ordem_control_field.present?

      select_list(ordem_control_list(order), ordem_control_field, order)
      wait_for_db_activity
      select_list(review_cycle_list(cicle), review_cycle_field, cicle)
      wait_for_db_activity
    end

    def rate_updates(order, cicle)
      expand_labelbox('Rate Updates').click unless ordem_control_field.present?

      select_list(ordem_control_list(order), ordem_control_field, order)
      wait_for_db_activity
      select_list(review_cycle_list(cicle), review_cycle_field, cicle)
      wait_for_db_activity
    end


    ####################### Partners #######################

    def open_manage_partners
      TryWith.attempts(attempts: 3, sleep: 2) do
        tasks_button.click unless fd_manage_partners_link.present?
      end
      #scroll_to dl_download_link
      fd_manage_partners_link.click
      wait_for_db_activity
    end

    def open_create_partners
      TryWith.attempts(attempts: 3, sleep: 2) do
        tasks_button.click unless fd_create_partners_link.present?
      end
      #scroll_to dl_download_link
      fd_create_partners_link.click
      wait_for_db_activity
    end

    def search_all_partners
      search_button.click
      wait_for_db_activity
    end

    def search_partner(partner_id)
      partner_id_field.set partner_id
      wait_for_db_activity
      search_button.click
      wait_for_db_activity
    end

    def new_partner_id
      wait_for_db_activity
      partner_id.wait_until_present
      @new_id = partner_id.value
    end

    def create_partner(type, partner_name, status, currency, terms, contact_name, phone)
      select_list(partner_type_list(type), partner_type_field, type)
      ok_button.click
      wait_for_db_activity
      partner_name_field.set partner_name
      wait_for_db_activity
      part_currency.set currency
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      sleep 3
      select_list(partner_status_list(status), partner_status_field, status)
      wait_for_db_activity
      partner_terms. set terms
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      sleep 3
      contact_name.set contact_name
      wait_for_db_activity
      contact_phone.set phone
      wait_for_db_activity
    end

    def edit_partner(type, partner_name, status, terms, contact_name, phone)
      select_list(partner_type_list(type), partner_type_field, type)
      ok_button.click
      wait_for_db_activity
      partner_name.set partner_name
      wait_for_db_activity
      select_list(partner_status_list(status), partner_status_field, status)
      wait_for_db_activity
      partner_terms. set terms
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      sleep 3
      contact_name.set contact_name
      wait_for_db_activity
      contact_phone.set phone
      wait_for_db_activity
    end

    def add_invoicing_attribute(receive_option, pay_option)
      wait_for_db_activity
      select_list(receive_invoice_list(receive_option), receive_invoice_field, receive_option)
      wait_for_db_activity
      select_list(pay_invoice_list(pay_option), pay_invoice_field, pay_option)
      ok_button.click
    end




  end
end


