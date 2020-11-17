
Before do
  Watir.logger.ignore(:deprecations)
  YML_DATA = YAML.load_file("#{Dir.pwd}/features/support/data/#{TE.environment['test_data_file']}")
end

After ('@DIFF-01' '@DIFF-02' '@DIFF-03' '@DIFF-04' '@DIFF-05' '@DIFF-06' '@DIFF-27' '@DIFF-07' '@DIFF-08' '@DIFF-10' '@DIFF-11') do
  if differentiators_diff.cancel_button.present?
    differentiators_diff.cancel_button.click
    wait_for_db_activity
  end
  merchandise_hierarchy.cancel_button.present?
  merchandise_hierarchy.cancel_button.click
  wait_for_db_activity
  puts 'Successfully close pages out in After Hook.'
rescue
  puts 'Failed to close pages in After Hook.'
end

After ('@SUP-02' '@SUP-03') do
  if supplier.cancel_button.present?
    supplier.cancel_button.click
    wait_for_db_activity
  end
  supplier.cancel_button.present?
  supplier.cancel_button.click
  wait_for_db_activity
  puts 'Successfully close pages out in After Hook.'
rescue
  puts 'Failed to close pages in After Hook.'
end

After ('@logout_rms') do
  if login_page.close_popup.present?
    login_page.close_popup.click
    wait_for_db_activity
  elsif login_page.close_popup_2.present?
    login_page.close_popup.click
    wait_for_db_activity
  end
  merchandise_hierarchy.cancel_button.click
  wait_for_db_activity
  login_page.logout_to_rms
  puts 'Successfully logged out in After Hook.'
end

Before ('@upload_diff_type_file') do
  if login_page.close_popup.present?
    login_page.close_popup.click
    wait_for_db_activity
  elsif login_page.close_popup_2.present?
    login_page.close_popup.click
    wait_for_db_activity
  end
  merchandise_hierarchy.cancel_button.click
  wait_for_db_activity
  login_page.logout_to_rms
  puts 'Successfully logged out in After Hook.'
end

After ('@delete_diff_id_file') do
  xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{@file}")
  xls.sheet(0).set(2, 1, 'Delete')
  foundation_data_loading.open_data_loading_upload
  @process_description = foundation_data_loading.process_description
  foundation_data_loading.upload_a_file @file
  foundation_data_loading.verify_upload(@process_description)
  login_page.logout_to_rms
  puts 'Successfully logged out in After Hook.'
end