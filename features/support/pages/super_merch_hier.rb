require 'test-evolve/core/page_object'

module Pages
  def super_merch_hier
    @super_merch_hier ||= SuperMerchHier.new
  end

  class SuperMerchHier < TestEvolve::Core::PageObject

    include Pages

    ############################# Methods ####################

    def existing_division
      merchandise_hierarchy.access_division
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      new_div = database.division_id
      database.disconnect_db
      merchandise_hierarchy.create_new_division(new_div, YML_DATA['mh_new_div_name'], YML_DATA['mh_buyer'],
                                                YML_DATA['mh_merchandiser'], YML_DATA['mh_total_mkt_amount'])
      @new_div = new_div
    end

    def existing_department
      merchandise_hierarchy.access_dept
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      new_dept = database.department_id
      database.disconnect_db
      merchandise_hierarchy.create_new_dept(new_dept, YML_DATA['mh_new_dept_name'], YML_DATA['mh_buyer'],
                                            YML_DATA['mh_merchandiser'], YML_DATA['mh_division'])
      @new_dept = new_dept
    end

    def existing_category
      merchandise_hierarchy.access_category(YML_DATA['mh_subdpt'])
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      new_cat = database.category_id(YML_DATA['mh_subdpt'])
      database.disconnect_db
      merchandise_hierarchy.create_new_category(new_cat, YML_DATA['mh_new_catg_name'])
      @new_cat = new_cat
    end

    def existing_subcategory
      merchandise_hierarchy.access_subcategory(YML_DATA['mh_subdpt'], YML_DATA['mh_category'])
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      new_subcat = database.subcategory_id(YML_DATA['mh_subdpt'], YML_DATA['mh_category'])
      database.disconnect_db
      merchandise_hierarchy.create_new_subcategory(new_subcat, YML_DATA['mh_new_scatg_name'])
      @new_subcat = new_subcat
    end

    def access_sub_department
      merchandise_hierarchy.access_subdpt
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      new_dpt = database.subdpt_id
      database.disconnect_db
      merchandise_hierarchy.create_new_subdpt(new_dpt,YML_DATA['mh_new_subdept_name'], YML_DATA['mh_dept'], YML_DATA['mh_buyer'],
                                              YML_DATA['mh_merchandiser'], YML_DATA['markup_perct_cost'], YML_DATA['markup_perct_retail'],
                                              YML_DATA['maximum_average'], YML_DATA['average_tolerance'],YML_DATA['profit_calc_type'],
                                              YML_DATA['otb_calc_type'], YML_DATA['purchase_type'], YML_DATA['mh_total_mkt_amount'] )
      merchandise_hierarchy.access_new_vat
      merchandise_hierarchy.create_multiple_vat
      merchandise_hierarchy.save_and_close_subdpt_actions
      @new_subdept = new_dpt
    end




  end
end
