require 'test-evolve/core/page_object'

module Pages
  def differentiators_diff
    @differentiators_diff ||= DifferentiatorsDiff.new
  end

  class DifferentiatorsDiff < TestEvolve::Core::PageObject

    #Path
    element(:tasks_button) { a(:id, 'pt1:eachSidebarItem:2:l1') }
    element(:tasks_foundation_data_link) { a(:text, 'Foundation Data') }
    element(:fd_items_link) { a(:text, 'Item Foundation') }
    element(:fd_itens_differentiators_link) { a(:text, 'Differentiators') }
    element(:fd_itens_diff_groups_link) { a(:text, 'Diff Groups') }
    element(:fd_create_diff_range_link) { a(:text, 'Create Diff Range') }
    element(:fd_manage_diff_ranges_link) { a(:text, 'Manage Diff Ranges') }
    element(:fd_create_diff_ratio_link) { a(:text, 'Create Diff Ratio') }
    element(:fd_manage_diff_ratios_link) { a(:text, 'Manage Diff Ratios') }

    #Comuns buttons
    element(:add_button) { div(:title, 'Add') }
    element(:create_button) { div(:title, 'Create') }
    element(:edit_button) { div(:id, /_ATp:edit/) }
    element(:delete_button) { a(:title, 'Delete') }
    element(:query_button) { div(:id, /_ATp:_qbeTbr/) }
    element(:ok_button) { div(:text, 'OK') }
    element(:save_and_close_button) { a(:text, 'Save and Close') }
    element(:save_button) { a(:text, 'Save') }
    element(:delete_popup) { div(:text, /delete/) }
    element(:yes_button) { a(:text, 'Yes') }
    element(:no_results) { div(:text, 'No data to display.') }
    element(:list) { table(:class, 'x17f x184').tbody.table }
    element(:done_button) { a(:text, 'Done') }
    element(:add_details_button) { a(:text, 'Add Details') }
    element(:search_button) { a(:text, 'Search') }
    element(:loading_list) { div(:class, 'AFAutoSuggestBusyStyle') }
    element(:cancel_button) { a(:text, 'Cancel') }

    #Diff Group
    element(:add_diff_group_button) { div(:id, /mr:pc1:_ATp:create/) }
    element(:edit_diff_group_button) { div(:id, /mr:pc1:_ATp:edit/) }
    element(:delete_diff_group_button) { div(:id, /mr:pc1:_ATp:delete/) }
    element(:diff_group_id_filter) { text_field(:id, /_afrFltrMdlc7::content/) }
    element(:diff_group_id_field) { text_field(:id, /_ATp:it1::content/) }
    element(:diff_group_description_field) { text_field(:id, /_ATp:it2::content/) }
    element(:type_field) { text_field(:id, /_ATp:diffTypeId::content/) }
    element(:chain_field) { text_field(:id, /_ATp:filterOrgIdId::content/) }
    element(:division_field) { text_field(:id, /_ATp:filterMerchIdId::content/) }
    element(:diff_group_list) { div(:id, /mr:pc1:_ATp:t1::db/) }

    #Diff Group Detail
    element(:add_diff_group_detail_button) { div(:id, /mr:at2:_ATp:create/) }
    element(:delete_diff_group_detail_button) { div(:id, /mr:at2:_ATp:delete/) }
    element(:sequence_filter) { text_field(:id, /mr:at2:_ATp:t2:inputText1/) }
    element(:sequence_list_field) { text_field(:id, /it63::content/) }
    element(:diff_group_detail_list) { div(:id, /mr:at2:_ATp:t2::db/) }
    element(:sequence_id_field) { text_field(:id, /mr:at2:_ATp:it3::content/) }
    element(:type_diff_group_detail_field) { text_field(:id, /_ATp:diffIdId::content/) }
    element(:sequence_query_button) { div(:id, /at2:_ATp:_qbeTbr/) }

    #Create Diff Range
    element(:range_id_field) { text_field(:id, /ap1:it5::content/) }
    element(:range_description_field) { text_field(:id, /ap1:it6::content/) }
    element(:range_type_dropdown) { select(:id, /ap1:soc2::content/) }
    element(:range_type_dropdown_chose) { |text| select(:id, /ap1:soc2::content/).option(:title, text) }
    element(:type1_field) { text_field(:id, /ap1:tiDiffType1Id::content/) }
    element(:diff_group1_field) { text_field(:id, /ap1:diffGroup1Id::content/) }
    element(:type2_field) { text_field(:id, /ap1:tiDiffType2Id::content/) }
    element(:diff_group2_field) { text_field(:id, /ap1:diffGroup2Id::content/) }
    element(:type3_field) { text_field(:id, /ap1:tiDiffType3Id::content/) }
    element(:diff_group3_field) { text_field(:id, /:ap1:diffGroup3Id::content/) }

    #Diff Range Details
    element(:detail_field_1) { text_field(:id, /ap1:at1:_ATp:iclv4::content/) }
    element(:detail_field_2) { text_field(:id, /at1:_ATp:inputComboboxListOfValues5::content/) }
    element(:detail_field_3) { text_field(:id, /ap1:at1:_ATp:inputComboboxListOfValues6::content/) }
    element(:ratio_field) { text_field(:id, /ap1:at1:_ATp:it2::content/) }
    element(:delete_range_details_button) { div(:id, /ap1:at1:_ATp:delete/) }

    #Manage Diff Range
    element(:search_range_filter) { text_field(:id, /diffRange2Id::content/) }
    element(:range_detail_list) { div(:id, /ap1:at1:_ATp:t1::db/) }

    #Edit Diff Range Details
    element(:edit_detail_field_1) { text_field(:id, /_ATp:inputComboboxListOfValues1::content/) }
    element(:edit_detail_field_2) { text_field(:id, /_ATp:inputComboboxListOfValues2::content/) }
    element(:edit_detail_field_3) { text_field(:id, /_ATp:inputComboboxListOfValues3::content/) }
    element(:edit_ratio_field) { text_field(:id, /at1:_ATp:it12/) }
    element(:size_filter) { text_field(:id, /_ATp:t1:_afrFltrMdlc5::content/) }

    #Diff Ratio
    element(:ratio_id) { text_field(:id, /mr1:diffRatioIdId::content/) }
    element(:ratio_description_field) { text_field(:id, /mr1:it1::content/) }
    element(:ratio_dept_field) { text_field(:id, /mr1:deptId::content/) }
    element(:ratio_class_field) { text_field(:id, /mr1:class1Id::content/) }
    element(:ratio_subclass_field) { text_field(:id, /mr1:subclassId::content/) }
    element(:ratio_diff_group1_field) { text_field(:id, /mr1:diffGroup1Id::content/) }
    element(:ratio_diff_group2_field) { text_field(:id, /mr1:diffGroup2Id::content/) }
    element(:ratio_diff_group3_field) { text_field(:id, /mr1:diffGroup3Id::content/) }
    element(:checkbox_regular) { checkbox(:id, /mr1:sbc1::content/) }
    element(:checkbox_promotional) { checkbox(:id, /mr1:sbc2::content/) }
    element(:checkbox_clearance) { checkbox(:id, /mr1:sbc3::content/) }
    element(:ratio_date_from_field) { text_field(:id, /mr1:id2::content/) }
    element(:ratio_date_back_to_field) { text_field(:id, /mr1:id3::content/) }
    element(:review_every_field) { text_field(:id, /mr1:it4::content/) }

    #Manage Diff Ratio
    element(:diff_ratio_list) { div(:id, /_ATp:resId1::db/) }
    element(:ratio_search_id_filter) { text_field(:id, /ap1:qryId1:val00::content/) }


    ############################################################################################################################

    def verify_actions(expected_values:)
      if no_results.present?
      else
        @actual_values = []
        @actual_values = list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end

    def open_differentiators
      TryWith.attempts(attempts: 10, sleep: 2) do
        tasks_button.click
        wait_for_db_activity
        tasks_foundation_data_link.click unless fd_itens_differentiators_link.present?
        wait_for_db_activity
        fd_items_link.click unless fd_itens_differentiators_link.present?
        wait_for_db_activity
        fd_itens_differentiators_link.click
        wait_for_db_activity
      end
    end

    def save_and_close
      TryWith.attempts(attempts: 3, sleep: 2) do
      save_and_close_button.wait_until_present.click
      wait_for_db_activity
      end
    end

    def save
      save_button.click
      wait_for_db_activity
    end

    ################################################ Diff Group #######################################################

    def open_diff_groups
      TryWith.attempts(attempts: 3, sleep: 2) do
        tasks_button.click unless fd_itens_diff_groups_link.present?
        fd_itens_diff_groups_link.click
        wait_for_db_activity
      end
    end

    def select_diff_group(new_id)
      query_button.wait_until_present
      query_button.click unless diff_group_id_filter.present?
      wait_for_db_activity
      diff_group_id_filter.set new_id
      diff_group_id_filter.click
      send_keys :enter
      wait_for_db_activity
      list = diff_group_list.text
      raise "Diff Group id #{new_id} not found" unless list.include? new_id.to_s
    end

    def create_diff_group(new_id, diff_group_description, type, division, department)
      add_diff_group_button.wait_until_present.click
      wait_for_db_activity
      diff_group_id_field.set new_id
      diff_group_description_field.set diff_group_description
      type_field.set type
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      chain_field.set division
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      division_field.set department
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity

    end

    def edit_diff_group(diff_group_description, division, department)
      edit_diff_group_button.wait_until_present.click
      wait_for_db_activity
      diff_group_description_field.set diff_group_description
      wait_for_db_activity
      chain_field.set division
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      division_field.set department
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
    end

    def delete_diff_group

      delete_diff_group_button.wait_until_present.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def verify_diff_group(expected_values:)
      if no_results.present?
      else
        @actual_values = []
        @actual_values = diff_group_list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end

    ###################### Group Detail #######################

    def select_diff_group_detail(sequence)
      sequence_query_button.click unless sequence_filter.present?
      wait_for_db_activity
      sequence_filter.set sequence
      sequence_filter.click
      send_keys :enter
      wait_for_db_activity
    end

    def create_diff_group_detail(sequence, size)
      add_diff_group_detail_button.wait_until_present.click
      wait_for_db_activity
      sequence_id_field.set sequence
      send_keys :enter
      wait_for_db_activity
      type_diff_group_detail_field.set size
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity

    end

    def edit_diff_group_detail(sequence)
      sequence_list_field.click
      sequence_list_field.set sequence
      wait_for_db_activity
    end

    def delete_diff_group_detail
      delete_diff_group_detail_button.wait_until_present.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def verify_diff_group_detail(expected_values:)
      if no_results.present?
      else
        @actual_values = []
        @actual_values = diff_group_detail_list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end

    ############################################# Diff Range ####################################################

    def open_create_diff_range
      TryWith.attempts(attempts: 10, sleep: 2) do
        tasks_button.click unless fd_create_diff_range_link.present?
        fd_create_diff_range_link.click
        wait_for_db_activity
      end
    end

    def open_manage_diff_range
      TryWith.attempts(attempts: 10, sleep: 2) do
        tasks_button.click unless fd_manage_diff_ranges_link.present?
        fd_manage_diff_ranges_link.click
        wait_for_db_activity
      end
    end

    def select_diff_range(diff_range_id)
      TryWith.attempts(attempts: 10, sleep: 2) do
      search_range_filter.wait_until_present
      search_range_filter.set diff_range_id
      end
      send_keys :enter
      wait_for_db_activity
    end

    def select_diff_range_detail(size)
      query_button.click unless size_filter.present?
      wait_for_db_activity
      size_filter.set size
      size_filter.click
      send_keys :enter
      wait_for_db_activity
    end

    def create_diff_range(new_id, range_description, type1, diff_group1, type2, diff_group2)
      wait_for_db_activity
      range_id_field.set new_id
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      range_description_field.set range_description
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      select_list(range_type_dropdown_chose('Ratio'), range_type_dropdown, 'Ratio')
      wait_for_db_activity
      type1_field.set type1
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      diff_group1_field.set diff_group1
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      type2_field.set type2
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      diff_group2_field.set diff_group2
      wait_until_enabled(loading_list)
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      add_details_button.click
      wait_for_db_activity
    end

    def create_diff_range_detail(colour,size, ratio)
      add_button.wait_until_present.click
      wait_for_db_activity
      detail_field_1.set size
      wait_until_enabled(loading_list)
      send_keys :enter
      wait_for_db_activity
      sleep 2
      detail_field_2.set colour
      wait_until_enabled(loading_list)
      send_keys :enter
      wait_for_db_activity
      sleep 2
      ratio_field.set ratio
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
    end

    def edit_diff_range_detail(size, colour, ratio)
      edit_button.wait_until_present.click
      wait_for_db_activity
      edit_detail_field_2.set size
      wait_until_enabled(loading_list)
      send_keys :enter
      wait_for_db_activity
      edit_detail_field_1.set colour
      wait_until_enabled(loading_list)
      send_keys :enter
      wait_for_db_activity
      edit_ratio_field.set ratio
      wait_for_db_activity
      ok_button.click
      wait_for_db_activity
      save_and_close_button.wait_until_present.click
      wait_for_db_activity
    end

    def delete_diff_range
      delete_button.wait_until_present.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
    end

    def delete_diff_range_detail
      delete_range_details_button.wait_until_present.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
    end

    def verify_diff_range(expected_values:)
      if no_results.present?
      else
        @actual_values = []
        @actual_values = range_detail_list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end

    def verify_range_detail(expected_values:)
      if no_results.present?
      else
        @actual_values = []
        @actual_values = diff_group_detail_list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end

