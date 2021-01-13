require 'test-evolve/core/page_object'

module Pages
  def bws_shared
    @bws_shared ||= BwsShare.new
  end

  class BwsShare < TestEvolve::Core::PageObject

    ############################################### Objects ##############################################################

    #Comuns buttons
    element(:add_button) { div(:title, 'Add') }
    element(:create_button) { div(:title, 'Create') }
    element(:edit_button) { div(:id, /_ATp:edit/) }
    element(:delete_button) { a(:title, /Delete/) }
    element(:query_button) { div(:id, /_ATp:_qbeTbr/) }
    element(:ok_button) { div(:text, 'OK') }
    element(:ok_button_1) { span(:text, 'OK') }
    element(:save_and_close_button) { a(:text, /Save and Close/) }
    element(:save_button) { a(:text, 'Save') }
    element(:delete_popup) { div(:text, /delete/) }
    element(:yes_button) { a(:text, 'Yes') }
    element(:no_button) { a(:text, 'No') }
    element(:no_results) { div(:text, 'No data to display.') }
    element(:result_list) { table(:class, 'x17f x184').tbody.table }
    element(:done_button) { a(:text, 'Done') }
    element(:add_details_button) { a(:text, 'Add Details') }
    element(:search_button) { a(:text, 'Search') }
    element(:loading_list) { div(:class, 'AFAutoSuggestBusyStyle') }
    element(:cancel_button) { a(:text, 'Cancel') }
    element(:more_actions_dropdown) { a(:title, 'More Actions') }
    element(:select_more_action_option) { |text| tr(:title, text) }
    element(:close_tab_button) { a(:title, 'Close Tab') }
    element(:clear_all_filters) { a(:title, 'Clear All') }
    element(:tasks_button) { a(:title, 'Tasks') }
    element(:organizational_Hierarchy) { span(:text, 'Organizational Hierarchy') }

    ## Possible Save and Closes ##
    element(:save_and_close_01) { a(:text, /Save and Close/) }
    element(:save_and_close_02) { span(:text, /Save And Close/) }

    ############################################# Methods ##############################################################

    ## Element Repo ##
    element(:buyer_worksheet_button) { a(id: /pt_np2:1:pt_cni1/) }
    #buyers_worksheet
    element(:task) { |text| a(text: text) }


    element(:actions_icon) { a(text: 'Actions') }
    element(:view_icon) { a(text: 'View') }
    element(:format_icon) { a(text: 'Format') }
    element(:add_item_icon) { span(text: 'Add Item') }
    element(:delete_icon) { span(text: 'Delete Selected') }

    # Regarding Add ITEM and it's Options #, pc1:ctb2::popArea
    element(:add_item_arrow) { td xpath: "//td[contains(@_afrpopid,'pc1:mAddNewSku')]" } #just to click
    element(:add_new_item) { td(text: 'Add New Item') }
    element(:add_existing_item) { td(text: 'Add Existing Item') }
    element(:copy_from_existing) { td(text: 'Copy From Existing') }
    # -------------------------------#
    #/Item Upload
    element(:item_upload) { span(text: 'Item Upload') }
    element(:export_invalid_items) { span(text: 'Export Invalid Items') }
    element(:item_download) { span(text: 'Item Download') }
    element(:delete_symbol) { img(id: /pc1:actb4::icon/) }
    element(:delete_selected) { span(text: 'Delete Selected') }
    element(:export_to_excel) { span(text: 'Export to Excel') }
    element(:list_of_worksheet_table) { div(id: /pc1:tStyles::db/) }
    element(:edit_pencil) { img(src: /edit_ena.png/) }
    element(:scroll_option) { input(id: /pt_pt1:pt_region1:0:rOptDets:styleView:itUnitCost::content/) }

    #OK and Submit Button
    element(:bws_ok) { span(text: 'OK') }
    element(:submit_the_buy) { span(text: 'Submit the Buy') }


    ## elements ##
    element(:sub_department) { text_field(label: 'Sub-Department') }
    element(:_category) { text_field(label: 'Category') }
    element(:_sub_category) { text_field(label: 'Sub-Category') }
    element(:_main_desc) { text_field(label: 'Main Desc') }
    element(:_detailed_desc) { text_field(label: 'Detailed Desc') }
    element(:_diff1) { text_field(label: 'Diff1') }
    element(:_diff_group_2_description) { text_field(label: 'Diff Group 2 Description') }
    element(:_special_instructions) { textarea(id: /pt_region1:0:rOptDets:styleView:it8::content/) }
    element(:_supplier_site) { text_field(label: 'Supplier Site') }
    element(:_country_of_sourcing) { text_field(label: 'Country of Sourcing') }
    element(:_country_of_manufacture) { text_field(label: 'Country of Manufacture') }
    element(:_port_of_lading) { text_field(label: 'Port Of Lading') }
    element(:_cost_zone_groupID) { text_field(label: 'Cost Zone Group ID') }
    element(:_cost) { text_field(label: 'Unit Cost') }
    element(:_supplier_pack_size) { text_field(label: 'Supplier Pack Size') }
    element(:_inner_pack_size) { input(id: /itInnerPackSize::content/).to_subtype }
    element(:_case_pack_qty) { text_field(label: 'Case Pack Qty') }
    element(:save_and_close_02) { span(:text, 'Save And Close') }
    element(:_apply) { span(:text, 'Apply') }


    ## PopUp Error
    element(:pop_up_message) { div(id: /d1_msgDlg_cancel/) }

    # ITEM ID - Independent Test
    element(:auto_generated_item_id) { span(id: /rOptDets:styleView:it1::content/) }

    # Elements for Test Extraction ID #
    element(:test_item_desc_ele) { |index_no| element xpath: "//div[contains(@id,'pc1:tStyles::db')]/table/tbody/tr[#{index_no}]/td[9]" }
    element(:test_item_id_ele) { |index_no| element xpath: "//div[contains(@id,'pc1:tStyles::db')]/table/tbody/tr[#{index_no}]/td[8]" }
    element(:test_id_check_box) { |index_no| element xpath: "//div[contains(@id,'pc1:tStyles::db')]/table/tbody/tr[#{index_no}]/td[1]" }

    # Packing Method
    element(:_packing_method) { select(:id, /rOptDets:styleView:soc1::content/) }
    element(:_packing_method_opt) { |text| option(text: text) }

    #Delete Task
    element(:bws_table_check_box) { input(id: /pc1:tStyles:checkboxHeader::content/) }

    # Logout
    element(:_admin) { a(text: /ADMIN/) }
    element(:_logout) { td(text: 'Logout') }

    #Add From Existing#
    element(:_add_item_popup) { div(id: /pt_region1:0:d2/) }

    ############################################################################################################################

    def re_fill_the_empty_field data
      data.each { |k, v|
        if k.value.empty? == true
          clear = k.clear
          wait_for_db_activity_bws
          sleep 1
          k.send_keys v
          wait_for_db_activity_bws
          shared.enter_times_bws k, 2
        end
        _packing_method.click
        _packing_method_opt("Flat").click
      }
    end

    element(:confrimation_popup){div(id: /pt_region2:0:m3/)}

    def delete_created
      select_task "Buyer Worksheet Group"
      wait_for_db_activity_bws
      retrive_added_item_index @item_id_auto_generated
      wait_for_db_activity_bws
      test_id_check_box(@index_no).click
      wait_for_db_activity_bws
      delete_icon.click
      wait_for_db_activity_bws
      raise "The Confirmation Message is Not as Expected" if confrimation_popup.text != "Confirmation\n  Are you sure you wish to delete the selected Styles from the Buyer Worksheet"
      shared.bws_ok
      wait_for_db_activity_bws
      shared.bws_ok
      wait_for_db_activity_bws
      shared.bws_ok
      wait_for_db_activity_bws
    end

    def retrive_added_item_index id
      range = TE.browser.elements(xpath: "//div[contains(@id,'pc1:tStyles::db')]/table/tbody/tr").count
      for i in 1..range
        if test_item_id_ele(i).text.include? id
          @index_no = i #to click the checkbox base on the element
        end
      end
      @index_no.to_s
    end

    def add_item_select_options(option)
      2.times do
        sleep 1
        add_item_arrow.click
      end
      if option == "add_new_item"
        add_new_item.double_click
      elsif option == "add_existing_item"
        add_existing_item.double_click
      elsif option == "copy_from_existing"
        copy_from_existing.double_click
      else
        "Invalid Selection"
      end
    end

    def scroll_bws option
      if option == "top"
        wait_for_db_activity_bws
        TE.browser.td(id: /pt_pt1:pt_region1:0:sdh1::_afrStr/).click
      elsif option == "bottom"
        wait_for_db_activity_bws
        TE.browser.div(id: /pt_pt1:pt_region1:0:rOptDets:0:t6/).click
      else
        "Invalid Selection"
      end
    end

    def select_task task
      buyer_worksheet_button.wait_until(&:present?).click!
      task(task).wait_until(&:present?).click!
    end


    def log_out_from_bws
      _admin.click
      _logout.click
    end

    def bws_ok
      sleep 2
      if TE.browser.div(id: /d4_ok/).present?
        2.times do
          TE.browser.div(id: /d4_ok/).click
        end
      elsif TE.browser.div(id: /d9_ok/).present?
        TE.browser.div(id: /d9_ok/).click

      elsif TE.browser.div(id: /pc1:ctb1/).present?
        TE.browser.div(id: /pc1:ctb1/).click

      elsif TE.browser.span(text: 'OK').present?
        TE.browser.span(text: 'OK').click

      elsif TE.browser.div(id: /pt_region1:0:b7/).present?
        TE.browser.div(id: /pt_region1:0:b7/).click
      else
        raise "Element not Present"
      end
    end


    def bws_cancel
      if TE.browser.span(text: 'Cancel').present?
        TE.browser.span(text: 'Cancel').click
      end
    end

    def bws_apply
      if TE.browser.span(text: 'Apply').present?
        TE.browser.span(text: 'Apply').click
      end
    end

    def bws_save_and_close
      if TE.browser.span(text: 'Save And Close').present?
        TE.browser.span(text: 'Save And Close').click
      end
    end

  end
end