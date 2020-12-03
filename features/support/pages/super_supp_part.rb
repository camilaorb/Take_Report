require 'test-evolve/core/page_object'

module Pages
  def super_supp_part
    @super_supp_part ||= SuperSuppPart.new
  end

  class SuperSuppPart < TestEvolve::Core::PageObject

    include Pages

    ################################ Objects #############################

    #######  Address  #######

    def open_supplier_address
      supplier_partner.open_supplier
      supplier_partner.search_supplier(YML_DATA['supplier_id'])
      supplier_partner.select_supplier(YML_DATA['supplier_id'])
      supplier_partner.access_supplier
      shared.more_actions_select(YML_DATA['address'])
      supplier_partner.close_supplier
    end

    def open_supplier_site_address
      supplier_partner.open_supplier
      supplier_partner.search_supplier_site(YML_DATA['supplier_site_id'])
      supplier_partner.select_supplier_site(YML_DATA['supplier_site_id'])
      supplier_partner.access_supplier
      shared.more_actions_select(YML_DATA['address'])
      supplier_partner.close_supplier
    end

    def access_existing_supplier_address
      supplier_partner.search_supplier(YML_DATA['supplier_id'])
      supplier_partner.select_supplier(YML_DATA['supplier_id'])
      supplier_partner.access_supplier
      shared.more_actions_select(YML_DATA['address'])
      supplier_partner.close_supplier
      supplier_partner.create_address(YML_DATA['a_type_1'], 'test st no 1', 'Vila Nova de Gaia', YML_DATA['country_1'], YML_DATA['state_1'])
      shared.save_and_close
      super_supp_part.open_supplier_address
      supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_1'])
    end

    def access_existing_supp_site_address
      supplier_partner.search_supplier_site(YML_DATA['supplier_site_id'])
      supplier_partner.select_supplier_site(YML_DATA['supplier_site_id'])
      supplier_partner.access_supplier
      shared.more_actions_select(YML_DATA['address'])
      supplier_partner.close_supplier
      supplier_partner.create_address(YML_DATA['a_type_1'], 'test st no 1', 'Vila Nova de Gaia', YML_DATA['country_1'], YML_DATA['state_1'])
      shared.save_and_close
      super_supp_part.open_supplier_address
      supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_1'])
    end

    def access_primary_supp_address
      supplier_partner.search_supplier(YML_DATA['supplier_id'])
      supplier_partner.select_supplier(YML_DATA['supplier_id'])
      supplier_partner.access_supplier
      shared.more_actions_select(YML_DATA['address'])
      supplier_partner.close_supplier
      supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_3'])
    end

    def access_primary_supp_site_address
      supplier_partner.search_supplier_site(YML_DATA['supplier_site_id'])
      supplier_partner.select_supplier_site(YML_DATA['supplier_site_id'])
      supplier_partner.access_supplier
      shared.more_actions_select(YML_DATA['address'])
      supplier_partner.close_supplier
      supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_3'])
    end

    def delete_address
      supplier_partner.delete_address
      shared.clear_filters
    end

    def delete_existing_address
      supplier_partner.delete_address
      supplier_partner.delete_address
      shared.clear_filters
    end

    ### Inventory  ###

    def create_inventory
      supplier_partner.create_inventory
      supplier_partner.replenishment(YML_DATA['a_type_1'], YML_DATA['a_type_1'])
      supplier_partner.due_order_processing
      shared.more_actions_select(YML_DATA['address'])
      supplier_partner.close_supplier
      supplier_partner.select_address(YML_DATA['a_type_1'], YML_DATA['country_3'])
    end


  end
end


