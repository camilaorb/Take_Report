require 'test-evolve/core/page_object'

module Pages
  def bws_item_menu
    @bws_item_menu ||= BwsItemMenu.new
  end

  class BwsItemMenu < TestEvolve::Core::PageObject

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
    element(:item_upload) { span(text: 'Item & Ordering Upload') }
    # element(:export_invalid_items) { span(text: 'Export Invalid Items') }
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

    # verify the items options are available #
    def verify_list_of_top_bar_items
      sleep 2
      list_of_item = [actions_icon, view_icon, format_icon, add_item_icon,
                      item_upload, export_to_excel,
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

    def verify_add_item_popup
      wait_for_db_activity_bws
      raise "The PopUp To Search From Approved Not Present" if _add_item_popup.present? == false
      wait_for_db_activity_bws
      sleep 2
      wait_for_db_activity_bws
      TE.browser.div(id: /pt_pt1:pt_region1:0:b8/).click
      wait_for_db_activity_bws
    end

    def add_item_select_options(option)
      4.times do
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








  end
end