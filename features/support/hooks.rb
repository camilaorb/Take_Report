
Before do
  Watir.logger.ignore(:deprecations)
  YML_DATA = YAML.load_file("#{Dir.pwd}/features/support/data/#{TE.environment['test_data_file']}")
end

After do
  if merchandise_hierarchy.cancel_button.present?
    merchandise_hierarchy.cancel_button.click
    wait_for_db_activity
  end
  merchandise_hierarchy.cancel_button.click
  wait_for_db_activity
  login_page.logout_to_rms
  puts 'Successfully logged out in After Hook.'
rescue
  puts 'Failed to logout in After Hook.'
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