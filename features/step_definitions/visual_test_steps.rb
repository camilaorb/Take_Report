When(/^I perform no visual check in the scenario$/) do
  # do nothing
end

Then(/^no visual check is displayed in the report$/) do
  # do nothing
end

And(/^the scenario visual test status should be '(.*)'$/) do |_status|
  # do nothing
end

When(/^I run TestEvolve\.visual_check for label '(.*)'$/) do |label|
  TestEvolve.visual_check(label)
end

When(/^I run TestEvolve\.visual_check for label '(.*)' when no visual regressions have occurred$/) do |label|
  TestEvolve.visual_check(label)
end

When(/^I run TestEvolve\.visual_check for label '(.*)' when visual regressions have occurred$/) do |label|
  TE.browser.goto 'file:///' + Dir.pwd + TestEvolve.environment['site_path'] + 'modified_home.html'
  TestEvolve.visual_check(label)
end

When(/^I run TestEvolve\.visual_check for a label that has no baseline$/) do
  baseline_image = 'visual_testing/baseline/new-label.png'
  File.delete(baseline_image) if File.exist?(baseline_image)
  TestEvolve.visual_check('new-label')
end

Then(/^the new baseline image is displayed in the report$/) do
  # do nothing
end

And(/^a baseline image exists for label '(.*)'$/) do |label|
  baseline_image = "visual_testing/baseline/#{label}.png"
  File.delete(baseline_image) if File.exist?(baseline_image)
  TestEvolve.visual_check(label)
end

Then(/^confirmation of a successful visual check is displayed in the report$/) do
  # do nothing
end

Then(/^confirmation of a failed visual check is displayed in the report$/) do
  # do nothing
end

When(/^multiple visual checks occur for different labels where no visual regressions have occurred$/) do
  TestEvolve.visual_check('label1')
  TestEvolve.visual_check('label1')
  TestEvolve.visual_check('label2')
  TestEvolve.visual_check('label2')
end

But(/^the test functionally fails and does not complete$/) do
  raise 'fail for demo purposes'
end
