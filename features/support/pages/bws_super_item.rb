require 'test-evolve/core/page_object'

module Pages
  def bws_super_item
    @bws_super_item ||= BwsSuperIitem.new
  end

  class BwsSuperIitem < TestEvolve::Core::PageObject

    include Pages

    ################################ Objects #############################

    #######  Location List  #######

    def go_to_pricing_by_zone_tab
      bws_item_actions.field_item_tab
      bws_item_actions.field_uda_tab
      bws_item_actions.field_sku_tab
      bws_item_actions.field_dimension_tab
      bws_item_actions.field_location_ranging_tab
    end


  end
end


