require 'test-evolve/core/page_object'

module Pages
  def super_foundation_data
    @super_foundation_data ||= SuperFoundationData.new
  end

  class SuperFoundationData < TestEvolve::Core::PageObject

    include Pages
############################# Methods ####################



    def delete_update_file(template_type, template)
    foundation_data_loading.upload_options_screen(template_type, template)
    @process_description = foundation_data_loading.process_description
    foundation_data_loading.upload_a_file @file
    foundation_data_loading.verify_upload(@process_description)
    end

    def update_file_to_edit(info)
      info.hashes.each do |value|
        @file = value[:file]
        foundation_data_loading.upload_options_screen(value[:template_type], value[:template])
      end
      @process_description = foundation_data_loading.process_description
      foundation_data_loading.upload_a_file value[:file]
      foundation_data_loading.verify_upload(@process_description)
    end


  end
end
