require 'test-evolve/core/page_object'

module Pages
  def shared
    @shared ||= Shared.new
  end

  class Shared < TestEvolve::Core::PageObject
    ################################ Objects #############################
    #Comuns buttons
    element(:add_button) { div(:title, 'Add') }
    element(:create_button) { div(:title, 'Create') }
    element(:edit_button) { div(:id, /_ATp:edit/) }
    element(:delete_button) { a(:title, 'Delete') }
    element(:query_button) { div(:id, /_ATp:_qbeTbr/) }
    element(:ok_button) { div(:text, 'OK') }
    element(:ok_button_1) { span(:text, 'OK') }
    element(:save_and_close_button) { a(:text, /Save and Close/) }
    element(:save_button) { a(:text, 'Save') }
    element(:delete_popup) { div(:text, /delete/) }
    element(:yes_button) { a(:text, 'Yes') }
    element(:no_button) { a(:text, 'No') }
    element(:no_results) { div(:text, 'No data to display.') }
    element(:result_list) { table(:class, 'x17f x184').tbody.table }
    element(:done_button) { a(:text, 'Done') }
    element(:add_details_button) { a(:text, 'Add Details') }
    element(:search_button) { a(:text, 'Search') }
    element(:loading_list) { div(:class, 'AFAutoSuggestBusyStyle') }
    element(:cancel_button) { a(:text, 'Cancel') }
    element(:more_actions_dropdown) { a(:title, 'More Actions') }
    element(:select_more_action_option) { |text| tr(:title, text ) }
    element(:close_tab_button) { a(:title, 'Close Tab') }
    element(:clear_all_filters) { a(:title, 'Clear All') }
    element(:tasks_button) { a(:title, 'Tasks') }
    element(:organizational_Hierarchy) { span(:text, 'Organizational Hierarchy') }

    ## Possible Save and Closes ##
    element(:save_and_close_01) { a(:text, /Save and Close/) }

    ############################### Methods ###############################

    def save_and_close
      sleep 1
      if save_and_close_button.present?
        TryWith.attempts(attempts: 3, sleep: 2) do
          save_and_close_button.wait_until_present.click
          wait_for_db_activity
        end
      elsif save_and_close_01.present?
        wait_for_db_activity
        save_and_close_01.click
        wait_for_db_activity
      end
    end

    def save
      save_button.wait_until_present.click
      wait_for_db_activity
    end

    def done
      TryWith.time(timeout: 10) do
        scroll_to(done_button)
        done_button.wait_until_present.click
        wait_for_db_activity
        sleep 5
      end
    end

    def verify_actions(expected_values:)
      if no_results.present?
      else
        @actual_values = result_list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include? expected_values
      end
    end

## Filter - img(alt: 'Query by Example') ##
    def filter_activity(filter_element, filter_data)
      ## Filter ##
      if (filter_element.present? == true)
        filter_element.send_keys filter_data
        2.times do
          filter_element.send_keys :enter
        end
      else
        TE.browser.img(alt: 'Query by Example').click
        filter_element.send_keys filter_data
        wait_for_db_activity
        2.times do
          filter_element.send_keys :enter
        end
        wait_for_db_activity
      end
    end

    def from_org_hierarchy
      tasks_button.wait_until_present.click
      wait_for_db_activity
      organizational_Hierarchy.click
      wait_for_db_activity
    end

    def enter_times(ele, times)
      wait_for_db_activity
      times.times do
        ele.send_keys :enter
        wait_for_db_activity
      end
    end

    def delete_item
      delete_button.click
      wait_for_db_activity
      delete_popup.wait_until_present
      yes_button.click
      wait_for_db_activity
      save_and_close_button.click
      wait_for_db_activity
    end

    def more_actions_select(option)
      wait_for_db_activity
      more_actions_dropdown.wait_until_present.click
      wait_for_db_activity
      select_more_action_option(option).wait_until_present.click
      wait_for_db_activity
    end

    def ok
      sleep 2
      if ok_button.present? == true
        ok_button.click
        wait_for_db_activity
      elsif ok_button_1.present? == true
        ok_button_1.click
      else
      end
    end

    def cancel
      cancel_button.wait_until_present.click
      wait_for_db_activity
    end

    def close_tab
      close_tab_button.wait_until_present.click
      wait_for_db_activity
    end

    def clear_filters
      clear_all_filters.wait_until_present.click
      wait_for_db_activity
    end

  end
end