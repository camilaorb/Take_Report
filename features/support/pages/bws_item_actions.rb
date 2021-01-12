require 'test-evolve/core/page_object'

module Pages
  def bws_item_actions
    @bws_item_actions ||= BwsItemActions.new
  end

  class BwsItemActions < TestEvolve::Core::PageObject

    include Pages

    ############################################### Objects ##############################################################

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

    ############################################# Methods ##############################################################

    def adds_item_bws(sub_Department, category, sub_category, main_Desc, marketing_Desc, differentiator_1,
                      differentiator_2, supplier_Site, country_of_Sourcing, country_of_Manufacture, port_Of_Lading,
                      cost_Zone_Group_ID, cost, supplier_Pack_Size, inner_Pack_Size, case_pack_qty, packing_method)

      add_item_select_options "add_new_item"
      scroll_bws "bottom"

      ## Fill The Details ##
      @elements_with_data = {sub_department => sub_Department,
                             _category => category,
                             _sub_category => sub_category,
                             _main_desc => main_Desc,
                             _detailed_desc => "test",
                             _diff1 => differentiator_1,
                             _diff_group_2_description => differentiator_2,
                             _special_instructions => "Test Order",
                             _supplier_site => supplier_Site,
                             _country_of_sourcing => country_of_Sourcing,
                             _country_of_manufacture => country_of_Manufacture,
                             _cost_zone_groupID => cost_Zone_Group_ID,
                             _cost => cost,
                             _case_pack_qty => case_pack_qty
      }

      @elements_with_data.each { |k, v|
        k.clear
        wait_for_db_activity_bws
        sleep 1
        k.send_keys v
        wait_for_db_activity_bws
        #shared.enter_times_bws k, 2
        # Defect while enter 2 or more time in the field and so that
        # to continue test until defect resolve , we will click at another place
        TE.browser.h2(text: /Item Information/).click
      }

      _packing_method.click
      _packing_method_opt(packing_method).click


      # Auto Generated ID #Independency Purpose
      @item_id_auto_generated = auto_generated_item_id.text

      @item_id_auto_generated
      #Due to defect some field needs to refill
      re_fill_the_empty_field @elements_with_data

      # There are some issue with the diff field and dexcription field which auto blank
      _apply.click
      save_and_close_02.click
      sleep 2
      wait_for_db_activity_bws
      shared.bws_ok
    end

    ## ADD ITEM from Existing & Copy From Existing ITEM VERIFICATION ##
    def verify_add_item_popup
      wait_for_db_activity_bws
      raise "The PopUp To Search From Approved Not Present" if _add_item_popup.present? == false
      wait_for_db_activity_bws
      sleep 1
      shared.bws_cancel
      wait_for_db_activity_bws
      log_out_from_bws
    end


    #->working

    element(:_vpn) { text_field(label: 'VPN') }
    element(:_item) { text_field(label: 'Item') }
    element(:_supplier) { text_field(label: /Supplier/) }
    element(:_country_source) { text_field(label: 'Country of Sourcing Code') }

    def existing_item_details(item_id, supplier, country_of_source)
      wait_for_db_activity_bws
      _item.send_keys item_id, :enter
      wait_for_db_activity_bws
      _supplier.send_keys supplier, :enter
      wait_for_db_activity_bws
      _country_source.send_keys country_of_source, :enter
      wait_for_db_activity_bws
      TE.browser.div(id: /pt_region1:0:b7/).click
    end

    element(:_maerketing_description) { text_field(label: 'Marketing Desc') }

    def update_copy_from_exsiting_item_details(main_desc, marketing_desc, detailed_desc, supplier_site,
                                               country_of_sourcing, country_of_manufacture, cost_zone_group_id,
                                               cost, packing_method, inner_size, case_pack_qty)

      ## Fill The Details ##
      @elements_with_data = {
          _main_desc => main_desc,
          _maerketing_description => marketing_desc,
          _detailed_desc => detailed_desc,
          _special_instructions => "Test Order",
          _supplier_site => supplier_site,
          _country_of_sourcing => country_of_sourcing,
          _country_of_manufacture => country_of_manufacture,
          _cost_zone_groupID => cost_zone_group_id,
          _cost => cost,
          _case_pack_qty => case_pack_qty
      }
      @elements_with_data.each { |k, v|
        k.clear
        wait_for_db_activity_bws
        sleep 1
        k.send_keys v
        wait_for_db_activity_bws
        #shared.enter_times_bws k, 2
        # Defect while enter 2 or more time in the field and so that
        # to continue test until defect resolve , we will click at another place
        TE.browser.h2(text: /Item Information/).click
      }

      # Auto Generated ID #Independency Purpose
      @item_id_auto_generated = auto_generated_item_id.text

      @item_id_auto_generated
      #Due to defect some field needs to refill
      re_fill_the_empty_field @elements_with_data
      shared.bws_apply
      shared.bws_save_and_close
    end


    ## ReUsables ##
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


    ##- ---------------  Working ----------------------------- -##

    def retrive_added_item_index id
      range = TE.browser.elements(xpath: "//div[contains(@id,'pc1:tStyles::db')]/table/tbody/tr").count
      for i in 1..range
        if test_item_id_ele(i).text.include? id
          @index_no = i #to click the checkbox base on the element
        end
      end
      @index_no.to_s
    end

    ## -----------------------------------------------------------------------------##


  end
end