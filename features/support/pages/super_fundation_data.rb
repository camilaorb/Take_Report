require 'test-evolve/core/page_object'

module Pages
  def super_foundation_data
    @super_foundation_data ||= SuperFoundationData.new
  end

  class SuperFoundationData < TestEvolve::Core::PageObject

    include Pages
############################# Methods ####################



    def delete_diff_type_file
    foundation_data_loading.upload_options_screen( 'Items', 'Differentiators')
    @process_description = foundation_data_loading.process_description
    foundation_data_loading.upload_a_file 'DIFF-20 Diff Types - Delete.ods'
    foundation_data_loading.verify_upload(@process_description)
    end

    def delete_update_file(template_type, template)
      foundation_data_loading.upload_options_screen(template_type, template)
      @process_description = foundation_data_loading.process_description
      foundation_data_loading.upload_a_file @file
      foundation_data_loading.verify_upload(@process_description)
    end

    def update_file_to_edit(info)
      input = YML_DATA[info]
      template_type = input.values[0]
      template = input.values[1]
      file = input.values[2]
      foundation_data_loading.upload_options_screen(template_type, template)
      @process_description = foundation_data_loading.process_description
      foundation_data_loading.upload_a_file file
      foundation_data_loading.verify_upload(@process_description)
    end


  end
end
