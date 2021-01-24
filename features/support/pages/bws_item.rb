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
    element(:item_element) { |text| text_field(label: text) }


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
    element(:_total_category) { elements(xpath: "//div[@id = 'pt1:pt_pt1:pt_region1:0:rOptDets:styleView:class1Id_afrLovInternalTableId::db']/table[1]/tbody/tr/td[2]/div/table/tbody/tr/td/span") }

    ## sub category verification ##
    element(:_sub_category_search) { a(id: /styleView:subclassId1::lovIconId/) }
    element(:_sub_category_lov) { |range| element(xpath: "//div[@id = 'pt1:pt_pt1:pt_region1:0:rOptDets:styleView:subclassId1_afrLovInternalTableId::db']/table[1]/tbody/tr[#{range}]/td[2]/div/table/tbody/tr/td/span") }
    element(:_total_sub_category) { elements(xpath: "//div[@id = 'pt1:pt_pt1:pt_region1:0:rOptDets:styleView:subclassId1_afrLovInternalTableId::db']/table[1]/tbody/tr/td[2]/div/table/tbody/tr/td/span") }


    ############################################# Methods ##############################################################

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
    end

    def to_be_complete_steps
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

    element(:_uda_id_description_text) { |id| span(id: /udasView:pcUdaWorksheet:tUdaWorksheet:#{id}:itUdaIdDescWs::content/) }
    element(:_uda_id_search_button) { |id| a(id: /udasView:pcUdaWorksheet:tUdaWorksheet:#{id}:udaIdWsId::lovIconId/) }
    element(:_uda_id_search_field) { |id| input(id: /tUdaWorksheet:#{id}:udaIdWsId_afrLovInternalQueryId:val00::content/).to_subtype }
    element(:_uda_id_ok) {|id| div(id: /pcUdaWorksheet:tUdaWorksheet:#{id}:udaIdWsId_afrLovDialogId_ok/) }
    element(:_uda_value_search_button) { |id| a(id: /udasView:pcUdaWorksheet:tUdaWorksheet:#{id}:udaValueWsId::lovIconId/) }
    element(:_uda_value_search_field) { |id| input(id: /tUdaWorksheet:#{id}:udaValueWsId_afrLovInternalQueryId:val00::content/).to_subtype }
    element(:_uda_value_ok) {|val| div(id: /pcUdaWorksheet:tUdaWorksheet:#{val}:udaValueWsId_afrLovDialogId_ok/) }
    element(:_select_from_lov){|text| element(text: text)}
    #UDAs#
    def add_udas(uda_id_0, uda_id_1, uda_val_0, uda_val_1)
      no_of_uda = BwsItem.new.method(:add_udas).arity - 3

      (0..no_of_uda).each do |i|

        if i==0
          uda_id  = uda_id_0
          uda_value = uda_val_0
        elsif i == 1
          uda_id  = uda_id_1
          uda_value = uda_val_1
        end

        wait_for_db_activity_bws
        _udas.click
        wait_for_db_activity_bws
        _add.click
        wait_for_db_activity_bws

        # UDA ID LOV verification
        _uda_id_search_button(i).click
        wait_for_db_activity_bws
        _uda_id_search_field(i).send_keys uda_id
        wait_for_db_activity_bws
        _uda_id_search_field(i).send_keys :enter
        wait_for_db_activity_bws
        _select_from_lov(uda_id).click
        wait_for_db_activity_bws
        _uda_id_ok(i).click
        wait_for_db_activity_bws

        # Description verification
        raise "The UDA #{uda_id} Description Not Displayed " if _uda_id_description_text(i).present? == false

        # UDA value LOV verification
        _uda_value_search_button(i).click
        wait_for_db_activity_bws
        _uda_value_search_field(i).send_keys uda_value
        wait_for_db_activity_bws
        _uda_value_search_field(i).send_keys :enter
        wait_for_db_activity_bws
        _select_from_lov(uda_value).click
        wait_for_db_activity_bws
        _uda_value_ok(i).click
        wait_for_db_activity_bws
      end

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
      total_category = _total_category.count
      @category_values = []
      (1..total_category).each do |i|
        sleep 0.50
        # This condition will not take any blank value in LOV , because some 'tr' is present but not shows any values
        if _category_lov(i).text.empty? == false
          @category_values = @category_values.push (_category_lov(i).text.split("-").first.to_i)
        end
      end
      @category_values
    end

    def get_sub_category_list(sub_dept, category)
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

      (1.._total_sub_category.count).each do |i|
        sleep 0.50
        # This condition will not take any blank value in LOV , because some 'tr' is present but not shows any values
        if _sub_category_lov(i).text.empty? == false
          @sub_category_values = @sub_category_values.push (_sub_category_lov(i).text.split("-").first.to_i)
        end
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

    def character_limit_insert(element, no)
      wait_for_db_activity_bws
      item_element(element).send_keys SecureRandom.alphanumeric(no.to_i)
      wait_for_db_activity_bws
      TE.browser.h2(text: /Item Information/).click
    end

    def character_limit_cont(element, no)
      wait_for_db_activity_bws
      no_character = item_element(element).value.size
      raise "Invalid numbers of characters. Expected:'#{no}' Actual:'#{no_character}'" unless no_character == no.to_i
    end

    def item_id
      @item_id_auto_generated = auto_generated_item_id.text
    end


    ##[CB]-working
    def bws_item_check_fields(val1, val2) end

    ## Swing Tags Methods ##
    element(:_add_swing_button) { a(id: /rOptDets:styleView:addSwingTags/) }
    element(:_swing_tag_field) { input(id: /rOptDets:styleView:t3:0:ticketTypeDescId::content/).to_subtype }
    element(:_swing_tag_multi_field) { |field| input(id: /rOptDets:styleView:t3:#{field}:ticketTypeDescId::content/).to_subtype }
    #rOptDets:styleView:t3:3:ticketTypeDescId::content
    #rOptDets:styleView:t3:4:ticketTypeDescId::content
    # Swing tab
    def add_swing_tag swing_tag_01
      wait_for_db_activity_bws
      bws_shared.scroll_bws "bottom"
      wait_for_db_activity_bws
      @item_id_auto_generated = auto_generated_item_id.text #independency purpose
      wait_for_db_activity_bws
      _add_swing_button.click
      wait_for_db_activity_bws
      _swing_tag_field.clear
      wait_for_db_activity_bws
      _swing_tag_field.send_keys swing_tag_01
      wait_for_db_activity_bws
      # due to defect we will click somewhere else
      #_swing_tag_field.send_keys :enter
      TE.browser.h2(text: /Item Information/).click

      wait_for_db_activity_bws
      bws_shared.bws_cancel
      wait_for_db_activity_bws
      bws_shared.bws_confrim_cancel
      wait_for_db_activity_bws
      bws_shared.bws_ok
      wait_for_db_activity_bws
    end

    def verify_swing_tag_add_button_disappears(swing_tags)
      wait_for_db_activity_bws
      bws_shared.scroll_bws "bottom"
      wait_for_db_activity_bws
      @item_id_auto_generated = auto_generated_item_id.text #independency purpose
      wait_for_db_activity_bws

      swing_tags.each do |swing_tag|
        _add_swing_button.click
        wait_for_db_activity_bws
        _swing_tag_multi_field(swing_tags.index(swing_tag)).clear
        wait_for_db_activity_bws
        _swing_tag_multi_field(swing_tags.index(swing_tag)).send_keys swing_tag
        wait_for_db_activity_bws
        # due to defect we will click somewhere else
        #_swing_tag_multi_field(@swing_tags.index(swing_tag)).send_keys :enter
        TE.browser.h2(text: /Item Information/).click
        wait_for_db_activity_bws
      end
      #verify the Add Swing Tag Button Disapeear
      raise "The Add Swing Tag Button Does Not Disappear" if _add_swing_button.present? == true
      bws_shared.bws_cancel
      wait_for_db_activity_bws
      bws_shared.bws_confrim_cancel
      wait_for_db_activity_bws
      bws_shared.bws_ok
      wait_for_db_activity_bws
    end

    element(:_supplier_site_search) { a(id: /rOptDets:styleView:supplierSiteDesc1Id::lovIconId/) }
    element(:_select_supplier_site_from_lov) { |supplier_site| element(xpath: "//span[text()='#{supplier_site}']") }
    element(:_supplier_site_lov_search_field) { input(id: /styleView:supplierSiteDesc1Id_afrLovInternalQueryId:val00::content/).to_subtype }
    element(:_supplier_site_total_lov) { elements(xpath: "//div[contains(@id,'rOptDets:styleView:supplierSiteDesc1Id_afrLovInternalTableId::db')]/table[1]/tbody/tr/td[2]/div/table/tbody/tr/td/span") }
    element(:_supplier_site_lov) { |index_no| element(xpath: "//div[contains(@id,'rOptDets:styleView:supplierSiteDesc1Id_afrLovInternalTableId::db')]/table[1]/tbody/tr[#{index_no}]/td[2]/div/table/tbody/tr/td/span") }
    element(:_error_message_popup) { |text| div(text: 'Messages for this page are listed below.').parent.table.tbody.tr.td.a(text: text) }
    element(:_error_message_popup_ok) { div(id: 'd1_msgDlg_cancel') }
    #-> @WIP
    def verify_supplier_site(sub_Department, category, sub_category, main_Desc, marketing_Desc, differentiator_1,
                             differentiator_2, supplier_Site, predictive_suggestion)

      bws_shared.scroll_bws "bottom"

      ## Fill The Details ##
      @elements_with_data = {sub_department => sub_Department,
                             _category => category,
                             _sub_category => sub_category,
                             _main_desc => main_Desc,
                             _detailed_desc => "test",
                             _diff1 => differentiator_1,
                             _diff_group_2_description => differentiator_2,
                             _special_instructions => "Test Order"
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


      #verification -1 : error message with mandatory field
      bws_shared.bws_save_and_close
      wait_for_db_activity_bws
      _error_message_popup("Supplier Site").present?
      wait_for_db_activity_bws
      _error_message_popup_ok.click

      #verification -2 : to select from the lov
      _supplier_site_search.click
      wait_for_db_activity_bws
      _select_supplier_site_from_lov(supplier_Site).click
      wait_for_db_activity_bws

      #verification -3 : Predictive suggestion available
      _supplier_site_lov_search_field.clear
      wait_for_db_activity_bws
      _supplier_site_lov_search_field.send_keys predictive_suggestion
      wait_for_db_activity_bws
      _supplier_site_lov_search_field.send_keys :enter
      wait_for_db_activity_bws

      ## Below  method will verify the Predictive Text match with the LOV displays
      (1.._supplier_site_total_lov.count).each do |i|
        sleep 0.50
        # This condition will not take any blank value in LOV
        if _supplier_site_lov(i).text.empty? == false
          raise "predictive suggestion does not match" unless _supplier_site_lov(i).text.include? predictive_suggestion
        end
      end

      #.click
      bws_shared.bws_ok
      wait_for_db_activity_bws

      #delete the ID
      @item_id_auto_generated = auto_generated_item_id.text

      bws_shared.bws_cancel
      wait_for_db_activity_bws
      bws_shared.bws_confrim_cancel
      wait_for_db_activity_bws
    end

    element(:_country_of_sourcing_search) { a(id: /rOptDets:styleView:countrySourcingDescId::lovIconId/) }
    element(:_select_country_of_sourcing_from_lov) { |cos| element(xpath: "//span[text()='#{cos}']") }
    element(:_country_of_source_search_field) { input(id: /styleView:countrySourcingDescId_afrLovInternalQueryId:val00::content/).to_subtype }
    element(:_country_of_source_total_lov) { elements(xpath: "//div[contains(@id,'rOptDets:styleView:countrySourcingDescId_afrLovInternalTableId::db')]/table[1]/tbody/tr/td[2]/div/table/tbody/tr/td/span") }
    element(:_country_of_source_lov) { |index_no| element(xpath: "//div[contains(@id,'rOptDets:styleView:countrySourcingDescId_afrLovInternalTableId::db')]/table[1]/tbody/tr[#{index_no}]/td[2]/div/table/tbody/tr/td/span") }
    element(:_cos_lov_ok) { div(id: /countrySourcingDescId_afrLovDialogId_ok/) }

    def verify_source_country(sub_Department, category, sub_category, main_Desc, marketing_Desc, differentiator_1,
                              differentiator_2, supplier_Site, source_country, predictive_suggestion)

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
                             _supplier_site => supplier_Site
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


      #verification -1 : error message with mandatory field
      bws_shared.bws_save_and_close
      wait_for_db_activity_bws
      _error_message_popup("Country of Sourcing").present?
      wait_for_db_activity_bws
      _error_message_popup_ok.click

      #verification -2 : to select from the lov
      _country_of_sourcing_search.click
      wait_for_db_activity_bws
      _select_country_of_sourcing_from_lov(source_country).click
      wait_for_db_activity_bws

      #verification -3 : Predictive suggestion available
      _country_of_source_search_field.clear
      wait_for_db_activity_bws
      _country_of_source_search_field.send_keys predictive_suggestion
      wait_for_db_activity_bws
      _country_of_source_search_field.send_keys :enter
      wait_for_db_activity_bws

      ## Below  method will verify the Predictive Text match with the LOV displays
      (1.._country_of_source_total_lov.count).each do |i|
        sleep 0.50
        # This condition will not take any blank value in LOV
        if _country_of_source_lov(i).text.empty? == false
          raise "predictive suggestion does not match" unless _country_of_source_lov(i).text.include? predictive_suggestion
        end
      end

      #.click
      _cos_lov_ok.click
      wait_for_db_activity_bws

      #delete the ID
      @item_id_auto_generated = auto_generated_item_id.text

      bws_shared.bws_cancel
      wait_for_db_activity_bws
      bws_shared.bws_confrim_cancel
      wait_for_db_activity_bws
    end

    element(:_country_of_manufacture_search) { a(id: /rOptDets:styleView:countryManufactureDesc1Id::lovIconId/) }
    element(:_select__country_of_manufacture_from_lov) { |cos| element(xpath: "//span[text()='#{cos}']") }
    element(:_country_of_manufacture_search_field) { input(id: /styleView:countryManufactureDesc1Id_afrLovInternalQueryId:val00::content/).to_subtype }
    element(:_country_of_manufacture_total_lov) { elements(xpath: "//div[contains(@id,'rOptDets:styleView:countryManufactureDesc1Id_afrLovInternalTableId::db')]/table[1]/tbody/tr/td[2]/div/table/tbody/tr/td/span") }
    element(:_country_of_manufacture_lov) { |index_no| element(xpath: "//div[contains(@id,'rOptDets:styleView:countryManufactureDesc1Id_afrLovInternalTableId::db')]/table[1]/tbody/tr[#{index_no}]/td[2]/div/table/tbody/tr/td/span") }
    element(:_com_lov_ok) { div(id: /countryManufactureDesc1Id_afrLovDialogId_ok/) }

    def verify_country_of_manufacture(sub_Department, category, sub_category, main_Desc, marketing_Desc, differentiator_1,
                                      differentiator_2, supplier_Site, source_country, manufacture_country, predictive_country_of_manufacture)

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
                             _country_of_sourcing => source_country
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

      #verification -1 : error message with mandatory field
      bws_shared.bws_save_and_close
      wait_for_db_activity_bws
      _error_message_popup("Country of Manufacture").present?
      wait_for_db_activity_bws
      _error_message_popup_ok.click

      #verification -2 : to select from the lov
      _country_of_sourcing_search.click
      wait_for_db_activity_bws
      _select_country_of_sourcing_from_lov(manufacture_country).click
      wait_for_db_activity_bws

      #verification -3 : Predictive suggestion available
      _country_of_source_search_field.clear
      wait_for_db_activity_bws
      _country_of_source_search_field.send_keys predictive_country_of_manufacture
      wait_for_db_activity_bws
      _country_of_source_search_field.send_keys :enter
      wait_for_db_activity_bws

      ## Below  method will verify the Predictive Text match with the LOV displays
      (1.._country_of_source_total_lov.count).each do |i|
        sleep 0.50
        # This condition will not take any blank value in LOV
        if _country_of_source_lov(i).text.empty? == false
          raise "predictive suggestion does not match" unless _country_of_source_lov(i).text.include? predictive_country_of_manufacture
        end
      end

      #.click
      _com_lov_ok.click
      wait_for_db_activity_bws

      #delete the ID
      @item_id_auto_generated = auto_generated_item_id.text

      bws_shared.bws_cancel
      wait_for_db_activity_bws
      bws_shared.bws_confrim_cancel
      wait_for_db_activity_bws
    end


    element(:_port_of_landing_search) { a(id: /rOptDets:styleView:ladingPortDescId::lovIconId/) }
    element(:_select_port_of_landing_from_lov) { |cos| element(xpath: "//span[text()='#{cos}']") }
    element(:_port_of_landing_search_field) { input(id: /styleView:ladingPortDescId_afrLovInternalQueryId:val00::content/).to_subtype }
    element(:_port_of_landing_total_lov) { elements(xpath: "//div[contains(@id,'rOptDets:styleView:ladingPortDescId_afrLovInternalTableId::db')]/table[1]/tbody/tr/td[2]/div/table/tbody/tr/td[2]/span") }
    element(:_port_of_landing_lov) { |index_no| element(xpath: "//div[contains(@id,'rOptDets:styleView:ladingPortDescId_afrLovInternalTableId::db')]/table[1]/tbody/tr[#{index_no}]/td[2]/div/table/tbody/tr/td[2]/span") }
    element(:_pol_lov_ok) { div(id: /ladingPortDescId_afrLovDialogId_ok/) }
    ## port of landing ##
    def verify_port_of_landing(sub_Department, category, sub_category, main_Desc, marketing_Desc, differentiator_1,
                               differentiator_2, supplier_Site, source_country, manufacture_country, port_of_lading, predictive_port_of_landing)

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
                             _country_of_sourcing => source_country,
                             _country_of_manufacture => manufacture_country
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

      #verification -1 : error message with mandatory field
      bws_shared.bws_save_and_close
      wait_for_db_activity_bws
      _error_message_popup("Port Of Lading").present?
      wait_for_db_activity_bws
      _error_message_popup_ok.click

      #verification -2 : to select from the lov
      _port_of_landing_search.click
      wait_for_db_activity_bws
      _select_port_of_landing_from_lov(port_of_lading).click
      wait_for_db_activity_bws

      #verification -3 : Predictive suggestion available
      _port_of_landing_search_field.clear
      wait_for_db_activity_bws
      _port_of_landing_search_field.send_keys predictive_port_of_landing
      wait_for_db_activity_bws
      _port_of_landing_search_field.send_keys :enter
      wait_for_db_activity_bws

      ## Below  method will verify the Predictive Text match with the LOV displays
      (1.._port_of_landing_total_lov.count).each do |i|
        sleep 0.50
        # This condition will not take any blank value in LOV
        if _port_of_landing_lov(i).text.empty? == false
          raise "predictive suggestion does not match" unless _port_of_landing_lov(i).text.include? predictive_port_of_landing
        end
      end

      #.click
      _pol_lov_ok.click
      wait_for_db_activity_bws

      #delete the ID
      @item_id_auto_generated = auto_generated_item_id.text

      bws_shared.bws_cancel
      wait_for_db_activity_bws
      bws_shared.bws_confrim_cancel
      wait_for_db_activity_bws

    end

  end
end
