require 'test-evolve/core/page_object'

module Pages
  def warehouse
    @warehouse ||= WareHouse.new
  end

  class WareHouse < TestEvolve::Core::PageObject

    include Pages

    ##Reusable##
    element(:_actions) { a(:text, 'Actions') }
    element(:_actions_optional) { a(:text, /Actions/) }
    element(:delete_sign) { img(id: /mr1:pc1:_ATp:delete::icon/) }
    element(:confirm_delete_button) { span text: 'Yes' }
    element(:warehouse_filter) { text_field(label: 'Warehouse') }


    #Create Warehouse
    element(:_warehouse) { span(:text, 'Warehouse') }
    element(:_address_page) { div(:id, /mR:commandButton2/) }
    element(:create) { td(:text, 'Create') }

    element(:_warehouse_id) { input(id: /mR:whBWarehouse::content/) }
    element(:_warehouse_name) { textarea(id: /mR:whNameBWarehouse::content/) }
    element(:_delivery_policy) { select(id: /mR:deliveryPolicyBWarehouse::content/) }
    element(:_next_valid_day_delivery) { |text| option(text: text) }
    element(:_currency) { text_field(label: 'Currency') }
    element(:_vat_region) { text_field(label: 'VAT Region') }
    element(:_inbound_days) { text_field(label: 'Inbound Handling Days') }

    element(:zonning_location_button) { a(id: /mR:pb1::_afrDscl/) }
    element(:_cost_location_first_field) { select(id: /mR:soc1::content/) }
    element(:_cost_location) { |text| option(text: text) }
    element(:_cost_location_second_field) { text_field(label: 'Cost Location') }

    ## Address ##
    element(:_add) { img(alt: 'Add') }
    element(:_address_type) { select(id: /mR:pc11:_ATp:tiAddressTypeBApply::content/) }
    element(:_address_type_option) { |text| option(text: text) }
    element(:_address) { text_field(label: 'Address') }
    element(:_city) { text_field(label: 'City') }
    element(:_country) { text_field(label: 'Country') }
    element(:ok_button) { span(text: 'OK') }

    ## Edit Address ##
    element(:_edit) { img(id: /mR:pc11:_ATp:edit::icon/) }

    #VWH
    # Create method and set data yml part remains
    element(:_vwh_page) { span(text: 'Virtual Warehouses') }
    element(:_vwh) { text_field(label: 'Virtual Warehouse (Required)') }
    element(:_name) { text_field(label: 'Name (Required)') }
    element(:_org_en_type) { select(id: /mr:pc1:_ATp:soc4::content/) }
    element(:_org_en_type_opt) { |text| option(text: text) } #select option from list
    element(:_transfer_entity) { text_field(label: 'Transfer Entity') }
    element(:_org_unit) { text_field(label: 'Org Unit') }
    element(:_channel) { text_field(label: 'Channel (Required)') }
    element(:_pricing_location) { text_field(label: 'Pricing Location') }
    element(:_relplenishment_button) { input(id: /mr:pc1:_ATp:sbc11::content/) }
    element(:_primary_virtual_warehouse) { text_field(label: 'Primary Virtual Warehouse') }


    #Manage warehouse
    element(:_warehouse_filter) { text_field(label: 'Warehouse') }
    element(:_warehouse_link) { a(id: /mR:pc16:_ATp:tbb6:25:cl6/) }

    #Delete
    ## Delete ##
    element(:delete_button) { a title: 'Delete' }
    element(:delete_ok_button) { div(id: /mR:cb2/) }

    ## Manage Address - Independent ##
    # element(:_address_filter_field){input id: /mR:pc11:_ATp:tbb1:_afrFltrMdlcl-tiAdd1BAddr::content/}
    element(:_delete_icon) { img(id: /mR:pc11:_ATp:delete::icon/) }
    element(:_filter_add_line_1) { text_field(label: 'Filter: Address Line 1') }
    element(:_add_from_exs_add) {img(id: /mR:pc11:_ATp:duplicate::icon/)}
    def add_warehouse
      wait_for_db_activity
      _warehouse.click
      wait_for_db_activity
      _actions.click
      wait_for_db_activity
      create.click
      wait_for_db_activity
    end

    def create_warehouse(warehouse_id, warehouse_name, currency, vat_region, delivery_option, inblund_days, cost_location, wh_number)
      wait_for_db_activity
      _warehouse_id.send_keys warehouse_id
      wait_for_db_activity
      _warehouse_name.clear
      _warehouse_name.send_keys warehouse_name
      wait_for_db_activity
      _currency.clear
      _currency.send_keys currency
      shared.enter_times _currency, 1
      wait_for_db_activity
      _vat_region.clear
      _vat_region.send_keys vat_region
      shared.enter_times _vat_region, 2
      wait_for_db_activity
      _delivery_policy.click
      wait_for_db_activity
      _next_valid_day_delivery(delivery_option).click
      wait_for_db_activity
      _inbound_days.send_keys inblund_days
      wait_for_db_activity
      add_zonning_location cost_location, wh_number
    end

    def add_zonning_location(cost_location, wh_number)
      #zonnig location
      if _cost_location_first_field.present?
        wait_for_db_activity
        _cost_location_first_field.click
        wait_for_db_activity
        _cost_location(cost_location).click
        wait_for_db_activity
        _cost_location_second_field.clear
        _cost_location_second_field.send_keys wh_number
        shared.enter_times _cost_location_second_field, 1
      else
        zonning_location_button.click
        _cost_location_first_field.click
        wait_for_db_activity
        _cost_location(cost_location).click
        wait_for_db_activity
        _cost_location_second_field.clear
        _cost_location_second_field.send_keys wh_number
        shared.enter _cost_location_second_field, 2
      end
    end

    def add_address (address_type_option, address, city, country)
      _address_page.click
      wait_for_db_activity
      sleep 2
      _add.click
      wait_for_db_activity
      _address_type.click
      wait_for_db_activity
      _address_type_option(address_type_option).click
      wait_for_db_activity
      _address.send_keys address
      shared.enter_times _address, 2
      wait_for_db_activity
      _city.send_keys city
      shared.enter_times _city, 2
      wait_for_db_activity
      _country.send_keys country
      shared.enter_times _country, 2
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
      shared.save_and_close
      wait_for_db_activity
      shared.save_and_close
      wait_for_db_activity
      shared.done
      wait_for_db_activity
    end


    def add_vwh (vwh_id, name, org_en_type_opt, transfer_entity, org_unit, channel, pricing_location, primary_virtual_warehouse)
      _vwh_page.click
      wait_for_db_activity
      _add.click
      wait_for_db_activity
      _vwh.send_keys vwh_id
      shared.enter_times _vwh, 1
      wait_for_db_activity
      _name.send_keys name
      shared.enter_times _name, 1
      wait_for_db_activity
      _org_en_type.click
      wait_for_db_activity
      _org_en_type_opt(org_en_type_opt).click
      wait_for_db_activity
      _transfer_entity.send_keys transfer_entity
      shared.enter_times _transfer_entity, 1
      _org_unit.send_keys org_unit
      shared.enter_times _org_unit, 1
      _channel.send_keys channel
      shared.enter_times _channel, 1
      _pricing_location.clear
      _pricing_location.send_keys pricing_location
      shared.enter_times _pricing_location, 1
      click_if_replenishment_present
      TE.browser.div(id: /mr:pc1:_ATp:cb16/).click
      shared.save_and_close
      wait_for_db_activity
      _primary_virtual_warehouse.clear
      _primary_virtual_warehouse.send_keys vwh_id
      shared.enter_times _primary_virtual_warehouse, 1
      shared.save_and_close
      shared.done
    end

    def click_if_replenishment_present
      if _relplenishment_button.present?
        _relplenishment_button.click
        wait_for_db_activity
      else
      end
    end


    ## Reach to Edit Warehouse ##
    def edit_warehouse(_warehouse_id)
      wait_for_db_activity
      shared.from_org_hierarchy
      wait_for_db_activity
      _warehouse.click
      wait_for_db_activity
      shared.filter_activity(_warehouse_filter, _warehouse_id)
      _warehouse_link.click
      wait_for_db_activity
    end

    def update_warehouse (updated_whName, updated_vat_region, updated_delivery_option,
                          updated_inbound_days)

      wait_for_db_activity
      _warehouse_name.clear
      _warehouse_name.send_keys updated_whName
      wait_for_db_activity

      _vat_region.clear
      _vat_region.send_keys updated_vat_region
      shared.enter_times _vat_region, 2
      wait_for_db_activity

      _delivery_policy.click
      wait_for_db_activity
      _next_valid_day_delivery(updated_delivery_option).click
      wait_for_db_activity
      _inbound_days.send_keys updated_inbound_days

      shared.save_and_close
      shared.done
    end

    def edit_address
      wait_for_db_activity
      _address_page.click
      wait_for_db_activity
      _actions_optional.click
      wait_for_db_activity
      _edit.click
    end

    def update_address(updated_address, updated_city, updated_country)
      wait_for_db_activity

      _address.clear
      _address.send_keys updated_address
      shared.enter_times _address, 2
      wait_for_db_activity

      _city.clear
      _city.send_keys updated_city
      shared.enter_times _city, 2
      wait_for_db_activity

      _country.clear
      _country.send_keys updated_country
      shared.enter_times _country, 2
      wait_for_db_activity

      ok_button.click
      wait_for_db_activity
      shared.save_and_close
      wait_for_db_activity
      shared.save_and_close
      wait_for_db_activity
      shared.done
      wait_for_db_activity
    end

    def manage_add_address(address_type_option, address, city, country)
      _address_page.click
      wait_for_db_activity
      sleep 2
      _add.click
      wait_for_db_activity
      _address_type.click
      wait_for_db_activity
      _address_type_option(address_type_option).click
      wait_for_db_activity

      _address.clear
      wait_for_db_activity
      _address.send_keys address
      wait_for_db_activity
      shared.enter_times _address, 2
      wait_for_db_activity

      _city.clear
      _city.send_keys city
      shared.enter_times _city, 2
      wait_for_db_activity

      _country.clear
      wait_for_db_activity
      _country.send_keys country
      shared.enter_times _country, 2
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
      shared.save_and_close
    end


    def manage_add_from_existing_address(address_type_option, address, city, country)
      _address_page.click
      wait_for_db_activity
      sleep 2
      _add_from_exs_add.click
      wait_for_db_activity
      _address_type.click
      wait_for_db_activity
      _address_type_option(address_type_option).click
      wait_for_db_activity

      _address.clear
      _address.send_keys address
      shared.enter_times _address, 2
      wait_for_db_activity

      _city.clear
      _city.send_keys city
      shared.enter_times _city, 2
      wait_for_db_activity

      _country.clear
      _country.send_keys country
      shared.enter_times _country, 2
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
      shared.save_and_close
      shared.save_and_close
      shared.done
    end

    def delete_address (warehouse, address_to_remove)
      edit_warehouse warehouse
      _address_page.click
      wait_for_db_activity
      shared.filter_activity(_filter_add_line_1, address_to_remove)
      wait_for_db_activity
      sleep 2
      _delete_icon.click
      confirm_delete_button.click
      wait_for_db_activity

      ## To eliminate some unknown error ##
      _filter_add_line_1.clear
      wait_for_db_activity
      shared.enter_times _filter_add_line_1,2

      shared.save_and_close
      shared.save_and_close
      shared.done
    end

    def delete_warehouse
      wait_for_db_activity
      TE.browser.element(title: 'Delete').present?
      delete_button.click
      wait_for_db_activity
      confirm_delete_button.click
      wait_for_db_activity
      shared.done
      wait_for_db_activity

    end


  end
end
