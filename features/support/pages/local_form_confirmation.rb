module Pages
  def local_form_confirmation_page
    @local_form_confirmation_page ||= LocalFormConfirmationPage.new
  end

  class LocalFormConfirmationPage < TestEvolve::Core::PageObject
    element(:form_confirmation_header) { h1 data_test: 'form-confirmation-header' }

    def verify_page_displayed
      raise 'Test Evolve Form Confirmation Page was not displayed' unless form_confirmation_header.present?
      TestEvolve.log.info 'Test Evolve Form Confirmation Page was displayed'
    end
  end
end
