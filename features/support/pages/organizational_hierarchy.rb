require 'test-evolve/core/page_object'

module Pages
  def organizational_hierarchy
    @organizational_hierarchy ||= Organizational_Hierarchy.new
  end

  class Organizational_Hierarchy < TestEvolve::Core::PageObject

    ##ReUsable##
    element(:tasks_button) { a(:title, 'Tasks') }
    element(:tasks_foundation_data_link) { a(:text, 'Foundation Data') }
    element(:location_Foundation) { span(:text, 'Location Foundation') }
    element(:organizational_Hierarchy) { span(:text, 'Organizational Hierarchy') }
    element(:actions) { a(:text, 'Actions') }
    element(:create) { td(:text, 'Create') }
    element(:add) { td(:text, 'Add') }
    element(:edit) { td(:text, 'Edit') }
    element(:save_and_close) { span(:text, 'Save and Close') }
    element(:done_button) { span(:text, 'Done') }
    element(:confirm_delete_button) { span text: 'Yes' }
    element(:manager_name) { text_field label: 'Manager' }
    element(:currency_name) { text_field label: 'Currency' }

    ##Division##
    #create, update and delete
    element(:division) { span(:text, 'Division') }
    element(:divisionActions) { div(:id, /mR:cat:_ATp:ATm/) }
    element(:division_field) { text_field label: 'Division' }
    element(:division_name_field) { text_field label: 'Division Name' }
    element(:ok_button) { div(:id, /tabrg2:2:mR:cat:_ATp:cb1/) }
    element(:division_filter_icon) { img(:id, /cat:_ATp:_qbeTbr::icon/) }
    element(:division_filter_field) { input(:id, /cat:_ATp:t1:_afrFltrMdlc1::content/) }
    element(:edit_division_option) { tr xpath: "//tr[contains(@id,'cat:_ATp:editMenuItem')]" }
    element(:edit_ok) { div id: /cat:_ATp:d3_ok/ }
    element(:delete_to_remove) { tr id: /mR:cat:_ATp:deleteMenuItem/ }


    ##Country##
    #Create, update and Delete
    element(:country) { span(:text, 'Country') }
    element(:countryActions) { div id: /mr1:at1:_ATp:ATm/ }
    element(:country_field) { text_field label: 'Country' }
    element(:country_name_field) { text_field label: 'Name' }
    element(:country_division_field) { text_field label: /Division/ }
    element(:create_country_ok){div(:id, /mr1:at1:_ATp:cb1/)}
    element(:edit_country_ok) { div(:id, /mr1:at1:_ATp:cb4/) }
    element(:delete_country_field) { td(text: 'Delete') }
    element(:filter_first_field) { input(:id, /_ATp:t1:_afrFltrMdlc4::content/) }
    element(:edit_country_option) { tr(:id, /mr1:at1:_ATp:editMenuItem/) }

    ##Region##
    ## create , update and delete ##
    element(:region_field) { text_field label: 'Region' }
    element(:region_name_field) { text_field label: 'Region Name' }
    element(:region_country_field) { text_field label: /Country/ }
    element(:create_region_ok) { div(:id, /at1:_ATp:cb1/) }
    element(:update_region_ok) { div(:id, /at1:_ATp:cb2/) }
    element(:regionActions) { div(:id, /mR:at1:_ATp:ATm/) }
    element(:edit_region_option) { tr(:id, /mR:at1:_ATp:editMenuItem/) }
    element(:deleteRegion) { td(text: 'Delete') }
    element(:region_filter_field) { input id: /mR:at1:_ATp:tbb:_afrFltrMdlc5::content/ }


    ##Area##
    ## create , update and delete ##
    element(:area_field) { text_field label: /Area/ }
    element(:area_name_field) { text_field label: 'Area Name' }
    element(:area_region_field) { text_field label: /Region/ }
    element(:create_area_ok) { div(:id, /mR:pc1:_ATp:cb1/) }
    element(:edit_area_ok) { div(:id, /mR:pc1:_ATp:d2_ok/) }
    element(:deleteArea) { td(text: 'Delete') }
    element(:areaActions) { div(:id, /mR:pc1:_ATp:ATm/) }
    element(:area_filter_field) { input id: /mR:pc1:_ATp:tbb:_afrFltrMdlcl-districtBDistrict::content/ }
    element(:edit_area_option) { tr(:id, /mR:pc1:_ATp:editMenuItem/) }

    # till Org- Hierarchy #
    def open_org_hierarchy
      TryWith.attempts(attempts: 10, sleep: 2) do
        tasks_button.wait_until_present.click
        wait_for_db_activity
        tasks_foundation_data_link.click
        wait_for_db_activity
        location_Foundation.click
        wait_for_db_activity
        organizational_Hierarchy.click
      end
    end

    # from org - hierarchy #
    def from_org_hierarchy
      tasks_button.wait_until_present.click
      wait_for_db_activity
      organizational_Hierarchy.click
      wait_for_db_activity
    end

    #add and create
    def add_division
      division.click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      create.click
      wait_for_db_activity
      divisionActions.click
      wait_for_db_activity
      add.click
      sleep 2
    end

    def create_division (id,name,manager,currency)

      division_field.send_keys id
      wait_for_db_activity
      division_name_field.send_keys name
      wait_for_db_activity
      manager_name.send_keys manager
      wait_for_db_activity
      currency_name.send_keys currency
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
      save_and_close.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity

    end

    #Edit Division
    def edit_division(id)
      wait_for_db_activity
      division.click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      edit.click
      #----------
      filter_activity(division_filter_field, id)
      wait_for_db_activity
      #----------
      divisionActions.click
      wait_for_db_activity
      edit_division_option.click
      wait_for_db_activity
    end

    def update_division(name,_manager,currency)
      wait_for_db_activity
      division_name_field.clear
      division_name_field.send_keys name
      wait_for_db_activity
      manager_name.clear
      manager_name.send_keys _manager
      #--------------
      wait_for_db_activity
      currency_name.clear
      currency_name.send_keys currency
      currency_name.send_keys :enter
      #------------
      wait_for_db_activity
      edit_ok.click
      wait_for_db_activity
      save_close
    end

    #Delete#
    def delete_division(id)
      division.click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      edit.click
      wait_for_db_activity
      filter_activity(division_filter_field, id)
      divisionActions.click
      wait_for_db_activity
      delete_to_remove.click
      wait_for_db_activity
      confirm_delete_button.click
      wait_for_db_activity
      save_and_close.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
    end

    ##Country##
    # add #
    def add_country
      country.click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      create.click
      wait_for_db_activity
      countryActions.click
      wait_for_db_activity
      add.click
      sleep 2
    end

    #->
    # create #
    def createCountry(id,name,manager,currency,division_id)
      wait_for_db_activity
      country_field.send_keys id
      wait_for_db_activity
      country_name_field.send_keys name
      wait_for_db_activity
      manager_name.send_keys manager
      wait_for_db_activity
      currency_name.send_keys currency
      currency_name.send_keys :enter
      wait_for_db_activity
      country_division_field.send_keys division_id
      country_division_field.send_keys :enter
      wait_for_db_activity
      create_country_ok.click
      wait_for_db_activity
      save_close
    end

    # edit #
    def edit_country(id)
      country.click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      edit.click
      wait_for_db_activity
      filter_activity(filter_first_field, id)
      countryActions.click
      wait_for_db_activity
      edit_country_option.click
      wait_for_db_activity
    end

    #Update country
    def update_country(updatedname,manager,currency,division)
      country_name_field.clear
      country_name_field.send_keys updatedname
      wait_for_db_activity
      manager_name.clear
      manager_name.send_keys manager
      wait_for_db_activity
      currency_name.clear
      currency_name.send_keys currency
      wait_for_db_activity
      country_division_field.clear
      country_division_field.send_keys division
      wait_for_db_activity
      edit_country_ok.click #
      wait_for_db_activity
      #  - close the filter option after - #
      TE.browser.img(id: /at1:_ATp:_qbeTbr::icon/).click
      wait_for_db_activity
      save_close
    end

    ## Delete Country #
    def delete_country(id)
      country.click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      edit.click
      wait_for_db_activity
      filter_activity(filter_first_field, id)
      countryActions.click
      wait_for_db_activity
      delete_country_field.click
      wait_for_db_activity
      confirm_delete_button.click
      wait_for_db_activity
      save_close
    end

    ##Region##
    # Add #
    def add_region
      wait_for_db_activity
      TE.browser.span(xpath: "//span[text()='Region']").click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      create.click
      wait_for_db_activity
      regionActions.click
      wait_for_db_activity
      add.click
      sleep 2
    end

    def create_region(id,name,manager,currency,country)
      region_field.send_keys id
      wait_for_db_activity
      region_name_field.send_keys name
      wait_for_db_activity
      manager_name.send_keys manager
      wait_for_db_activity
      currency_name.send_keys currency
      wait_for_db_activity
      region_country_field.send_keys country
      wait_for_db_activity
      create_region_ok.click
      wait_for_db_activity
      save_close
    end

    #edit
    def edit_region(id)
      wait_for_db_activity
      TE.browser.span(xpath: "//span[text()='Region']").click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      edit.click
      wait_for_db_activity
      filter_activity(region_filter_field, id)
      regionActions.click
      wait_for_db_activity
      edit_region_option.click
      wait_for_db_activity
    end

    def update_region(name,manager,currency,country)
      region_name_field.clear
      region_name_field.send_keys name
      wait_for_db_activity
      manager_name.clear
      manager_name.send_keys manager
      #--------------
      wait_for_db_activity
      currency_name.clear
      currency_name.send_keys currency
      currency_name.send_keys :enter
      region_country_field.clear
      region_country_field.send_keys country
      region_country_field.send_keys :enter
      #------------
      wait_for_db_activity
      update_region_ok.click
      wait_for_db_activity
      save_close
    end

    def delete_region(id)
      wait_for_db_activity
      TE.browser.span(xpath: "//span[text()='Region']").click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      edit.click
      wait_for_db_activity
      filter_activity(region_filter_field, id)
      regionActions.click
      wait_for_db_activity
      deleteRegion.click
      wait_for_db_activity
      confirm_delete_button.click
      wait_for_db_activity
      save_close
    end

    ##Area##
    #Add#
    def add_area
      wait_for_db_activity
      TE.browser.span(xpath: "//span[text()='Area']").click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      create.click
      wait_for_db_activity
      areaActions.click
      wait_for_db_activity
      add.click
      wait_for_db_activity
    end

    ## create ##
    def createArea(id,area,manager,currency,region)
      wait_for_db_activity
      area_field.send_keys id
      wait_for_db_activity
      area_name_field.send_keys area
      wait_for_db_activity
      manager_name.send_keys manager
      wait_for_db_activity
      currency_name.send_keys currency
      wait_for_db_activity
      currency_name.send_keys :enter
      wait_for_db_activity
      area_region_field.send_keys region
      wait_for_db_activity
      create_area_ok.click
      wait_for_db_activity
      save_close
    end

    ## Update ##
    def editArea(id)
      wait_for_db_activity
      TE.browser.span(xpath: "//span[text()='Area']").click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      edit.click
      wait_for_db_activity
      filter_activity(area_filter_field, id)
      areaActions.click
      wait_for_db_activity
      edit_area_option.click
      wait_for_db_activity
    end

    def updateArea(name,manager,currency,region)
      wait_for_db_activity
      area_name_field.clear
      wait_for_db_activity
      area_name_field.send_keys name
      wait_for_db_activity
      manager_name.clear
      wait_for_db_activity
      manager_name.send_keys manager
      wait_for_db_activity
      currency_name.clear
      wait_for_db_activity
      currency_name.send_keys currency
      wait_for_db_activity
      area_region_field.clear
      wait_for_db_activity
      area_region_field.send_keys region
      wait_for_db_activity
      edit_area_ok.click
      wait_for_db_activity
      save_close
    end

    def delete_area(id)
      wait_for_db_activity
      TE.browser.span(xpath: "//span[text()='Area']").click
      wait_for_db_activity
      actions.click
      wait_for_db_activity
      edit.click
      wait_for_db_activity
      filter_activity(area_filter_field, id)
      areaActions.click
      wait_for_db_activity
      deleteArea.click
      confirm_delete_button.click
      wait_for_db_activity
      save_close
    end

    ##ReUables##
    #Save and Close and Done
    def save_close
      wait_for_db_activity
      save_and_close.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
    end

    # Filter
    def filter_activity(filter_element, filter_data)
      ## Filter ##
      if (filter_element.present? == true)
        filter_element.send_keys filter_data
        2.times do
          filter_element.send_keys :enter
        end
      else
        TE.browser.img(id: /at1:_ATp:_qbeTbr::icon/).click
        filter_element.send_keys filter_data
        wait_for_db_activity
        2.times do
          filter_element.send_keys :enter
        end
        wait_for_db_activity
      end
    end


  end
end
