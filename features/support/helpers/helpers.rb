require 'nokogiri'
require 'json'

# example helper methods

def wait_for_db_activity
  TryWith.time(timeout: 300) do
    raise 'DB activity did not complete within allowed time limit' unless $browser.span(:id, 'pt1:statusIndComp').img.alt == 'Idle'
  end
end

def parse_json(response)
  JSON.parse(response.force_encoding('utf-8'))
end

def parse_xml(response)
  Nokogiri::XML(response)
end

def write_response(name, format, response)
  case format
  when 'json'
    json = parse_json(response)
    File.open("#{TestRunInfo.directory}/#{name}", 'a+') do |file|
      file.write('Example json response' + "\n#{JSON.pretty_generate(json)}\n\n")
    end
  when 'xml'
    xml = parse_xml(response)
    File.open("#{TestRunInfo.directory}/#{name}", 'a+') do |file|
      file.write('Example XML response' + "\n#{xml.to_xml}\n\n")
    end
  else
    raise(HelperError, "The format should be XML or Json but is #{format}")
  end
end

def visit(url)
  $browser.goto(url)
end

def verify_url(url, expected_url)
  Watir::Wait.until { $browser.url != url }
  raise "The expected URL is this #{expected_url} but we got #{$browser.url}" unless $browser.url == expected_url
end

def delete_browser_cookies
  $browser.cookies.clear
end

def scroll_to(object)
  wait_for_db_activity
  execute_script('arguments[0].scrollIntoView();', object)
end

def upload_file(tag, element, path)
  $browser.file_field(:"#{tag}" => element).set(path)
end

def wait_until_enabled(element)
  TryWith.time(timeout: 30, message: "Your required element was not enabled within 30s:  #{element}") { raise "Your required element was not enabled within 30s:  #{element}" unless element.enabled? }
end

def wait_until_data_set(element)
  # TryWith.time(timeout: 60, message: "Your required field did not receive its DB value within 60s:  #{element}") { raise unless element.selected?(/^(?!\s*$).+/) }
  TryWith.time(timeout: 10) do
    raise "Your required field did not receive its DB value within 10s:  #{element}" unless element.selected?(/^(?!\s*$).+/)
  end
end

def wait_until_disabled(element)
  Watir::Wait.until(message: "Element: '#{element} not disabled.'") { element.disabled? }
end

def refresh
  $browser.refresh
end

def example_goto
  $browser.goto(EnvConfig['example_site'])
end

class HelperError < RuntimeError
end

def run_batch(server, username, pwd, batch_name, db_user, db_pwd)
  database.connect_to_db('db_hostname', 'db_port', 'db_servicename', 'db_username', 'db_password')

  batch_status = database.verify_batch_status(batch_name)

  unless batch_status == 'ready for start'
    TryWith.attempts(attempts: 3, sleep: 2) do
      database.reset_batch_status(batch_name)
      batch_status = database.verify_batch_status(batch_name)
      raise "After 3 attempts - we have been unable to reset the batch status to: 'ready for start'" unless batch_status == 'ready for start'
    end
  end

  TryWith.attempts(attempts: 3, sleep: 2) do
    execute_batch(["-h#{server}", "-u#{username}", "-p#{pwd}", "-csource ~/.bash_profile>/dev/null; $MMHOME/oracle/proc/bin/#{batch_name} #{db_user}/#{db_pwd}"])
    batch_status = database.verify_batch_status(batch_name)
    raise "After 3 attempts - we have been unable to execute the batch successfully - status not equal to: 'completed'" unless batch_status == 'completed'
  end

  if batch_status == 'completed'
    TryWith.attempts(attempts: 3, sleep: 2) do
      database.reset_batch_status(batch_name)
      batch_status = database.verify_batch_status(batch_name)
      raise "After 3 attempts - we have been unable to reset the batch status to: 'ready for start'" unless batch_status == 'ready for start'
    end
  end

  database.disconnect_db

end


def select_list(element_list, elemente_field, purchase)
  if elemente_field.text == (purchase)
  else
    elemente_field.click
    element_list.select
    elemente_field.click
    wait_for_db_activity
  end
end