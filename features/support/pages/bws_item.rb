require 'test-evolve/core/page_object'

module Pages
  def bws_item
    @bws_item ||= BwsItem.new
  end

  class BwsItem < TestEvolve::Core::PageObject

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
    element(:confrimation_popup) { div(id: /pt_region2:0:m3/) }

    # Logout
    element(:_admin) { a(text: /ADMIN/) }
    element(:_logout) { td(text: 'Logout') }

    #Add From Existing#
    element(:_add_item_popup) { div(id: /pt_region1:0:d2/) }

    # Copy From Existing #
    element(:_vpn) { text_field(label: 'VPN') }
    element(:_item) { text_field(label: 'Item') }
    element(:_supplier) { text_field(label: /Supplier/) }
    element(:_country_source) { text_field(label: 'Country of Sourcing Code') }

    ## UDAs ##
    element(:_udas) { a(text: 'UDAs') }
    element(:_add) { div(id: /rOptDets:udasView:pcUdaWorksheet:b1/) }

    element(:_uda_id_1) { input(id: /pcUdaWorksheet:tUdaWorksheet:0:udaIdWsId::content/).to_subtype }
    element(:_uda_id_2) { input(id: /pcUdaWorksheet:tUdaWorksheet:1:udaIdWsId::content/).to_subtype }
    element(:_uda_val_1) { input(id: /pcUdaWorksheet:tUdaWorksheet:0:udaValueWsId::content/).to_subtype }
    element(:_uda_val_2) { input(id: /pcUdaWorksheet:tUdaWorksheet:1:udaValueWsId::content/).to_subtype }

    ## category verification ##

    element(:_category_search) { a(id: /styleView:class1Id::lovIconId/) }
    element(:_category_lov) { |range| element(xpath: "//div[@id = 'pt1:pt_pt1:pt_region1:0:rOptDets:styleView:class1Id_afrLovInternalTableId::db']/table[1]/tbody/tr[#{range}]/td[2]/div/table/tbody/tr/td/span") }

    ## sub category verification ##
    element(:_sub_category_search) { a(id: /styleView:subclassId1::lovIconId/) }
    element(:_sub_category_lov){|range| element(xpath: "//div[contains(@id,'rOptDets:styleView:subclassId1_afrLovInternalTableId::db')]/table[1]/tbody/tr[#{range}]/td[2]/div/table/tbody/tr/td/span")}

    ## Create ITEM ##
    ## Item ##
    def adds_item_bws(sub_Department, category, sub_category, main_Desc, marketing_Desc, differentiator_1,
                      differentiator_2, supplier_Site, country_of_Sourcing, country_of_Manufacture, port_Of_Lading,
                      cost_Zone_Group_ID, cost, supplier_Pack_Size, inner_Pack_Size, case_pack_qty, packing_method)

      #  bws_shared.add_item_select_options "add_new_item"
      bws_shared.scroll_bws "bottom"

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
      wait_for_db_activity_bws
      _packing_method_opt(packing_method).click
      wait_for_db_activity_bws

      # Auto Generated ID #Independency Purpose
      @item_id_auto_generated = auto_generated_item_id.text
      @item_id_auto_generated
      #Due to defect some field needs to refill
      bws_shared.re_fill_the_empty_field @elements_with_data

      # There are some issue with the diff field and description field which auto blank
      _apply.click
      wait_for_db_activity_bws
      bws_shared.bws_save_and_close
      wait_for_db_activity_bws
      bws_shared.bws_ok
    end

    ## @CopyFromExisting - To Add An ITEM Based On Existing ITEM ##
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

    ## @CopyFromExisting  ##
    def update_copy_from_exsiting_item_details(main_desc, marketing_desc, detailed_desc, supplier_site,
                                               country_of_sourcing, country_of_manufacture, cost_zone_group_id, cost, packing_method, inner_size, case_pack_qty)

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
        #bws_shared.enter_times_bws k, 2
        # Defect while enter 2 or more time in the field and so that
        # to continue test until defect resolve , we will click at another place
        TE.browser.h2(text: /Item Information/).click
      }

      # Auto Generated ID #Independency Purpose
      @item_id_auto_generated = auto_generated_item_id.text

      @item_id_auto_generated
      #Due to defect some field needs to refill
      bws_shared.re_fill_the_empty_field @elements_with_data
      bws_shared.bws_apply
      bws_shared.bws_save_and_close
    end

    #UDAs#
    def add_udas(uda_id_1, uda_id_2, uda_val_1, uda_val_2)
      wait_for_db_activity_bws
      _udas.click
      wait_for_db_activity_bws
      _add.click
      wait_for_db_activity_bws

      _uda_id_1.send_keys uda_id_1
      wait_for_db_activity_bws
      _uda_id_1.send_keys :enter
      wait_for_db_activity_bws

      _uda_val_1.send_keys uda_val_1
      wait_for_db_activity_bws

      _add.click
      wait_for_db_activity_bws

      _uda_id_2.send_keys uda_id_2
      wait_for_db_activity_bws
      _uda_id_2.send_keys :enter
      wait_for_db_activity_bws

      _uda_val_2.send_keys uda_val_2
      wait_for_db_activity_bws
      _uda_val_2.send_keys :enter
      wait_for_db_activity_bws

      _apply.click
      wait_for_db_activity_bws
    end

    ## skus ##
    element(:_skus) { a(text: 'SKUs') }
    element(:_skus_add_option) { td(id: /skusView:pcSkus:ctb2::popArea/) }
    element(:_skus_range_ok) { div(id: /skusView:d19_ok/) }
    element(:_sku_size) { input(id: /sbcSkudiff2::content/) }

    #By Group ,From List
    # Below method select from the "group"
    # to select "From the List" the functionality needs to developed completely

    def add_skus(sku_option, sku_range)
      _skus.click
      wait_for_db_activity_bws
      bws_shared.scroll_bws bottom
      wait_for_db_activity_bws
      _skus_add_option.click
      wait_for_db_activity_bws
      _sku_size.click
      wait_for_db_activity_bws
      _skus_range_ok.click
      wait_for_db_activity_bws
      _apply.click
    end

    ## dimensions ##
    element(:_dimensions) { a(text: 'Dimensions') }
    element(:_dimension_add_button) { div(id: /dimensionView:pcDimension:b1/) }

    def add_dimension
      _dimensions.click
      wait_for_db_activity_bws
      bws_shared.scroll_bws bottom
      wait_for_db_activity_bws
      _dimension_add_button.click
      wait_for_db_activity_bws
      ## further implementation ##
    end

    ## Needs to verify whether this functionalities under development or not ##
    # def location_ranging
    #
    # end
    #
    # def price_by_zone
    #
    # end

    element(:_order_inf_add) { div(id: /rOptDets:ordersView:pc4:ctb1/) }

    ## Implementation Remains ##
    def add_location_ranging

    end

    def add_price_by_zone

    end

    def order_information
      _order_inf_add.present?
      ## Wait the defect to resolve ##
      # Defect ID : MP-951
    end

    ## Please do not move this (-> "delete_created") method to anywhere otherwise it will have an issue to delete created item ##
    def delete_created
      bws_shared.select_task "Buyer Worksheet Group"
      wait_for_db_activity_bws
      retrive_added_item_index @item_id_auto_generated
      wait_for_db_activity_bws
      test_id_check_box(@index_no).click
      wait_for_db_activity_bws
      delete_icon.click
      wait_for_db_activity_bws
      # raise "The Delete Confirmation Message is Not as Expected" if confrimation_popup.text != "Confirmation\n  Are you sure you wish to delete the selected Styles from the Buyer Worksheet"
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


    #-> working
    # -All the listed Buyers Worksheet contained within the Buyers Worksheet Group are exported into Excel
    element(:export_to_excel_button) { div(id: /pt_region1:0:pc1:actb8/) }

    # The download from the remote server part remains
    def verify_bws_excel_sheet
      export_to_excel_button.wait_until(&:present?).click!
    end

    element(:_add_swing_button) { a(id: /rOptDets:styleView:addSwingTags/) }
    #-> 14/01/2020
    # Swing tab
    def add_swing_tag
      ## click on add button
      wait_for_db_activity_bws
      _add_swing_button.click
      wait_for_db_activity_bws
      TE.browser.a(id: /ticketTypeDescId::lovIconId/).click
      wait_for_db_activity_bws
      TE.browser.span(:text, 'Apply').click
      wait_for_db_activity_bws
      bws_shared.bws_save_and_close
      wait_for_db_activity_bws
    end

    def get_category_list(sub_dept)
      #extract all the values displays in the table
      # store in to an array
      # cross verify with data base table
      wait_for_db_activity_bws
      sub_department.send_keys sub_dept
      wait_for_db_activity_bws
      TE.browser.h2(text: /Item Information/).click
      wait_for_db_activity_bws
      @item_id_auto_generated = auto_generated_item_id.text #independency purpose
      wait_for_db_activity_bws
      _category_search.click
      wait_for_db_activity_bws
      sleep 2
      #below method extract text of the first 10 category display in the list and verifying in database
      @category_values = []
      (1..10).each do |i|
        sleep 0.50
        @category_values = @category_values.push (_category_lov(i).text.split("-").first.to_i)
      end
      @category_values
    end

    def get_sub_category_list(sub_dept,category)
      #extract all the values displays in the table
      # store in to an array
      # cross verify with data base table
      wait_for_db_activity_bws
      sub_department.send_keys sub_dept
      wait_for_db_activity_bws
      TE.browser.h2(text: /Item Information/).click
      wait_for_db_activity_bws
      _category.send_keys category
      wait_for_db_activity_bws
      TE.browser.h2(text: /Item Information/).click
      wait_for_db_activity_bws
      @item_id_auto_generated = auto_generated_item_id.text #independency purpose
      wait_for_db_activity_bws
      _sub_category_search.click
      wait_for_db_activity_bws
      sleep 2
      #below method extract text of the first 10 category display in the list and verifying in database
      @sub_category_values = []
      (1..10).each do |i|
        sleep 0.50
        @sub_category_values = @sub_category_values.push (_sub_category_lov(i).text.split("-").first.to_i)
      end
      @sub_category_values
    end

    def after_lov_verification
      bws_shared.bws_ok
      bws_shared.scroll_bws "bottom"
      bws_shared.bws_cancel
      bws_shared.bws_confrim_cancel
      bws_shared.bws_ok
    end

  end
end
