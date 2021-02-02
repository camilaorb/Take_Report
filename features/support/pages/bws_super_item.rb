require 'test-evolve/core/page_object'

module Pages
  def bws_super_item
    @bws_super_item ||= BwsSuperIitem.new
  end

  class BwsSuperIitem < TestEvolve::Core::PageObject

    include Pages

    ################################ Objects #############################
    #######  Location List  #######

    # "create_an_item" - Method created for the purpose to create an item completley with all ITEM-TAB
    # Attributes.
    def create_an_item
      bws_item_menu.add_item_select_options("add_new_item")
      bws_item.adds_item_bws(YML_DATA['BWS']['add_item']['Sub_Department'],
                             YML_DATA['BWS']['add_item']['Category'],
                             YML_DATA['BWS']['add_item']['Sub_Category'],
                             YML_DATA['BWS']['add_item']['Main_Desc'],
                             YML_DATA['BWS']['add_item']['Marketing_Desc'],
                             YML_DATA['BWS']['add_item']['Differentiator_1'],
                             YML_DATA['BWS']['add_item']['Differentiator_2'],
                             YML_DATA['BWS']['add_item']['Supplier_Site'],
                             YML_DATA['BWS']['add_item']['Country_of_Sourcing'],
                             YML_DATA['BWS']['add_item']['Country_of_Manufacture'],
                             YML_DATA['BWS']['add_item']['Port_Of_Lading'],
                             YML_DATA['BWS']['add_item']['Cost_Zone_Group_ID'],
                             YML_DATA['BWS']['add_item']['Cost'],
                             YML_DATA['BWS']['add_item']['Supplier_Pack_Size'],
                             YML_DATA['BWS']['add_item']['Inner_Pack_Size'],
                             YML_DATA['BWS']['add_item']['Case_Pack_Qty'],
                             YML_DATA['BWS']['add_item']['Packing_Method'])

      #UDAS#
      bws_item.go_to(YML_DATA['uda'])
      bws_item.add_udas(YML_DATA['uda_id_1'],
                        YML_DATA['uda_id_2'],
                        YML_DATA['uda_val_1'],
                        YML_DATA['uda_val_2'])

      bws_item.go_to(YML_DATA['sku'])
      bws_item.add_skus(YML_DATA['BWS']['sku_01'], YML_DATA['BWS']['sku_range'])
      # bws_item.add_dimension
      # bws_item.add_location_ranging
      # bws_item.add_price_by_zone
      # bws_item.order_information
    end

    def fill_item_tab
      bws_item_menu.add_item_select_options("add_new_item")
      bws_item.adds_item_bws(YML_DATA['BWS']['add_item']['Sub_Department'],
                             YML_DATA['BWS']['add_item']['Category'],
                             YML_DATA['BWS']['add_item']['Sub_Category'],
                             YML_DATA['BWS']['add_item']['Main_Desc'],
                             YML_DATA['BWS']['add_item']['Marketing_Desc'],
                             YML_DATA['BWS']['add_item']['Differentiator_1'],
                             YML_DATA['BWS']['add_item']['Differentiator_2'],
                             YML_DATA['BWS']['add_item']['Supplier_Site'],
                             YML_DATA['BWS']['add_item']['Country_of_Sourcing'],
                             YML_DATA['BWS']['add_item']['Country_of_Manufacture'],
                             YML_DATA['BWS']['add_item']['Port_Of_Lading'],
                             YML_DATA['BWS']['add_item']['Cost_Zone_Group_ID'],
                             YML_DATA['BWS']['add_item']['Cost'],
                             YML_DATA['BWS']['add_item']['Supplier_Pack_Size'],
                             YML_DATA['BWS']['add_item']['Inner_Pack_Size'],
                             YML_DATA['BWS']['add_item']['Case_Pack_Qty'],
                             YML_DATA['BWS']['add_item']['Packing_Method'])

    end

    def goto_sku_tab
      bws_item_menu.add_item_select_options("add_new_item")
      fill_item_tab
    end

    def goto_order_information_tab
      fill_item_tab
      bws_item.go_to(YML_DATA['sku'])

      # UDA
      # Sku
      # bws_item.add_skus(YML_DATA['BWS']['sku_01'], YML_DATA['BWS']['sku_range'])
      # bws_item.add_dimension
      # bws_item.add_location_ranging
      # bws_item.add_price_by_zone

      bws_item.go_to(YML_DATA['order_information'])

    end

  end
end

