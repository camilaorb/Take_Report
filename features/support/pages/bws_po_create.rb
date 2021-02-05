require 'test-evolve/core/page_object'

module Pages
  def bws_po_create
    @bws_po_create ||= BwsPoCreate.new
  end

  class BwsPoCreate < TestEvolve::Core::PageObject

    include Pages

    ############################################### Objects ##############################################################

    ## Element Repo ##
    element(:buyer_worksheet_button) { a(id: /pt_np2:1:pt_cni1/) }

    #buyers_worksheet
    element(:task) { |text| a(text: text) }


    element(:actions_icon) { a(text: 'Actions') }
    element(:view_icon) { a(text: 'View') }
    element(:format_icon) { a(text: 'Format') }
    element(:add_order_icon) { img(id: /ordersView:pc4:ctb1::icon/) }
    element(:delete_order_icon) { img(id: /ordersView:pc4:b1::icon/) }
    element(:edit_icon) { img(id: /cil1::icon/) } #Edit Icon for the Selected ITEM
    element(:bws_ok) { span(text: 'OK') }
    element(:cancel_button) { div(:id, /rOptDets:0:ctb7/) }
    element(:yes_button) { span(text: 'Yes') }
    element(:apply) { div(:id, /rOptDets:0:ctb5/) }


    # Regarding Add ITEM and it's Options #, pc1:ctb2::popArea
    element(:add_item_arrow) { td xpath: "//td[contains(@_afrpopid,'pc1:mAddNewSku')]" } #just to click
    element(:add_new_item) { td(text: 'Add New Item') }
    element(:add_existing_item) { td(text: 'Add Existing Item') }
    element(:copy_from_existing) { td(text: 'Copy From Existing') }
    # -------------------------------#

    #OK and Submit Button

    element(:submit_the_buy) { span(text: 'Submit the Buy') }

    #Delete Task
    element(:bws_table_check_box) { input(id: /pc1:tStyles:checkboxHeader::content/) }
    element(:confrimation_popup) { div(id: /pt_region2:0:m3/) }

    #Order Information
    element(:order_info_tab) { div(id: /rOptDets:ordersView:pc4:t1::db/) }
    element(:delete_order_confirm_msgm) { div(:text, /Are you sure you wish to delete/) }
    element(:split_delivery_icon) { span(:text, 'Split Delivery') }
    element(:alert_order_delivery_drop_msgm) { div(:text, /Are you sure you wish to delete/) }
    element(:must_be_number_msgm) { div(:text, /The value must be a number/) }
    element(:can_be_zero) { div(:text, /All Delivery Drops must have a non-zero quantity/) }
    element(:field_error) { div(:class, 'p_AFError x1u') }



    #order_information_tab
    element(:checkbox_order_info) { |row| input(id: /rOptDets:ordersView:pc4:t1:#{row}:sbc1::content/) }
    element(:order_number) { |row| div(:id, /rOptDets:ordersView:pc4:t1::db/).trs(:class, 'x13q')[row].tds[2].text }
    element(:order_ref_id) { |row| div(:id, /rOptDets:ordersView:pc4:t1::db/).trs(:class, 'x13q')[row].tds[3].text }
    element(:checkbox_swing_tag_req) { |row| input(id: /rOptDets:ordersView:pc4:t1:#{row}:sbc2::content/) }
    element(:input_delivery_drop_qty) { |row| text_field(id: /rOptDets:ordersView:pc4:t1:#{row}:it2::content/) }
    # element(:field_location_list) { |row| text_field(id: /rOptDets:ordersView:pc4:t1:#{row}:it2::content/) }
    # element(:field_location_list) { |row| text_field(id: /rOptDets:ordersView:pc4:t1:#{row}:it2::content/) }
    # element(:location_type) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].select_list(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:socLocType::content/) }
    # element(:location_id) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].text_field(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:ilov1::content/) }
    # element(:not_before_date) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].text_field(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:idNotBeforeDate::content/) }
    # element(:not_after_date) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].text_field(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:idNotAfterDate::content/) }
    # element(:earliest_ship_date) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].text_field(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:id1::content/) }
    # element(:latest_ship_date) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].text_field(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:idLatestShipDate::content/) }

    # element(:average_location) { text_field(:id, /rOptDets:ordersView:itAvgAllocQty::content/) }




    ############################################# Methods ##############################################################

    def add_order_information_bws
      add_order_icon.wait_until_present.click
    end

    def get_order_ref_id(line)
      wait_for_db_activity_bws
      raise "The Order was not created" unless order_ref_id(line).present?
      @order_ref_id = order_ref_id(line)
    end

    def get_order_no(line)
      wait_for_db_activity_bws
      raise "The Order was not created" unless order_ref_id(line).present?
      #raise "The Order No is editable" if order_number(line).present? != false
      #raise "The Order No is editable" if order_number(line).enabled? != true
      @order_no = order_number(line)
    end

    def verify_increase(arg_1, arg_2)
      wait_for_db_activity_bws
      ag_1 =  arg_1.to_i
      ag_2 =  arg_2.to_i
      raise "The id was not increased" unless ag_2 == ag_1+1
    end

    def verify_delete_order_id(arg_1, arg_2, arg_3, arg_4, arg_5 )
      wait_for_db_activity_bws
      ag_1 =  arg_1.to_i
      ag_3 =  arg_3.to_i
      ag_4 =  arg_4.to_i
      ag_5 =  arg_5.to_i
      raise "The id is change" unless ag_1 == ag_4
      raise "The was not deleted" unless arg_2.present?
      raise "The id is change" unless ag_3 == ag_5
    end

    def cancel_order
      wait_for_db_activity_bws
      cancel_button.click
      wait_for_db_activity_bws
      yes_button.click
      wait_for_db_activity_bws
      bws_ok.click
    end

    def delete_order_information_bws(line)
      checkbox_order_info(line).scroll.to
      checkbox_order_info(line).click
      delete_order_icon.click
      raise "The confirm message is not found" unless delete_order_confirm_msgm.present?
      bws_ok.click
      apply.click
    end

    def set_delivery_drop_qty(line, order_qty)
      checkbox_order_info(line).scroll.to
      input_delivery_drop_qty(line).set order_qty
      send_keys :enter
      wait_for_db_activity_bws
    end

    def split_delivery_order_inf_bws(line)
      checkbox_order_info(line).scroll.to
      checkbox_order_info(line).click
      split_delivery_icon.click
    end




    def must_be_number_msgm(line, order_qty)
      input_delivery_drop_qty(line).scroll.to
      input_delivery_drop_qty(line).set order_qty
      send_keys :enter
      wait_for_db_activity_bws
      apply.scroll.to
      apply.click
      raise "The message is not found" unless must_be_number_msgm.present?
      raise "The field is not highlighted" unless field_error.present?
    end

    def can_be_zero_msgm(line)
      input_delivery_drop_qty(line).scroll.to
      input_delivery_drop_qty(line).set 0
      send_keys :enter
      wait_for_db_activity_bws
      apply.scroll.to
      apply.click
      raise "The message is not found" unless can_be_zero.present?
      raise "The field is not highlighted" unless field_error.present?
    end




  end
end
