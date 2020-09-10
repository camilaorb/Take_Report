Before do
  YML_DATA = YAML.load_file("#{Dir.pwd}/features/support/data/#{TE.environment['test_data_file']}")
end

After do
  if login_page.user_logged_in?
    login_page.logout_to_rms
    puts 'Successfully logged out in After Hook.'
  end
rescue
  puts 'Failed to logout in After Hook.'
end