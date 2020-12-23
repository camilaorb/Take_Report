require 'test-evolve/core/page_object'

module Pages
  def bws_items_01
    @bws_items_01 ||= Bws_items_01.new
  end

  class Bws_items_01 < TestEvolve::Core::PageObject

    include Pages

    ## Element Repo ##
    element(:buyer_worksheet_button) { a(id: /pt_np2:1:pt_cni1/) }
    #buyers_worksheet
    element(:task) { |text| a(text: text) }


    element(:actions_icon) { a(text: 'Actions') }
    element(:view_icon) { a(text: 'View') }
    element(:format_icon) { a(text: 'Format') }
    element(:add_item_icon) { span(text: 'Add Item') }

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
    element(:save_and_close_02) { span(:text, 'Save And Close') }

    ## PopUp Error
    element(:pop_up_message) { div(id: /d1_msgDlg_cancel/) }

    # ITEM ID - Independent Test
    element(:auto_generated_item_id) { span(id: /rOptDets:styleView:it1::content/) }

    # verify the items options are available #
    def verify_list_of_top_bar_items
      sleep 2
      list_of_item = [actions_icon, view_icon, format_icon, add_item_icon,
                      item_upload, export_invalid_items,
                      item_download, delete_symbol, delete_selected, export_to_excel]
      list_of_item.each do |item|
        raise "#{item.inspect} is not Present in the ITEM LIST" if item.present? == false
      end

      sleep 2
      wait_for_db_activity_bws
      add_item_arrow.wait_until(&:present?).double_click
      wait_for_db_activity_bws

      options_of_add_items = [add_new_item, add_existing_item, copy_from_existing]
      options_of_add_items.each do |item|
        raise "#{item.inspect} is not Present in the ITEM LIST" if item.present? == false
      end
    end

    def verify_list_of_worksheet_table
      list_of_worksheet_table.present?
      edit_pencil.present?
    end

    def verify_submit_ok_buttons
      bws_ok.present?
      submit_the_buy.present?
    end

    ## 18/12/2020
    def adds_item_bws(sub_Department, category, sub_category, main_Desc, marketing_Desc, differentiator_1,
                      differentiator_2, supplier_Site, country_of_Sourcing, country_of_Manufacture, port_Of_Lading,
                      cost_Zone_Group_ID, cost, supplier_Pack_Size, inner_Pack_Size)

      sleep 5
      6.times do
        add_item_arrow.click
      end
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
                             _port_of_lading => port_Of_Lading,
                             _cost_zone_groupID => cost_Zone_Group_ID,
                             _cost => cost,
                             _supplier_pack_size => supplier_Pack_Size,
      }

      ## Found something strange
      # re-start from here
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
    end

    def re_fill_the_empty_field
      @elements_with_data.each { |k, v|
        if k.value.empty? == true
          clear = k.clear
          wait_for_db_activity_bws
          sleep 1
          k.send_keys v
          wait_for_db_activity_bws
          #shared.enter_times_bws k, 2
          # Defect while enter 2 or more time in the field and so that
          # to continue test until defect resolve , we will click at another place
          TE.browser.h2(text: /Item Information/).click
          if pop_up_message.present? == true
            pop_up_message.click
          end
        end
      }

      # Auto Generated ID #Independency Purpose
      @item_id_auto_generated = auto_generated_item_id.text

      # There are some issue with the diff field and dexcription field which auto blank
      save_and_close_02.click
      shared.bws_ok
    end


    element(:bws_table_check_box) { input(id: /pc1:tStyles:checkboxHeader::content/) }

    #-> working
    def delete_created
      select_task "Buyer Worksheet Group"
      retrive_added_item_id
      @item_id
    end

    ## ReUsables ##
    def add_item_select_options(option)
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

    def retrive_added_item_id
      range = TE.browser.table(summary: 'list of worksheet styles').tbody.trs.size
      for i in 0..range
        if TE.browser.table(summary: 'list of worksheet styles').tbody.trs[i].tds[12].text.include? "Sachin"
          @item_id = TE.browser.table(summary: 'list of worksheet styles').tbody.trs[i].tds[11].text
        end
      end
    end

  end
end
#> TE.browser.a(xpath: "//a[contains(@href,'100Metalico')]").present?