require 'test-evolve/core/page_object'

module Pages
  def local_homepage
    @local_homepage ||= LocalHomepage.new
  end

  class LocalHomepage < TestEvolve::Core::PageObject
    element(:test_evolve_header) { h1 data_test: 'test-evolve-header' }
    element(:test_evolve_logo) { img data_test: 'test-evolve-logo' }
    element(:first_name_field) { text_field data_test: 'first-name-field' }

    def visit
      goto 'file:///' + Dir.pwd + TestEvolve.environment['site_path'] + 'home.html'
    end

    def verify_page_displayed
      raise 'Test Evolve Test Page was not displayed' unless test_evolve_header.present?
      TestEvolve.log.info 'Test Evolve Test Page was displayed'
    end

    def verify_logo_displayed
      raise 'Test Evolve Logo does not exist' unless test_evolve_logo.exists?
      raise 'Test Evolve Logo is not visible' unless test_evolve_logo.visible?
      raise 'Test Evolve Logo does not exist or is not visible' unless test_evolve_logo.present?
      TestEvolve.log.info 'Test Evolve Logo was displayed on the page'
    end

    def verify_header_text(expected_text)
      actual_text = test_evolve_header.text
      raise "Header text was '#{actual_text}', not '#{expected_text}'" unless actual_text == expected_text
      TestEvolve.log.info "Test Evolve header text was '#{actual_text}'"
    end
  end
end