############################################# Diff Ratio #############################################################

    def open_create_diff_ratio
      TryWith.attempts(attempts: 10, sleep: 2) do
        tasks_button.click unless fd_create_diff_ratio_link.present?
        fd_create_diff_ratio_link.click
        wait_for_db_activity
      end
    end

    def open_manage_diff_ratio
      TryWith.attempts(attempts: 10, sleep: 2) do
        tasks_button.click unless fd_manage_diff_ratios_link.present?
        fd_manage_diff_ratios_link.click
        wait_for_db_activity
      end
    end

    def search_diff_ratio(ratio_id)
      wait_for_db_activity
      ratio_search_id_filter.wait_until_present.set ratio_id
      send_keys :enter
      wait_for_db_activity
      search_button.click
      wait_for_db_activity
    end

    def diff_ratio_id
      wait_for_db_activity
      ratio_id.wait_until_present
      @new_id = ratio_id.value
    end

    def add_diff_ratio
      TryWith.attempts(attempts: 10, sleep: 2) do
        create_button.wait_until_present.click
        wait_for_db_activity
        end
    end


    def create_diff_ratio(description, dept, ratio_class, subclass, ratio_group1, ratio_group2, ratio_group3, review)
      ratio_description_field.wait_until_present.set description
      send_keys :enter
      wait_for_db_activity
      ratio_dept_field.set dept
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ratio_class_field.wait_until_present.set ratio_class
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ratio_subclass_field.wait_until_present.set subclass
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ratio_diff_group1_field.set ratio_group1
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ratio_diff_group2_field.wait_until_present.set ratio_group2
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      ratio_diff_group3_field.wait_until_present.set ratio_group3
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      review_every_field.set review
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
    end

    def edit_diff_ratio(description, review, date_back_to)
      edit_button.wait_until_present.click
      wait_for_db_activity
      ratio_description_field.wait_until_present.set description
      send_keys :enter
      wait_for_db_activity
      review_every_field.set review
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      checkbox_promotional.click
      wait_for_db_activity
      checkbox_clearance.click
      wait_for_db_activity
      ratio_date_back_to_field.set date_back_to
      send_keys :enter
      wait_for_db_activity
      ratio_date_back_to_field.set date_back_to
      save_and_close_button.click
      wait_for_db_activity
    end

    def delete_diff_ratio
      edit_button.wait_until_present.click
      wait_for_db_activity
      delete_button.wait_until_present.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
    end

    def verify_diff_ratio(expected_values:)
      if no_results.present?
      else
        @actual_values = []
        @actual_values = diff_ratio_list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end




  end
end


