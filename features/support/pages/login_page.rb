require 'test-evolve/core/page_object'

module Pages
  def login_page
    @login_page ||= LoginPage.new
  end

  class LoginPage < TestEvolve::Core::PageObject

    ############################# Objects #####################


    #Login
    element(:username_field) { text_field(:id, 'pt1:r1:0:login_it1::content') }
    element(:password_field) { text_field(:id, 'pt1:r1:0:login_it2::content') }
    element(:login_button) { a(:text, 'Login') }
    element(:menu_dropdown) { div(:id, /defGlobalMenu/) }
    element(:logout_option) { td(:text, 'Logout') }
    element(:logout_message) { div(:text, /You are about to logout/) }
    element(:yes_button) { a(:text, 'Yes') }
    element(:user_menu) { |text| div(:title, text) }
    element(:error_message_popup) { div(:id, 'd1_msgDlg::_ccntr') }
    element(:sign_in) { span(:text, 'Login') }

    ############################# Methods ####################

    def login_to_rms(usr, pwd)
      TryWith.attempts(attempts: 3, sleep: 2) do
        username_field.set usr
        password_field.set pwd
      end
      TryWith.attempts(attempts: 3, sleep: 2) do
        login_button.click
      end
      raise 'login failed' unless user_menu(usr).present?
    end

    def logout_to_rms
      TryWith.attempts(attempts: 3, sleep: 2) do
        menu_dropdown.wait_until_present.click
        logout_option.click
        logout_message.wait_until_present
        yes_button.click
        wait_for_db_activity
      end
    end

    def display_login_details(username)
      puts "User logged in as :     '#{username}'    \n"
    end

    def verify_user_logout
      TryWith.time(timeout: 30) do
        raise 'User not logged out' unless sign_in.exist?
      end
    end

    def verify_error_message_popup_present
      sleep 0.5
      raise 'login error message not displayed as expected' unless error_message_popup.exist?
    end

    def user_logged_in?(usr)
      user_menu(usr).present?

    end
  end
end
