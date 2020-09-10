require 'test-evolve/core/page_object'

module Pages
  def data_loading
    @data_loading ||= DataLoading.new
  end

  class DataLoading < TestEvolve::Core::PageObject

    #Path
    element(:tasks_button) { a(:title, 'Tasks') }
    element(:notifications_button) { a(:title, /Notifications/) }
    element(:tasks_foundation_data_link) { a(:text, 'Foundation Data') }
    element(:data_loading_link) { a(:text, 'Data Loading') }
    element(:dl_download_link) { a(:text, 'Download') }
    element(:dl_upload_link) { a(:text, 'Upload') }
    element(:dl_review_status_link) { a(:text, 'Review Status') }
    element(:dl_download_blank_template_link) { a(:text, 'Download Blank Template') }

    #notifications
    element(:notifications_table) { div(:id, /taskTablePgl/) }
    element(:no_notifications) { div(:text, 'No notifications to display') }


    #Download Data
    element(:template_type_dropdown) { select(:id, /templateTypeDescId::content/) }
    element(:template_type_option) { |text| select(:id, /templateTypeDescId::content/).option(:title, text) }
    element(:template_field) { text_field(:id, /ap1:templateDescId::content/) }
    element(:download_button) { a(:text, 'Download') }
    element(:done_button) { a(:text, 'Done') }
    element(:upload_button) { a(:text, 'Upload') }
    element(:process_description_field) { text_field(:id, /ap1:it1::content/) }


    ############################################################################################################################


    def open_data_loading
      TryWith.attempts(attempts: 10, sleep: 2) do
        tasks_button.wait_until_present.click
        wait_for_db_activity
        tasks_foundation_data_link.click
        wait_for_db_activity
        data_loading_link.click
        wait_for_db_activity
      end
    end

    ### Download ###

    def open_data_loading_download
      TryWith.attempts(attempts: 3, sleep: 2) do
        tasks_button.click unless dl_download_link.present?
        dl_download_link.click
        wait_for_db_activity
      end
    end


    def download_file(template_type, template)
      template_type_dropdown.wait_until_present.click
      wait_for_db_activity
      template_type_option(template_type).select
      wait_for_db_activity
      template_field.set template
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      download_button.click
      wait_for_db_activity
    end

    ### Upload ###

    def open_data_loading_upload
      TryWith.attempts(attempts: 3, sleep: 2) do
        tasks_button.click unless dl_upload_link.present?
        dl_upload_link.click
        wait_for_db_activity
      end
    end

    def upload_options_screen(template_type, template)
      template_type_dropdown.wait_until_present.click
      wait_for_db_activity
      template_type_option(template_type).select
      wait_for_db_activity
      template_field.set template
      wait_for_db_activity
      send_keys :enter
      wait_for_db_activity
      raise 'Process Description is not populates' if process_description_field.blank?
      wait_for_db_activity
    end

    def upload_a_file(file)
      upload_file('class', 'x2k', "#{Dir.pwd}/resources/upload_DB_data/#{file}")
      sleep 1
      upload_button.wait_until_present.click
      wait_for_db_activity
      done_button.click
      wait_for_db_activity
      TryWith.attempts(attempts: 10, sleep: 2) do
      done_button.click if done_button.present?
      wait_for_db_activity
      end
    end

    def verify_upload

      notifications_button.click
      wait_for_db_activity
      raise "Upload with errors " unless no_notifications.present?

    end








  end
end


