require 'test-evolve/core/page_object'

module Pages
  def foundation_data_loading
    @foundation_data_loading ||= FoundationDataLoading.new
  end

  class FoundationDataLoading < TestEvolve::Core::PageObject

    #Path
    element(:tasks_button) { a(:title, 'Tasks') }
    element(:notifications_button) { a(:title, /Notifications/) }
    element(:tasks_foundation_data_link) { a(:text, 'Foundation Data') }
    element(:data_loading_link) { a(:text, 'Data Loading') }
    element(:dl_download_link) { a(:text, 'Download Foundation Data') }
    element(:dl_upload_link) { a(:text, 'Upload Foundation Data') }
    element(:dl_review_status_link) { a(:text, 'Review Status') }
    element(:dl_download_blank_template_link) { a(:text, 'Download Blank Template') }

    #Review Status
    element(:query_button) { div(:id, /_ATp:_qbeTbr/) }
    element(:process_description_filter) { text_field(:id, /_ATp:t1:_afrFltrMdlc2::content/) }
    element(:process_status_filter) { text_field(:id, /_ATp:t1:_afrFltrMdlc8::content/) }
    element(:data_loading_list) { div(:id, /ap1:at1:_ATp:t1::db/) }
    element(:view_issues_button) { div(:id, /ap1:at1:_ATp:b1/) }
    element(:view_issues_list) { div(:id, /ap1:at1:_ATp:t1::db/) }
    #element(:view_issues_list) { div(:id, /p1:at1:_ATp:t1::db/) } Element Changed with 'ap1' because of raise
    # condition found two element and so that error occurs
    element(:save_and_close_button) { a(:text, 'Save and Close') }
    element(:cancel_button) { a(:text, 'Cancel') }

    #Download and Upload Data
    element(:template_type_dropdown) { select(:id, /templateTypeDescId::content/) }
    element(:template_type_list) { |text| select(:id, /templateTypeDescId::content/).option(:title, text) }
    element(:template_dropdown) { select(:id, /templateDescId::content/) }
    element(:template_list) { |text| select(:id, /templateDescId::content/).option(:title, text) }
    element(:download_button) { div(:id, /2:ap1:b4/) }
    element(:done_button) { div(:id, /2:ap1:APb/) }
    element(:upload_button) { div(:id, /2:ap1:b1/) }
    element(:process_description_field) { text_field(:id, /ap1:it1::content/) }


    ############################################################################################################################


    def open_data_loading
      TryWith.attempts(attempts: 10, sleep: 2) do
        tasks_button.wait_until_present.click
        wait_for_db_activity
        tasks_foundation_data_link.click
        wait_for_db_activity
      end
    end

    ### Download ###

    def open_data_loading_download
      TryWith.attempts(attempts: 3, sleep: 2) do
        tasks_button.click unless dl_download_link.present?
      end
      #scroll_to dl_download_link
      dl_download_link.click
      wait_for_db_activity
    end


    def download_file(template_type, template)
      template_type_dropdown.wait_until_present
      wait_for_db_activity
      select_list(template_type_list(template_type), template_type_dropdown, template_type)
      #send_keys :enter
      wait_for_db_activity
      select_list(template_list(template), template_dropdown, template)
      #send_keys :enter
      wait_for_db_activity
      TryWith.attempts(attempts: 3, sleep: 2) do
        download_button.click
      end
      wait_for_db_activity
    end

    ### Upload ###

    def open_data_loading_upload
      TryWith.attempts(attempts: 3, sleep: 2) do
        tasks_button.click unless dl_upload_link.present?
        #scroll_to dl_upload_link
        dl_upload_link.click
        wait_for_db_activity
      end
    end

    def upload_options_screen(template_type, template)
      template_type_dropdown.wait_until_present.click
      wait_for_db_activity
      select_list(template_type_list(template_type), template_type_dropdown, template_type)
      send_keys :enter
      wait_for_db_activity
      select_list(template_list(template), template_dropdown, template)
      send_keys :enter
      wait_for_db_activity
      raise 'Process Description is not populates' if process_description_field.blank?
      wait_for_db_activity
    end

    def process_description
      wait_for_db_activity
      process_description_field.wait_until_present
      @process_description = process_description_field.value
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
      end
      wait_for_db_activity
    end

    def access_review_status
      tasks_button.click unless dl_review_status_link.present?
      dl_review_status_link.click
      wait_for_db_activity
    end

    def verify_upload(file)
      query_button.wait_until_present
      query_button.click unless process_description_filter.present?
      wait_for_db_activity
      sleep 3

      TryWith.attempts(attempts: 5, sleep: 2) do
        process_description_filter.set file
        process_description_filter.click
        send_keys :enter
        wait_for_db_activity
        raise "Update not found. Time out." unless data_loading_list.text.include? file
      end

      sleep 3
      scroll_to process_status_filter
      @upload_process = data_loading_list.text
      raise "Upload #{file} with errors " unless @upload_process.include? 'Processed Successfully'

      #wait_for_db_activity
      #TryWith.attempts(attempts: 10, sleep: 2) do
      #save_and_close_button.click if save_and_close_button.present?
      #end
    end

    def verify_banners_channels(file)
      query_button.wait_until_present
      query_button.click unless process_description_filter.present?
      wait_for_db_activity
      sleep 3

      TryWith.attempts(attempts: 5, sleep: 2) do
        process_description_filter.set file
        process_description_filter.click
        send_keys :enter
        wait_for_db_activity
        raise "Update not found. Time out." unless data_loading_list.text.include? file
      end

      sleep 3
      scroll_to process_status_filter
      @upload_process = data_loading_list.text
      raise "Upload #{file} with errors " unless @upload_process.include? 'Processed Successfully'

      #wait_for_db_activity
      #TryWith.attempts(attempts: 10, sleep: 2) do
      #save_and_close_button.click if save_and_close_button.present?
      #end
    end


    def verify_failure_upload(file)
      query_button.wait_until_present
      query_button.click unless process_description_filter.present?
      wait_for_db_activity
      sleep 3

      TryWith.attempts(attempts: 5, sleep: 2) do
        process_description_filter.set file
        process_description_filter.click
        send_keys :enter
        wait_for_db_activity
        raise "Update not found. Time out." unless data_loading_list.text.include? file
      end

      sleep 3
      scroll_to process_status_filter
      @upload_process = data_loading_list.text
      raise "Upload #{file} with errors." unless @upload_process.include? 'Processed with errors'
      view_issues_button.click
      wait_for_db_activity
      scroll_to view_issues_list
      view_issues_list.present?
      raise "It's not possible find the Issues Table." unless view_issues_list.present?

      #wait_for_db_activity
      #TryWith.attempts(attempts: 10, sleep: 2) do
      #done_button.click if done_button.present?
      #end

      #wait_for_db_activity
      #TryWith.attempts(attempts: 10, sleep: 2) do
      #save_and_close_button.click if save_and_close_button.present?
      #end
    end

    ##ReUpload##
    def verify_reupload(file, file_action)
      query_button.wait_until_present
      query_button.click unless process_description_filter.present?
      wait_for_db_activity
      sleep 3

      TryWith.attempts(attempts: 5, sleep: 2) do
        process_description_filter.set file
        process_description_filter.click
        send_keys :enter
        wait_for_db_activity
        raise "Update not found. Time out." unless data_loading_list.text.include? file
      end

      sleep 3
      scroll_to process_status_filter
      @upload_process = []
      @upload_process = data_loading_list.text

      if file_action.split.last == 'Upload.ods'

        raise "Upload #{file} with errors." unless @upload_process.include? "Processed with errors"

        view_issues_button.click
        wait_for_db_activity
        scroll_to view_issues_list
        view_issues_list.wait_until(&:present?)
        raise "Error not found" unless view_issues_list.present?

      elsif file_action.split.last == 'ReUpload.ods'
        raise "Upload #{file} with errors." unless @upload_process.include? "Processed Successfully"
      end

    end

  end
end


