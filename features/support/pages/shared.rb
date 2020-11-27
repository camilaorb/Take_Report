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
    element(:save_and_close_button) { a(:text, 'Save and Close') }
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

    ############################### Methods ###############################

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

    def done
      TryWith.time(timeout: 10) do
        scroll_to(done_button)
        done_button.click
        wait_for_db_activity
        sleep 5
      end
    end

    def verify_actions(expected_values:)
      if no_results.present?
      else
        @actual_values = result_list.text
        raise "Values were not as expected.\nExpected:\n#{expected_values}\nActual:\n#{@actual_values}" unless @actual_values.include?expected_values
      end
    end


  end
end

