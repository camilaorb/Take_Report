require 'test-evolve/core/page_object'

module Pages
  def merchandise_hierarchy
    @merchandise_hierarchy ||= MerchandiseHierarchy.new
  end

  class MerchandiseHierarchy < TestEvolve::Core::PageObject


    #Path
    element(:tasks_button) { a(:id, 'pt1:eachSidebarItem:2:l1') }
    element(:tasks_foundation_data_link) { a(:text, 'Foundation Data') }
    element(:fd_items_link) { a(:text, 'Item Foundation') }
    element(:fd_itens_merchandise_hierarchy_link) { a(:text, 'Merchandise Hierarchy') }

    #Merchandise Hierarchy
    element(:mh_division_button) { div(:id, /mR:pbDivisionHiermrch/) }
    element(:mh_dept_button) { div(:id, /mR:pbGroupHiermrch/) }
    element(:mh_department_button) { div(:id, /mR:pbDeptHiermrch/) }
    element(:mh_category_button) { div(:id, /mR:pbClassHiermrch/) }
    element(:mh_subcategory_button) { div(:id, /:mR:pbSubclassHiermrch/) }

    #Actions menu
    element(:actions_dropdown) { a(:text, 'Actions') }
    element(:actions_create_option) { td(:text, 'Create') }
    element(:actions_edit_option) { td(:text, 'Edit') }

    #Comuns buttons
    element(:add_button) { div(:title, 'Add') }
    element(:edit_button) { div(:id, /_ATp:edit/) }
    element(:delete_button) { div(:title, 'Delete') }
    element(:query_button) { div(:id, /_ATp:_qbeTbr/) }
    element(:ok_button) { div(:text, 'OK') }
    element(:save_and_close_button) { a(:text, 'Save and Close') }
    element(:delete_popup) { div(:text, /delete/) }
    element(:yes_button) { a(:text, 'Yes') }
    element(:yes_button2) { div(:id, /_ATp:d4_yes/) }
    element(:no_button) { a(:text, 'No') }
    element(:no_results) { div(:text, 'No data to display.') }
    element(:list) { table(:class, 'x14q x15f').tbody.table }
    element(:done_button) { a(:text, 'Done') }
    element(:cancel_button) { a(:text, 'Cancel') }


    #Comun fields
    element(:buyer_text_field) { text_field(:id, /_ATp:buyerNameId::content/) }
    element(:merchandiser_text_field) { text_field(:id, /_ATp:merchNameId::content/) }
    element(:loading_list) { div(:class, 'AFAutoSuggestBusyStyle') }

    #Division
    element(:division_id_filter) { text_field(:id, /_ATp:t1:_afrFltrMdlc2::content/) }
    element(:division_id_field) { text_field(:id, /_ATp:it4::content/) }
    element(:division_name_field) { text_field(:id, /_ATp:it5::content/) }
    element(:total_market_amount_field) { text_field(:id, /_ATp:it2::content/) }

    #Department
    element(:dept_id_filter) { text_field(:id, /_ATp:tbb:it4::content/) }
    element(:dept_id_field) { text_field(:id, /_ATp:it3::content/) }
    element(:dept_name_field) { text_field(:id, /_ATp:it2::content/) }
    element(:dept_name_edit_field) { text_field(:id, /_ATp:it1::content/) }
    element(:division_dropdown_field) { text_field(:id, /_ATp:divisionId::content/) }

    #Category
    element(:category_id_filter) { text_field(:id, /_afrFltrMdlcl-classBClass::content/) }
    element(:mh_department_text_field) { text_field(:id, /mR:departmentId::content/) }
    element(:category_id_field) { text_field(:id, /_ATp:it1::content/) }
    element(:category_name_field) { text_field(:id, /_ATp:it2::content/) }
    element(:dept_buyer_text_field) { text_field(:id, /_ATp:inputComboboxListOfValues2::content/) }
    element(:dept_merchandiser_text_field) { text_field(:id, /_ATp:inputComboboxListOfValues3::content/) }

    #Subcategory
    element(:subcategory_id_filter) { text_field(:id, /_afrFltrMdlcl-subclassBSubclass::content/) }
    element(:mh_department1_text_field) { text_field(:id, /mR:department1Id::content/) }
    element(:mh_category_text_field) { text_field(:id, /mR:classNoId::content/) }
    element(:subcategory_id_field) { text_field(:id, /mr1:pc1:_ATp:it2::content/) }
    element(:subcategory_name_field) { text_field(:id, /_ATp:it1::content/) }
    element(:delete_batch_message) { div(:text, /will be deleted in the nightly batch run and modifications are not allowed/) }
    element(:merchandise_hierarchy_message) { td(:text, /Do you want to continue without adding defaults?/) }

    #Sub Department
    element(:department_id_filter) { text_field(:id, /_afrFltrMdlcl-deptBDept::content/) }
    element(:department_id_field) { text_field(:id, /app1:it14::content/) }
    element(:department_name_field) { text_field(:id, /app1:it2::content/) }
    element(:dept_dropdown_field) { text_field(:id, /groupNoId::content/) }
    element(:profit_calc_type_list) { |text| select(:id, /app1:soc1::content/).option(:title, text) }
    element(:profit_calc_type_field) { select(:id, /app1:soc1::content/) }
    element(:otb_calc_type_list) { |text| select(:id, /app1:soc2::content/).option(:title, text) }
    element(:otb_calc_type_field) { select(:id, /app1:soc2::content/) }
    element(:purchase_type_list) { |text| select(:id, /app1:soc3::content/).option(:title, text) }
    element(:purchase_type_field) { select(:id, /app1:soc3::content/) }
    element(:subdept_buyer_text_field) { text_field(:id, /app1:buyerName1Id::content/) }
    element(:subdept_merchandiser_text_field) { text_field(:id, /app1:merchName1Id::content/) }
    element(:mark_cost_field) { text_field(:id, /app1:it1::content/) }
    element(:mark_retail_field) { text_field(:id, /app1:it15::content/) }
    element(:subdept_total_market_amount_field) { text_field(:id, /:app1:it4::content/) }
    element(:maximum_average_counter_field) { text_field(:id, /app1:it3::content/) }
    element(:average_tolerance_field) { text_field(:id, /app1:it5::content/) }
    element(:view_department_button) { div(:id, /mR:pc13:_ATp:view/) }
    element(:delete_subdpt_button) { a(:title, 'Delete') }
    element(:confirm_delete) { div(:id, /app1:cb1/) }


    #Add Vat Region Filds
    element(:more_actions_dropdown) { a(:title, 'More Actions') }
    element(:new_vat_maintenance_option) { tr(:id, /app1:cmi5/) }
    element(:vat_maintenance_option) { tr(:id, /app1:cmi3/) }
    element(:vat_region_filter) { text_field(:id, /_ATp:t1:itvs1::content/) }
    element(:vat_code_filter) { text_field(:id, /_afrFltrMdlc5::content/) }
    element(:vat_type_filter) { text_field(:id, /_afrFltrMdlc4::content/) }
    element(:vat_region_field) { text_field(:id, /app1:vatRegionTiId::content/) }
    element(:vat_region_dropdown) { a(:id, /app1:vatRegionTiId::lovIconId/) }
    element(:vat_type_field) { div(:class, 'x1dp').select(:id, /app1:soc3::content/) }
    element(:vat_type_list) { |text| div(:class, 'x1dp').select(:id, /app1:soc3::content/).option(:title, text) }
    element(:vat_code_field) { text_field(:id, /app1:iclov1::content/) }
    element(:add_vat_button) { div(:id, /app1:pc1:_ATp:create/) }
    element(:edit_vat_button) { div(:id, /app1:pc1:_ATp:edit/) }
    element(:ok_vat_button) { table(:id, /app1:pgl9/).a(:text, 'OK') }
    element(:vat_list) { div(:id, /app1:pc1:_ATp:t1::db/) }
    element(:cancel_vat) { div(:id, /:app1:APc/) }


    #Merch Hier Defaults
    element(:merch_hier_defaults_option) { tr(:title, 'Merchandise Hierarchy Defaults') }
    element(:information_filter) { text_field(:id, /_afrFltrMdlcl-infoBMerchHierDefault::content/) }
    element(:merch_hier_subcategory_filter) { text_field(:id, /_afrFltrMdlcl-subcategoryBMerchHierDefault::content/) }
    element(:information_field) { text_field(:id, /_ATp:infoId::content/) }
    element(:merch_hier_category_field) { text_field(:id, /_ATp:class1Id::content/) }
    element(:merch_hier_subcategory_field) { text_field(:id, /_ATp:subclass1Id::content/) }
    element(:checkbox_required) { checkbox(:id, /ap1:pc1:_ATp:sbc2::content/) }
    element(:merch_hier_defaults_list) { div(:id, /ap1:pc1:_ATp:tbb::db/) }
    element(:edit_merch_hier_button) { div(:id, /pc1:_ATp:edit/) }


    ############################################################################################################################

    def open_merchandise_hierarchy
      tasks_button.wait_until_present
      TryWith.attempts(attempts: 10, sleep: 2) do
        tasks_button.click
        wait_for_db_activity
        tasks_foundation_data_link.click unless fd_itens_merchandise_hierarchy_link.present?
        wait_for_db_activity
        fd_items_link.click unless fd_itens_merchandise_hierarchy_link.present?
        wait_for_db_activity
        fd_itens_merchandise_hierarchy_link.click
        wait_for_db_activity
      end
    end

    def close_merchandise_hierarchy
      TryWith.attempts(attempts: 10, sleep: 2) do
        fd_itens_merchandise_hierarchy_link.click
        wait_for_db_activity
        done_button.click
        wait_for_db_activity
      end
    end


    def reopen_merchandise_hierarchy
      tasks_button.wait_until_present
      TryWith.attempts(attempts: 10, sleep: 2) do
        tasks_button.click
        wait_for_db_activity
        fd_itens_merchandise_hierarchy_link.click
      end
    end

    def verify_actions(expected_values:)
      if no_results.present?
      else
        @actual_values = []
        @actual_values = list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include? expected_values
      end
    end

    def verify_delete_batch_message
      actions_dropdown.click
      actions_edit_option.click
      wait_for_db_activity
      ok_button.click if delete_batch_message.present?
    end

    def delete_item
      delete_button.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    ###################### Division #######################

    def access_division
      TryWith.attempts(attempts: 3, sleep: 10) do
        mh_division_button.wait_until_present
        mh_division_button.click
        wait_for_db_activity
      end
    end


    def select_division(new_id)
      sleep 5
      actions_dropdown.click
      actions_edit_option.click
      wait_for_db_activity
      fd_itens_merchandise_hierarchy_link.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
      query_button.click unless division_id_filter.present?
      wait_for_db_activity
      division_id_filter.click
      wait_for_db_activity
      division_id_filter.set new_id
      division_id_filter.click
      send_keys :enter
      wait_for_db_activity
    end

    def create_new_division(new_id, name_division, buyer, merchandiser, total_market_amount)
      actions_dropdown.click
      actions_create_option.click
      wait_for_db_activity
      fd_itens_merchandise_hierarchy_link.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
      add_button.click
      wait_for_db_activity
      division_id_field.set new_id
      division_name_field.set name_division
      total_market_amount_field.set total_market_amount
      send_keys :enter
      wait_for_db_activity
      buyer_text_field.set buyer
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      merchandiser_text_field.scroll.to
      wait_for_db_activity
      merchandiser_text_field.set merchandiser
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ok_button.wait_until_present
      ok_button.click
      wait_for_db_activity
      save_and_close_button.wait_until_present
      save_and_close_button.click
      wait_for_db_activity
    end

    def edit_division(name_division, buyer, merchandiser, total_market_amount)
      edit_button.click
      wait_for_db_activity
      division_name_field.set name_division
      #total_market_amount_field.click
      #total_market_amount_field.set total_market_amount
      #send_keys :enter
      wait_for_db_activity
      buyer_text_field.set buyer
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      merchandiser_text_field.scroll.to
      wait_for_db_activity
      merchandiser_text_field.set merchandiser
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    ############################################# Group #############################################################

    def access_dept

      TryWith.attempts(attempts: 3, sleep: 10) do
        mh_dept_button.wait_until_present
        mh_dept_button.click
        wait_for_db_activity
      end
    end

    def select_dept(new_id)
      actions_dropdown.click
      actions_edit_option.click
      wait_for_db_activity
      fd_itens_merchandise_hierarchy_link.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
      query_button.click unless dept_id_filter.present?
      wait_for_db_activity
      dept_id_filter.set new_id
      dept_id_filter.click
      send_keys :enter
      wait_for_db_activity
    end

    def create_new_dept(new_id, name, buyer, merchandiser, division)
      actions_dropdown.click
      actions_create_option.click
      wait_for_db_activity
      fd_itens_merchandise_hierarchy_link.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
      add_button.click
      wait_for_db_activity
      dept_id_field.set new_id
      dept_name_field.set name
      division_dropdown_field.set division
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      buyer_text_field.set buyer
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      merchandiser_text_field.scroll.to
      wait_for_db_activity
      merchandiser_text_field.set merchandiser
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def edit_dept(name, buyer, merchandiser)
      edit_button.click
      wait_for_db_activity
      dept_name_edit_field.set name
      wait_for_db_activity
      dept_buyer_text_field.set buyer
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      dept_merchandiser_text_field.scroll.to
      wait_for_db_activity
      dept_merchandiser_text_field.set merchandiser
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    ############################################# Category #############################################################

    def access_category(department_id)

      TryWith.attempts(attempts: 3, sleep: 10) do
        mh_category_button.wait_until_present
        mh_category_button.click
        wait_for_db_activity
        mh_department_text_field.wait_until_present
        mh_department_text_field.set department_id
        wait_until_enabled(loading_list)
        wait_for_db_activity
        send_keys :enter
        wait_for_db_activity
        sleep 5
      end
    end

    def select_category(new_id)
      actions_dropdown.click
      actions_edit_option.click
      wait_for_db_activity
      fd_itens_merchandise_hierarchy_link.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
      ok_button.click if delete_popup.present?
      query_button.click unless category_id_filter.present?
      wait_for_db_activity
      category_id_filter.set new_id
      category_id_filter.click
      send_keys :enter
      wait_for_db_activity
    end

    def create_new_category(new_id, name)
      actions_dropdown.click
      actions_create_option.click
      wait_for_db_activity
      fd_itens_merchandise_hierarchy_link.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
      add_button.click
      wait_for_db_activity
      category_id_field.set new_id
      category_name_field.set name
      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def edit_category(name)
      edit_button.click
      wait_for_db_activity
      category_name_field.set name
      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def delete_category
      delete_button.wait_until_present.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
      yes_button2.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    ############################################# Subcategory #############################################################

    def access_subcategory(department_id, category_id)

      TryWith.attempts(attempts: 3, sleep: 10) do
        mh_subcategory_button.wait_until_present
        mh_subcategory_button.click
        wait_for_db_activity
        mh_department1_text_field.wait_until_present
        mh_department1_text_field.set department_id
        wait_until_enabled(loading_list)
        wait_for_db_activity
        send_keys :enter
        wait_for_db_activity
        mh_category_text_field.wait_until_present
        mh_category_text_field.set category_id
        wait_until_enabled(loading_list)
        wait_for_db_activity
        send_keys :enter
        wait_for_db_activity
        sleep 5

      end
    end

    def select_subcategory(new_id)
      actions_dropdown.click
      actions_edit_option.click
      wait_for_db_activity
      fd_itens_merchandise_hierarchy_link.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
      ok_button.click if delete_popup.present?
      query_button.click unless subcategory_id_filter.present?
      wait_for_db_activity
      subcategory_id_filter.set new_id
      subcategory_id_filter.click
      send_keys :enter
      wait_for_db_activity
    end

    def create_new_subcategory(new_id, name)
      actions_dropdown.click
      actions_create_option.click
      wait_for_db_activity
      fd_itens_merchandise_hierarchy_link.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
      add_button.click
      wait_for_db_activity
      subcategory_id_field.set new_id
      subcategory_name_field.set name
      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
      yes_button.click if merchandise_hierarchy_message.present?
      wait_for_db_activity
    end

    def edit_subcategory(name)
      edit_button.click
      wait_for_db_activity
      subcategory_name_field.set name
      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def delete_subcategory
      delete_button.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    ############################################# Sub-Department #############################################################

    def access_subdpt
      TryWith.attempts(attempts: 3, sleep: 10) do
        mh_department_button.wait_until_present
        mh_department_button.click
        wait_for_db_activity
      end
    end

    def select_subdpt(new_id)
      query_button.click unless department_id_filter.present?
      wait_for_db_activity
      department_id_filter.set new_id
      department_id_filter.click
      send_keys :enter
      wait_for_db_activity
    end

    def access_select_subdpt
      edit_button.click
      wait_for_db_activity
    end

    def create_new_subdpt(new_id, name, dept, buyer, merchandiser, mark_cost, mark_retail, maximum_average, average_tolerance, profit_calc, otb_calc, purchase, total_market_amount)
      actions_dropdown.click
      actions_create_option.click
      wait_for_db_activity
      department_id_field.set new_id
      department_name_field.set name
      dept_dropdown_field.set dept
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      select_list(profit_calc_type_list(profit_calc), profit_calc_type_field, profit_calc)
      wait_for_db_activity
      select_list(otb_calc_type_list(otb_calc), otb_calc_type_field, otb_calc)
      wait_for_db_activity
      select_list(purchase_type_list(purchase), purchase_type_field, purchase)
      wait_for_db_activity
      subdept_buyer_text_field.set buyer
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      subdept_merchandiser_text_field.set merchandiser
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      mark_cost_field.set mark_cost
      send_keys :enter
      wait_for_db_activity
      mark_retail_field.set mark_retail if mark_retail_field.blank?
      wait_for_db_activity
      subdept_total_market_amount_field.set total_market_amount
      wait_for_db_activity
      maximum_average_counter_field.set maximum_average if maximum_average_counter_field.blank?
      wait_for_db_activity
      average_tolerance_field.set average_tolerance if average_tolerance_field.blank?
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def edit_subdpt(name, dept, buyer, merchandiser, mark_cost, mark_retail, maximum_average, average_tolerance, profit_calc, otb_calc, purchase, total_market_amount)
      actions_dropdown.click
      actions_edit_option.click
      wait_for_db_activity
      department_name_field.set name
      send_keys :enter
      dept_dropdown_field.set dept
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      select_list(profit_calc_type_list(profit_calc), profit_calc_type_field, profit_calc)
      wait_for_db_activity
      select_list(otb_calc_type_list(otb_calc), otb_calc_type_field, otb_calc)
      wait_for_db_activity
      select_list(purchase_type_list(purchase), purchase_type_field, purchase)
      wait_for_db_activity
      subdept_buyer_text_field.set buyer
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      subdept_merchandiser_text_field.set merchandiser
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      mark_cost_field.set mark_cost
      send_keys :enter
      wait_for_db_activity
      mark_retail_field.set mark_retail if mark_retail_field.blank?
      wait_for_db_activity
      subdept_total_market_amount_field.set total_market_amount
      wait_for_db_activity
      maximum_average_counter_field.set maximum_average if maximum_average_counter_field.blank?
      wait_for_db_activity
      average_tolerance_field.set average_tolerance if average_tolerance_field.blank?
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def view_subdpt
      view_department_button.wait_until_present.click
      wait_for_db_activity
    end

    def delete_subdpt
      delete_subdpt_button.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
      confirm_delete.click
      wait_for_db_activity
    end

    def subdpt_confirm_delete
      edit_button.click
      wait_for_db_activity
      no_button.click if delete_batch_message.present?
      wait_for_db_activity
      done_button.click
    end

    ############################################# VAT #############################################################

    def access_new_vat
      wait_for_db_activity
      more_actions_dropdown.wait_until_present.click
      wait_for_db_activity
      new_vat_maintenance_option.wait_until_present.click
      wait_for_db_activity
    end

    def access_vat
      wait_for_db_activity
      more_actions_dropdown.wait_until_present.click
      wait_for_db_activity
      vat_maintenance_option.wait_until_present.click
      wait_for_db_activity
    end

    def select_vat(vat_region, vat_code, vat_type)
      query_button.click unless vat_region_filter.present?
      wait_for_db_activity
      vat_region_filter.set vat_region
      vat_region_filter.click
      send_keys :enter
      wait_for_db_activity
      vat_code_filter.set vat_code
      vat_code_filter.click
      send_keys :enter
      wait_for_db_activity
      vat_type_filter.set vat_type
      vat_type_filter.click
      send_keys :enter
      wait_for_db_activity
    end


    def create_vat(region, code, type)
      TryWith.attempts(attempts: 10, sleep: 1) do
        add_vat_button.click
        wait_for_db_activity
      end

      TryWith.attempts(attempts: 10, sleep: 1) do
        vat_region_field.set region
      end
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      sleep 3
      raise 'Vat Region is blank' if vat_region_field.blank?

      vat_type_field.wait_until_present
      TryWith.attempts(attempts: 10, sleep: 1) do
        select_list(vat_type_list(type), vat_type_field, type)
      end
      raise 'Vat type was not selected' if vat_code_field.blank?

      vat_code_field.wait_until_present
      TryWith.attempts(attempts: 10, sleep: 1) do
        vat_code_field.set code
      end
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      sleep 3
      raise 'Vat Code is blank' if vat_code_field.blank?

      sleep 3
      wait_for_db_activity
      TryWith.attempts(attempts: 10, sleep: 1) do
        ok_vat_button.click
      end
      wait_for_db_activity
      sleep 5
    end

    def edit_vat(code)
      edit_vat_button.wait_until_present.click
      wait_for_db_activity
      vat_code_field.wait_until_present
      vat_code_field.set code
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ok_vat_button.click
      wait_for_db_activity
    end

    def save_and_close_subdpt_actions
      TryWith.attempts(attempts: 5, sleep: 5) do
        save_and_close_button.click
        wait_for_db_activity
      end
      TryWith.attempts(attempts: 5, sleep: 5) do
        save_and_close_button.click
        wait_for_db_activity
      end
    end

    def verify_vat(expected_values:)
      if no_results.present?
      else
        @actual_values = vat_list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include? expected_values
      end
    end

    def delete_vat
      delete_button.click
      wait_for_db_activity
      delete_popup.wait_until_present
      ok_button.click
      wait_for_db_activity
    end

    def close_vat
      TryWith.attempts(attempts: 5, sleep: 5) do
        cancel_vat.click
        wait_for_db_activity
      end
    end


    ############################################# Merch Hier Defaults #############################################################

    def access_merch_hier_defaults
      wait_for_db_activity
      TryWith.attempts(attempts: 5, sleep: 5) do
        more_actions_dropdown.wait_until_present.click
        wait_for_db_activity
        merch_hier_defaults_option.wait_until_present.click
        wait_for_db_activity
      end
    end

    def select_merch_hier_defaults(information, subcategory)
      query_button.click unless information_filter.present?
      wait_for_db_activity
      information_filter.set information
      information_filter.click
      #merch_hier_subcategory_filter.set subcategory
      send_keys :enter
      wait_for_db_activity
    end

    def create_merch_hier_defaults(information, merch_hier_category, subcategory)
      TryWith.attempts(attempts: 10, sleep: 0.5) do
        add_button.wait_until_present.click
        wait_for_db_activity
        information_field.wait_until_present
        information_field.set information
        wait_until_enabled(loading_list)
        wait_for_db_activity
        send_keys :enter
        wait_for_db_activity
        merch_hier_category_field.click
        wait_for_db_activity
        merch_hier_category_field.set merch_hier_category
        wait_until_enabled(loading_list)
        wait_for_db_activity
        send_keys :enter
        wait_for_db_activity
        merch_hier_subcategory_field.click
        wait_for_db_activity
        merch_hier_subcategory_field.set subcategory
        wait_until_enabled(loading_list)
        wait_for_db_activity
        send_keys :enter
        wait_for_db_activity
        ok_button.click
        wait_for_db_activity
      end
    end

    def edit_merch_hier_defaults
      edit_merch_hier_button.wait_until_present.click
      wait_for_db_activity
      checkbox_required.click
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
    end

    def verify_merch_hier_defaults(expected_values:)

      if no_results.present?
      else
        @actual_values = []
        @actual_values = merch_hier_defaults_list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include? expected_values
      end
    end

    def delete_merch_hier_defaults
      delete_button.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
    end


  end
end

