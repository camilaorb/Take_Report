require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'yard'
require 'parallel_tests/tasks'

namespace :test do
  desc 'Runs the rubocop linter'
  RuboCop::RakeTask.new(:rubocop)
end

desc 'Generates living documentation'
YARD::Rake::YardocTask.new(:documentation) do |t|
  YARD::Config.options[:load_plugins] = true
  YARD::Config.load_plugins
  t.files = %w[features/**/*.feature features/step_definitions/**/*.rb]
end

task default: 'test:rubocop'

# The below implementation demonstrates our desired functionality but needs to be done in a programmatic way to work cross platform
namespace :ci do
  desc 'Run tests using specific configs'
  task :demo_chrome do
    ENV['CONFIG_DIR'] = 'ci_config/chrome'
    system 'parallel_cucumber features'
  rescue StandardError => e
    puts "At least one test failed, please check your reports. #{e}"
  end

  task :demo_firefox do
    ENV['CONFIG_DIR'] = 'ci_config/firefox'
    system 'parallel_cucumber features'
  rescue StandardError => e
    puts "At least one test failed, please check your reports. #{e}"
  end

  task :critical_tests do
    ENV['CONFIG_DIR'] = 'ci_config/critical_tests'
    system "parallel_cucumber -n 1 features -o \"-t '@critical and not (@bug or @wip or @singlethread)'\""
  rescue StandardError => e
    puts "At least one test failed, please check your reports. #{e}"
  end

  task :no_critical_tests do
    ENV['CONFIG_DIR'] = 'ci_config/no_critical_tests'
    system "parallel_cucumber -n 1 features -o \"-t '@no_critical and not (@bug or @wip or @singlethread or @critical)'\""
  rescue StandardError => e
    puts "At least one test failed, please check your reports. #{e}"
  end

  task :bws_tests do
    ENV['CONFIG_DIR'] = 'ci_config/bws_tests'
    system "parallel_cucumber -n 1 features -o \"-t '@bws_tests and not (@bug or @wip or @singlethread)'\""
  rescue StandardError => e
    puts "At least one test failed, please check your reports. #{e}"
  end

  task :foundation_tests do
    ENV['CONFIG_DIR'] = 'ci_config/foundation_tests'
    Dir['features/RMS_V19/banner_and_channel.feature']
    system "parallel_cucumber -n 1 features -o \"-t 'not (@bug or @wip or @singlethread)'\""
  rescue StandardError => e
    puts "At least one test failed, please check your reports. #{e}"
  end

end
