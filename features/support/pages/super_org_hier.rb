require 'test-evolve/core/page_object'

module Pages
  def super_org_hier
    @super_org_hier ||= SuperOrgHier.new
  end

  class SuperOrgHier < TestEvolve::Core::PageObject

    include Pages

    ############################# Methods ####################

    def access_existing_division
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      new_div = database.last_division_id
      database.disconnect_db
      organizational_hierarchy.add_division
      organizational_hierarchy.create_division(new_div, YML_DATA['Division']['division_create'],
                                               YML_DATA['Division']['division_manager'], YML_DATA['Division']['division_currency'])
      organizational_hierarchy.from_org_hierarchy
      @new_div = new_id
    end

    def access_existing_country
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      new_country = database.last_country_id
      database.disconnect_db
      organizational_hierarchy.add_country
      organizational_hierarchy.createCountry(new_country, YML_DATA['Country']['country_create'],
                                             YML_DATA['Country']['country_manager'], YML_DATA['Country']['country_currency'], YML_DATA['Country']['country_division'])
      organizational_hierarchy.from_org_hierarchy
      @new_country = new_country
    end

    def access_existing_region
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      new_region = database.last_region_id
      database.disconnect_db

      organizational_hierarchy.add_region
      organizational_hierarchy.create_region(new_region, YML_DATA['Region']['region_create'],
                                             YML_DATA['Region']['region_manager'], YML_DATA['Region']['region_currency'], YML_DATA['Region']['region_division'])
      organizational_hierarchy.from_org_hierarchy
      @new_region = new_region
    end

    def access_existing_area
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      new_area = database.last_area_id
      database.disconnect_db
      organizational_hierarchy.add_area
      organizational_hierarchy.createArea(new_area, YML_DATA['Area']['area_create'],
                                          YML_DATA['Area']['area_manager'], YML_DATA['Area']['area_currency'], YML_DATA['Area']['area_region'])
      organizational_hierarchy.from_org_hierarchy
      @new_area
    end

    def access_existing_store
      database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')
      new_store = database.last_store_id
      database.disconnect_db
      org_stores.add_store
      org_stores.create_store(
        new_store,
        YML_DATA['CreateStore']['Store_Name'],
        YML_DATA['CreateStore']['10_Character_Name'],
        YML_DATA['CreateStore']['3_Character_Name'],
        YML_DATA['CreateStore']['Channel'],
        YML_DATA['CreateStore']['Area'],
        YML_DATA['CreateStore']['Transfer_Zone'],
        YML_DATA['CreateStore']['Currency'],
        YML_DATA['CreateStore']['Language'],
        YML_DATA['CreateStore']['Time_Zone'],
        YML_DATA['CreateStore']['VAT_Region'],
        YML_DATA['CreateStore']['Org_Unit'],
        YML_DATA['CreateStore']['Store_Open_Date'],
        YML_DATA['CreateStore']['Start_Order_Days'],
        YML_DATA['CreateStore']['Manager'],
        YML_DATA['ZoningLocations']['Pricing_Store'],
        YML_DATA['ZoningLocations']['CostLocation'],
        YML_DATA['BusinessAddress']['Address'],
        YML_DATA['BusinessAddress']['City'],
        YML_DATA['BusinessAddress']['Country']
      )
      @new_store = new_store
    end






  end
end
