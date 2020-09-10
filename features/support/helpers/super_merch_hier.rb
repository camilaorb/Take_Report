require 'test-evolve/core/page_object'

module Pages
  def super_merch_hier
    @super_merch_hier ||= SuperMerchHier.new
  end

  class SuperMerchHier < TestEvolve::Core::PageObject

    include Pages
    ############################# Methods ####################

    def new_subdept
      merchandise_hierarchy.open_merchandise_hierarchy
      merchandise_hierarchy.access_subdpt
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      @new_dpt = database.subdpt_id
      database.disconnect_db
      merchandise_hierarchy.create_new_subdpt(@new_dpt,'New Sub-Department', YML_DATA['dept'], YML_DATA['buyer'], YML_DATA['merchandiser'],
                                              '10', '10', '1', '1', YML_DATA['profit_calc_type'], YML_DATA['otb_calc_type'], YML_DATA['purchase_type'], '10000' )
      merchandise_hierarchy.access_new_vat
      merchandise_hierarchy.create_vat(YML_DATA['SA'], YML_DATA['v_code_1'], YML_DATA['R'])
      merchandise_hierarchy.create_vat(YML_DATA['NAM'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['SWA'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['BOT'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['LSL'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['AUD'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['GHA'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['KEN'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['MZM'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['NIG'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['PLN'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['TZN'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['UGA'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['ZMK'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['DRC'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.create_vat(YML_DATA['OC'], YML_DATA['v_code_1'], YML_DATA['B'])
      merchandise_hierarchy.save_and_close_subdpt_actions
      merchandise_hierarchy.close_merchandise_hierarchy
      end

    def new_category
      merchandise_hierarchy.open_merchandise_hierarchy
      merchandise_hierarchy.access_category(@new_dpt)
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      @new_category = database.category_id(@new_dpt)
      database.disconnect_db
      merchandise_hierarchy.create_new_category(@new_category, 'New Category')
    end

    def new_subcategory
      merchandise_hierarchy.open_merchandise_hierarchy
      merchandise_hierarchy.access_subcategory(@new_dpt, @new_category)
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      @new_subcategory = database.subcategory_id(@new_dpt, @new_category)
      database.disconnect_db
      merchandise_hierarchy.create_new_subcategory(@new_subcategory, 'New Sub Category')

    end

    def access_vat
      merchandise_hierarchy.open_merchandise_hierarchy
      merchandise_hierarchy.access_subdpt
      merchandise_hierarchy.select_subdpt(@new_dpt)
      merchandise_hierarchy.access_select_subdpt
      merchandise_hierarchy.access_vat
    end

    def access_merch_hier_defaults
      merchandise_hierarchy.open_merchandise_hierarchy
      merchandise_hierarchy.access_subdpt
      merchandise_hierarchy.select_subdpt(@new_dpt)
      merchandise_hierarchy.access_select_subdpt
      merchandise_hierarchy.access_merch_hier_defaults
    end







  end
end
