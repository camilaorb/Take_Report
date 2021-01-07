require 'test-evolve/core/page_object'

module Pages
  def super_loc_list
    @super_loc_list ||= SuperLocList.new
  end

  class SuperLocList < TestEvolve::Core::PageObject

    include Pages

    ################################ Objects #############################

    #######  Location List  #######

    def add_location_list_with_location
      location_list.access_create_location_list
      @location_list_id = new_location_list_id
      location_list.add_location_list_head('Test Location list', YML_DATA['division_chain'])
      shared.more_actions_select(YML_DATA['location_option'])
      location_list.add_location_detail(YML_DATA['location_type_1'], YML_DATA['Store_ID'])
      shared.save_and_close
      shared.save_and_close
    end


  end
end


