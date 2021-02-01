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
    element(:add_item_icon) { span(text: 'Add Item') }
    element(:delete_icon) { span(text: 'Delete Selected') }
    element(:edit_icon) { img(id: /cil1::icon/) } #Edit Icon for the Selected ITEM
    element(:bws_ok) { span(text: 'OK') }

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
    element(:order_info_tab) { input(id: /rOptDets:ordersView:pc4::_ahCt/) }




    ############################################# Methods ##############################################################

    def add_order_information_bws
      bws_shared.scroll_bws add_item_icon
    end

    def get_order_id
      order_info_tab.present?
    end


  end
end
