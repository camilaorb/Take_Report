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
    element(:close_popup) { a(:id, /d1::close/) }
    element(:close_popup_2) { a(:id, /d3::close/) }

    #BWS
    element(:bws_id){text_field(id: /username::content/)}
    element(:bws_password){text_field(id: /password::content/)}
    element(:bws_login_button){span(text: 'Login')}
    element(:_admin) { a(text: /ADMIN/) }
    element(:_logout) { td(text: 'Logout') }

    ############################# Methods ####################

    def login_to_rms(usr, pwd)
      TryWith.attempts(attempts: 3, sleep: 2) do
        username_field.set usr
        password_field.set pwd
      end
      TryWith.attempts(attempts: 3, sleep: 2) do
        login_button.click
      end
      wait_for_db_activity
      TryWith.attempts(attempts: 3, sleep: 5) do
        raise 'login failed' unless user_menu(usr).present?
        wait_for_db_activity
      end
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



    ## Login To BWS ##
    def login_to_bws (id, pwd)
      TryWith.attempts(attempts: 2, sleep: 1) do
        bws_id.send_keys id
        bws_password.send_keys pwd
      end
      TryWith.attempts(attempts: 2, sleep: 1) do
        bws_login_button.click
      end
    end

    def log_out_from_bws
      _admin.click
      _logout.click
    end


  end
end
