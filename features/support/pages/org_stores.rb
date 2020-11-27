require 'test-evolve/core/page_object'

module Pages
  def org_stores
    @org_stores ||= Org_Stores.new
  end

  class Org_Stores < TestEvolve::Core::PageObject

    include Pages

    ##Reusable##
    element(:add_sign) { img(alt: 'Add') }
    element(:delete_sign){img(id:/mr1:pc1:_ATp:delete::icon/)}
    element(:confirm_delete_button) { span text: 'Yes' }

    #Create Store
    element(:store) { span(:text, 'Store') }
    element(:actions) { a(:text, 'Actions') }
    element(:create) { td(:text, 'Create') }
    element(:store_field) { select(:id, /mR:storeTypeBStore::content/) }
    element(:company) { option(:text, 'Company') }

    element(:store_name) { textarea id: /mR:storeNameBStore::content/ }
    element(:ten_char_name) { text_field label: '10 Character Name' }
    element(:three_char_name) { text_field label: '3 Character Name' }
    element(:channel) { text_field label: 'Channel (Required)' }
    element(:area) { text_field label: 'Area (Required)' }
    element(:transfer_zone) { text_field label: 'Transfer Zone (Required)' }
    element(:currency) { text_field label: 'Currency (Required)' }
    element(:language) { text_field label: 'Language (Required)' }
    element(:time_zone) { text_field id: /mR:timezoneNameBStore::content/ }
    element(:vat_region) { text_field label: 'VAT Region (Required)' }
    element(:org_unit) { text_field label: 'Org Unit (Required)' }
    element(:store_class_name) { option(:text, 'Class Stores A') }
    element(:store_open_date) { text_field label: 'Store Open Date' }
    element(:store_order_days) { text_field label: 'Start Order Days' }
    element(:unique_transaction_number) { select id: /mR:tranNoGeneratedBStore::content/ }
    element(:ut_number) { option(:text, 'Store') }
    element(:manager) { text_field label: 'Manager' }
    #drop_down
    element(:store_class) { select(:id, /mR:storeClassBStore::content/) }
    element(:store_class_option) { option(:text, 'Class Stores A') }
    element(:store_h) { input(:id, /mR:storeBStore::content/) }


    ## Zonning Location ##
    element(:zonning_location) { a(:title, /Expand Zoning Locations/) }
    element(:pricing_store) { text_field(label: 'Pricing Store') }
    element(:cost_location) { text_field(label: 'Cost Location') }

    ## Address ##
    element(:address_button) { span(text: 'Address') }
    element(:address_type) { select(id: /mR:pc11:_ATp:tiAddressTypeBApply::content/) }
    element(:option) { option(text: 'Business') }
    element(:address_field) { text_field(label: 'Address') }
    element(:city_field) { text_field(label: 'City') }
    element(:country_field) { text_field(label: 'Country') }
    element(:ok_button) { div(id: /mR:pc11:_ATp:cb1/) }

    ##Update Store##
    element(:store_filter) { text_field(label: 'Store') }
    element(:store_link) { a(id: /mR:pc15:_ATp:tbb5:25:cl5/) }

    ##location traits##
    element(:more_actions) { a(title: 'More Actions') }
    element(:location_traits_option) { td(text: 'Location Traits') }
    element(:location_traint_no) { text_field(label: 'Location Trait') }
    element(:ok_b) { span(text: 'OK') }

    ## Delete ##
    element(:delete_button) {a title: 'Delete'}
    element(:delete_ok_button){div(id:/mR:cb2/)}

    def add_store
      wait_for_db_activity
      store.click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      create.click
      wait_for_db_activity
    end

    def create_store(_store_id, _storeName, ten_ch_name, three_ch_name, _channelNm, _area, transferZone,
                     _currency, _language, timeZone, vatRegion, orgUnit, s_open_date, s_order_days, _manager,
                     _pricingStore, _costLocation, _address, _city, _country)
      store_field.click
      wait_for_db_activity
      company.click
      wait_for_db_activity
      store_h.send_keys _store_id
      wait_for_db_activity
      store_name.send_keys _storeName
      wait_for_db_activity
      ten_char_name.send_keys ten_ch_name
      wait_for_db_activity
      three_char_name.send_keys three_ch_name
      wait_for_db_activity
      channel.send_keys _channelNm
      channel.send_keys :enter
      wait_for_db_activity
      area.send_keys _area
      shared.enter_times area, 2
      wait_for_db_activity
      transfer_zone.send_keys transferZone
      shared.enter_times transfer_zone, 2
      wait_for_db_activity
      currency.send_keys _currency
      shared.enter_times currency, 2
      wait_for_db_activity
      language.send_keys _language
      shared.enter_times language, 2
      wait_for_db_activity
      time_zone.send_keys timeZone
      wait_for_db_activity
      shared.enter_times time_zone, 2
      wait_for_db_activity
      vat_region.send_keys vatRegion
      shared.enter_times vat_region, 2
      wait_for_db_activity
      org_unit.send_keys orgUnit
      shared.enter_times org_unit, 2
      store_class.click
      wait_for_db_activity
      store_class_option.click
      wait_for_db_activity
      store_open_date.send_keys s_open_date
      wait_for_db_activity
      store_order_days.send_keys s_order_days
      wait_for_db_activity
      unique_transaction_number.click
      wait_for_db_activity
      ut_number.click
      wait_for_db_activity
      manager.send_keys _manager
      wait_for_db_activity

      # Zonning Location #
      scroll_to zonning_location
      zonning_location.click
      wait_for_db_activity
      pricing_store.send_keys _pricingStore
      wait_for_db_activity
      shared.enter_times pricing_store, 2
      cost_location.clear
      wait_for_db_activity
      sleep 1
      cost_location.send_keys _costLocation
      wait_for_db_activity
      shared.enter_times cost_location, 2

      # Address #
      address_button.click
      wait_for_db_activity
      add_sign.click
      wait_for_db_activity
      address_type.click
      wait_for_db_activity
      option.click
      wait_for_db_activity
      address_field.send_keys _address
      shared.enter_times address_field, 2
      city_field.send_keys _city
      shared.enter_times city_field, 2
      country_field.send_keys _country
      shared.enter_times country_field, 2
      ok_button.click

      #Save and Close
      shared.save_and_close
      shared.save_and_close
      shared.done
    end


    ## Reach to Edit Store ##
    def edit_store(_store_id)
      wait_for_db_activity
      shared.from_org_hierarchy
      wait_for_db_activity
      store.click
      wait_for_db_activity
      shared.filter_activity(store_filter, _store_id)
      store_link.click
      wait_for_db_activity
    end

    def delete_store
      TE.browser.element(title: 'Delete').present?
      delete_button.click
      wait_for_db_activity
      confirm_delete_button.click
      wait_for_db_activity
      delete_ok_button.click
      shared.done
    end

    ## Update Store ##
    def update_store(_store_id, _storeName, ten_ch_name, three_ch_name, _channelNm, _area, transferZone,
                     _language, timeZone, vatRegion, _s_openDate, s_order_days, _manager,
                     _pricingStore, _costLocation, _address, _city, _country)


      ## Update Details ##
      store_name.clear
      store_name.send_keys _storeName
      wait_for_db_activity
      ten_char_name.clear
      ten_char_name.send_keys ten_ch_name
      wait_for_db_activity
      three_char_name.clear
      three_char_name.send_keys three_ch_name
      wait_for_db_activity
      channel.clear
      channel.send_keys _channelNm
      channel.send_keys :enter
      wait_for_db_activity
      area.clear
      area.send_keys _area
      shared.enter_times area, 2
      wait_for_db_activity
      transfer_zone.clear
      transfer_zone.send_keys transferZone
      shared.enter_times transfer_zone, 2
      wait_for_db_activity

      language.clear
      language.send_keys _language
      shared.enter_times language, 2
      wait_for_db_activity
      time_zone.clear
      time_zone.send_keys timeZone
      wait_for_db_activity
      shared.enter_times time_zone, 2
      wait_for_db_activity
      vat_region.clear
      vat_region.send_keys vatRegion
      shared.enter_times vat_region, 2
      wait_for_db_activity

      store_class.click
      wait_for_db_activity
      store_class_option.click
      wait_for_db_activity
      store_open_date.clear
      store_open_date.send_keys "29-11-2020"
      wait_for_db_activity
      store_order_days.clear
      store_order_days.send_keys s_order_days
      wait_for_db_activity
      unique_transaction_number.click
      wait_for_db_activity
      ut_number.click
      wait_for_db_activity
      manager.clear
      manager.send_keys _manager
      wait_for_db_activity

      ##Save and Close##
      shared.save_and_close
      shared.done
    end

    ## Location Traits ##
    # add location #
    def add_location(_location_trait)
      more_actions.click
      wait_for_db_activity
      location_traits_option.click
      wait_for_db_activity
      add_sign.click
      wait_for_db_activity
      location_traint_no.send_keys _location_trait
      shared.enter_times location_traint_no, 2
      wait_for_db_activity
      ok_b.click
      wait_for_db_activity
      shared.save_and_close
      wait_for_db_activity
      shared.save_and_close
      wait_for_db_activity
      shared.done
    end

    # Delete Location #
    def delete_location
      more_actions.click
      wait_for_db_activity
      location_traits_option.click
      wait_for_db_activity
      delete_sign.click
      wait_for_db_activity
      confirm_delete_button.click
      shared.save_and_close
      wait_for_db_activity
      shared.save_and_close
      wait_for_db_activity
      shared.done
    end

  end
end


