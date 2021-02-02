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
    element(:_delete_order_confirmation) { div(:text, /confirm delete/) }

    #order_information_tab
    element(:checkbox_order_info) { |row| input(id: /rOptDets:ordersView:pc4:t1:#{row}:sbc1::content/) }
    element(:order_number) { |row| div(:id, /rOptDets:ordersView:pc4:t1::db/).trs(:class, 'x13q')[row].tds[2].text }
    element(:order_ref_id) { |row| div(:id, /rOptDets:ordersView:pc4:t1::db/).trs(:class, 'x13q')[row].tds[3].text }
    element(:checkbox_swing_tag_req) { |row| input(id: /rOptDets:ordersView:pc4:t1:#{row}:sbc2::content/) }
    element(:input_delivery_drop_qty) { |row| text_field(id: /rOptDets:ordersView:pc4:t1:#{row}:it2::content/) }
    element(:field_location_list) { |row| text_field(id: /rOptDets:ordersView:pc4:t1:#{row}:it2::content/) }
    element(:field_location_list) { |row| text_field(id: /rOptDets:ordersView:pc4:t1:#{row}:it2::content/) }
    element(:location_type) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].select_list(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:socLocType::content/) }
    element(:location_id) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].text_field(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:ilov1::content/) }
    element(:not_before_date) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].text_field(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:idNotBeforeDate::content/) }
    element(:not_after_date) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].text_field(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:idNotAfterDate::content/) }
    element(:earliest_ship_date) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].text_field(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:id1::content/) }
    element(:latest_ship_date) { |index| div(:id, /rOptDets:ordersView:pc4:tDeliveryDrop::db/).trs(:class, /xhe/)[index].text_field(:id, /rOptDets:ordersView:pc4:tDeliveryDrop:#{index}:idLatestShipDate::content/) }
    element(:apply) { div(:id, /rOptDets:0:ctb5/) }
    element(:average_location) { text_field(:id, /rOptDets:ordersView:itAvgAllocQty::content/) }




    ############################################# Methods ##############################################################

    def add_order_information_bws
      add_order_icon.wait_until_present.click
    end

    def get_order_no
      wait_for_db_activity_bws
      raise "The order was not created" unless order_number(0).present?
      @order_no = order_number(0)
    end

    def order_ref_id
      wait_for_db_activity_bws
      order_ref_id(0).wait_until_present
      @order_ref_id = order_ref_id(0)
    end

    def cancel_order
      wait_for_db_activity_bws
      cancel_button.click
      wait_for_db_activity_bws
      bws_ok.click
      wait_for_db_activity_bws
      yes_button.click
    end

    def delete_order_information_bws
      checkbox_order_info(0).click
      delete_order_icon.click
      _delete_order_confirmation.click
      _apply.click
    end


  end
end
