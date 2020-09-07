require 'test-evolve/core/page_object'

module Pages
  def local_forms_page
    @local_forms_page ||= LocalFormsPage.new
  end

  class LocalFormsPage < TestEvolve::Core::PageObject
    element(:first_name_field) { text_field data_test: 'first-name-field' }
    element(:last_name_field) { text_field data_test: 'last-name-field' }
    element(:description_field) { textarea data_test: 'description-field' }
    element(:submit_form_link) { a data_test: 'submit-link' }
    element(:banana) { text_field data_test: 'banana' }

    def visit
      TestEvolve.log.info "Visiting the simple form example page"
      goto 'file:///' + Dir.pwd + TestEvolve.environment['site_path'] + 'simple_form.html'
    end

    def enter_form_details
      TestEvolve.log.info "Entering test data into form"
      first_name_field.set 'TestEvolve'
      last_name_field.set 'User'
      description_field.send_keys 'Test Evolve is the Agile Automated Testing Framework used by some of the world’s biggest brands'
    end

    def enter_form_details_from_hash(details)
      TestEvolve.log.info "Entering details into form: #{details}"
      # raise unless not_a_field.visible?
      # raise unless first_name_field.present?
      # raise unless first_name_field.visible?
      # raise unless first_name_field.exists?
      banana.click
      first_name_field.set details['First Name']
      last_name_field.set details['Last Name']
      description_field.send_keys details['Description']
    end

    def submit_data
      TestEvolve.log.info 'Submitting form data'
      submit_form_link.click
    end
  end
end
