
@feature_user_login
Feature: LoginScreenforRecruiters

Background: 
  Given the user is on the Login Screen

@valid-login
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>"
  And I enter "<password>"
  And I click the 'Login' button
  And I wait for the system to process the login request
  Then the dashboard should be displayed

  Examples:
    | email_id           | password            |
    | krishna@gmail.com  | validPassword123    |

@valid-login-button
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter a valid email ID "<emailID>"
  And I enter a valid password "<password>"
  Then the Login button should be enabled

  Examples:
    | emailID             | password            |
    | krishna@gmail.com   | ValidPassword123    |

@show_hide_password
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter a valid password "<password>"
  And I click the 'Show Password' option
  Then the password should be visible
  And I click the 'Hide Password' option
  Then the password should be hidden

  Examples:
    | password          |
    | ValidPassword123  |

  @invalid-email-format
  Scenario Outline: Login Screen for Recruiters
    Given the user is on the login screen
    When I enter "<email>"
    And I enter "<password>"
    And I click the 'Login' button
    Then the user should see the error message 'Incorrect email ID or password.'

    Examples:
      | email        | password          |
      | user@domain  | validPassword123   |

@valid-recruiter-login
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>"
  And I enter "<password>"
  And I check the 'Remember Me' option
  And I click the 'Login' button
  Then the system processes the login request without errors
  And the user logs out successfully
  And the user returns to the Login Screen
  Then the email ID is pre-filled in the Email ID field

  Examples:
    | email_id          | password            |
    | krishna@gmail.com | ValidPassword123    |

@valid_login
Scenario Outline: Login Screen for Recruiters
  Given the user navigates to the login screen
  When I enter "<email_id>"
  And I enter "<password>"
  And I ensure the 'Remember Me' option is unchecked
  And I click the 'Login' button
  Then the system processes the login request
  And I log out and return to the login screen
  Then the email ID field is empty

  Examples:
    | email_id           | password            |
    | krishna@gmail.com  | validPassword123    |

@empty_email_error
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When the user leaves the Email ID field empty
  And the user enters a valid password "<password>"
  And the user clicks the 'Login' button
  Then an error message 'Incorrect email ID or password.' should be displayed

  Examples:
    | password          |
    | ValidPassword123  |

  @feature_user_login
  @empty_password_error
  Scenario Outline: Login Screen for Recruiters
    Given the user is on the Login Screen
    When I enter "<email_id>"
    And I leave the Password field empty
    And I click the 'Login' button
    And I wait for the system to process the login request
    Then an error message 'Incorrect email ID or password.' is displayed

    Examples:
      | email_id          |
      | krishna@gmail.com |

@empty_fields_login
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  And the Email ID field is <email ID>
  And the Password field is <password>
  When the user clicks the 'Login' button
  And the system processes the login request
  Then an error message 'Incorrect email ID or password.' is displayed

  Examples:
    | email ID | password |
    |          |          |

  @valid-login
  Scenario Outline: Login Screen for Recruiters
    When I enter "<email>"
    And I enter "<password>"
    And I click the 'Login' button
    Then the dashboard is displayed

    Examples:
      | email                      | password           |
      | user.name+tag@domain.com  | validPassword123   |

@valid-login-max-email
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter a valid email ID with maximum length "<email>"
  And I enter a valid password "<password>"
  And the user clicks the 'Login' button
  And I wait for the system to process the login request
  Then the dashboard should be displayed

  Examples:
    | email                                                                                                                                                                                                                     | password         |
    | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | validPassword123 |

@max_length_login
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>"
  And I enter "<password>"
  And the user clicks the 'Login' button
  Then the dashboard should be displayed

  Examples:
    | email_id            | password                                                                 |
    | krishna@gmail.com   | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

@sql-injection-test
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>"
  And I enter "<password>"
  And the user clicks the 'Login' button
  And the system processes the login request
  Then an error message 'Incorrect email ID or password.' is displayed

  Examples:
    | email_id                 | password            |
    | user' OR '1'='1'        | validPassword123    |

  @xss-password-test
  Scenario Outline: Login Screen for Recruiters
    Given the user is on the Login Screen
    And I enter a valid email ID "<email_id>"
    And I enter an XSS attempt in the Password field "<password>"
    And I click the 'Login' button
    And I wait for the system to process the login request
    Then the error message 'Incorrect email ID or password.' is displayed

    Examples:
      | email_id            | password                     |
      | krishna@gmail.com   | <script>alert('XSS')</script> |

@slow_network_login
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>" in the Email ID field
  And I enter "<password>" in the Password field
  And I simulate a slow network connection
  And I click the 'Login' button
  And I wait for the system to process the login request
  Then the dashboard should be displayed after a delay

  Examples:
    | email_id          | password            |
    | krishna@gmail.com | ValidPassword123    |

@session_timeout_login
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email>"
  And I enter "<password>"
  And I click the 'Login' button
  And I wait for the system to process the login request
  And I simulate a session timeout
  And I attempt to access the dashboard
  Then the user should be redirected to the login screen

  Examples:
    | email               | password  |
    | recruiter@example.com | Pass123   |
    | admin@example.com   | Admin321  |

@validate_login_persistence
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>" in the Email ID field
  And I enter "<password>" in the Password field
  And I click the 'Login' button
  And I wait for the system to process the login request
  Then the dashboard should be displayed
  When I refresh the browser
  Then the user should remain on the dashboard

  Examples:
    | email               | password           |
    | krishna@gmail.com   | ValidPassword123   |

@valid-login
Scenario Outline: Login Screen for Recruiters
  Given the user navigates to the login screen in the first tab
  When the user enters "<email>" in the Email ID field
  And the user enters "<password>" in the Password field
  And the user clicks the 'Login' button in the first tab
  And the system processes the login request
  Then the dashboard is displayed in the first tab
  And the second tab remains on the login screen

  Examples:
    | email                | password           |
    | krishna@gmail.com    | ValidPassword123   |

@valid-login
Scenario Outline: Login Screen for Recruiters
  Given the user opens the application in "<browser>"
  When the user navigates to the login screen
  And the user enters a valid email ID "<email>"
  And the user enters a valid password "<password>"
  And the user clicks the 'Login' button
  Then the system processes the login request
  And the dashboard is displayed successfully in "<browser>"

  Examples:
    | browser | email               | password            |
    | Chrome  | krishna@gmail.com   | ValidPassword123    |
    | Firefox | krishna@gmail.com   | ValidPassword123    |

@valid_login
Scenario Outline: Login Screen for Recruiters
  Given the user opens the application on a mobile device
  And the user navigates to the login screen
  When the user enters "<email_id>" in the Email ID field
  And the user enters "<password>" in the Password field
  And the user clicks the 'Login' button
  Then the system processes the login request
  And the dashboard should be displayed on the mobile device

  Examples:
    | email_id           | password            |
    | krishna@gmail.com  | ValidPassword123    |

@validate_screen_reader_accessibility
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When the screen reader reads the labels for Email ID and Password fields
  And I enter a valid email ID "<email_id>" in the Email ID field using the keyboard
  And I enter a valid password "<password>" in the Password field using the keyboard
  And I click the 'Login' button using the keyboard
  And I wait for the system to process the login request
  Then the dashboard should be displayed

  Examples:
    | email_id           | password            |
    | krishna@gmail.com  | ValidPassword123    |

@keyboard_navigation
Scenario Outline: Login Screen for Recruiters
  When I use the Tab key to focus on the Email ID field
  And I enter a valid email ID in the Email ID field "<email>"
  And I use the Tab key to focus on the Password field
  And I enter a valid password in the Password field "<password>"
  And I use the Tab key to focus on the 'Login' button
  And I press Enter to click the 'Login' button
  Then the system processes the request without errors

  Examples:
    | email                 | password          |
    | krishna@gmail.com     | ValidPassword123   |

@access_password_reset_link
Scenario Outline: Login Screen for Recruiters
  When the user clicks on the 'Forgot Password?' link
  Then the password reset screen should be displayed
  When the user enters a valid email ID "<email>"
  And the user clicks the 'Send Reset Link' button
  Then a success message should be displayed

  Examples:
    | email              |
    | krishna@gmail.com  |

@valid_login
Scenario Outline: Login Screen for Recruiters
  Given the user is on the login screen
  When I enter "<email>"
  And I enter "<password>"
  And the user clicks the 'Login' button
  Then the dashboard should be displayed

  Examples:
    | email               | password         |
    | krishna@gmail.com   | P@ssw0rd123!     |

@expired-password-login
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email>"
  And I enter "<password>"
  And I click the 'Login' button
  And I wait for the system to process the login request
  Then the user is prompted to change their password

  Examples:
    | email               | password              |
    | krishna@gmail.com   | expiredPassword123    |

@multiple_failed_attempts
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>"
  And I enter "<password>"
  And I click the 'Login' button
  And I repeat the above steps for a total of 5 failed attempts
  Then the account should be locked after the 5th attempt

  Examples:
    | email_id           | password        |
    | krishna@gmail.com  | wrongpassword   |

@valid_password_hint
Scenario Outline: Login Screen for Recruiters
  When the user clicks on the 'Forgot Password?' link
  And the user enters "<email>" in the reset field
  And the user clicks the 'Send Reset Link' button
  Then the system processes the request
  And a password hint is displayed

  Examples:
    | email              |
    | krishna@gmail.com  |

  @password_reset
  Scenario Outline: Login Screen for Recruiters
    When the user clicks on the 'Forgot Password?' link
    And the user enters a valid email ID "<email>"
    And the user clicks the 'Send Reset Link' button
    And the user waits for the system to process the request
    And the user changes the password using the link sent to the email
    And the user logs in with the new password
    Then a notification is displayed confirming the password change

    Examples:
      | email               |
      | krishna@gmail.com   |

@password_recovery
Scenario Outline: Login Screen for Recruiters
  When the user clicks on the 'Forgot Password?' link
  And the user selects the option to recover using security questions
  And the user answers the security questions correctly
  And the user sets a new password
  And the user logs in with the new password
  Then the dashboard is displayed

  Examples:
    | <username> | <new_password> |
    | user1      | Password123    |

@valid_password_reset
Scenario Outline: Login Screen for Recruiters
  When the user clicks on the 'Forgot Password?' link
  And the user enters a valid email ID "<email>"
  And the user clicks the 'Send Reset Link' button
  And the user waits for the system to process the request
  Then the user checks the email for a confirmation message
  And the user verifies that the confirmation message is received

  Examples:
    | email              |
    | krishna@gmail.com  |

@password_reset_expiration
Scenario Outline: Login Screen for Recruiters
  When the user clicks on the 'Forgot Password?' link
  And the user enters a valid email ID "<email>"
  And the user clicks the 'Send Reset Link' button
  And the user waits for the system to process the request
  When the user attempts to use the reset link after the expiration period
  Then an error message indicates the link has expired

  Examples:
    | email               |
    | krishna@gmail.com   |

  @password_reset_link_reuse
  Scenario Outline: Login Screen for Recruiters
    Given the user navigates to the login screen
    When the user clicks on the 'Forgot Password?' link
    And the user enters a valid email ID "<email>"
    And the user clicks the 'Send Reset Link' button
    And the user waits for the system to process the request
    And the user uses the reset link to change the password
    And the user attempts to use the same reset link again
    Then the user verifies that an error message is displayed

    Examples:
      | email              |
      | krishna@gmail.com  |

@invalid-login
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email>"
  And I enter "<password>"
  And the user clicks the 'Login' button
  Then an error message 'Incorrect email ID or password.' is displayed

  Examples:
    | email             | password             |
    | krishna@gmail.com | wrongPassword123     |

@invalid-email
Scenario Outline: Login Screen for Recruiters
  When I enter "<email>"
  And I enter "<password>"
  And I click the Login button
  Then I should see an error message 'Incorrect email ID or password.'

  Examples:
    | email   | password          |
    | abc@    | validPassword123   |

  @sql-injection-test
  Scenario Outline: Login Screen for Recruiters
    Given the user is on the Login Screen
    When I enter "<email>"
    And I enter "<password>"
    And I click the 'Login' button
    And I wait for the system to process the login request
    Then an error message 'Incorrect email ID or password.' is displayed

    Examples:
      | email              | password          |
      | krishna@gmail.com  | ' OR '1'='1      |

@xss_login_attempt
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>"
  And I enter "<password>"
  And the user clicks the 'Login' button
  And the system processes the request
  Then an error message 'Incorrect email ID or password.' is displayed

  Examples:
    | email_id                      | password          |
    | <script>alert('XSS')</script> | validPassword123  |

  @empty_fields_error
  Scenario Outline: Login Screen for Recruiters
    Given the user is on the Login Screen
    When I leave the Email ID field empty
    And I leave the Password field empty
    And I click the 'Login' button
    And I wait for the system to process the login request
    Then an error message 'Incorrect email ID or password.' is displayed

    Examples:
      | email ID | password |
      |          |          |

@error_message_empty_email
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  And the Email ID field is empty
  When I enter "<password>"
  And I click the 'Login' button
  And I wait for the system to process the login request
  Then an error message 'Incorrect email ID or password.' is displayed

  Examples:
    | password          |
    | ValidPassword123  |

  @feature_user_login
  @empty-password-error
  Scenario Outline: Login Screen for Recruiters
    Given the user is on the Login Screen
    When I enter "<email>"
    And I leave the Password field empty
    And I click the 'Login' button
    And I wait for the system to process the login request
    Then an error message 'Incorrect email ID or password.' is displayed

    Examples:
      | email             |
      | krishna@gmail.com |

@invalid-email-format
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>"
  And I enter "<password>"
  And the user clicks the 'Login' button
  And the system processes the login request
  Then an error message 'Incorrect email ID or password.' is displayed

  Examples:
    | email_id         | password            |
    | user@domain      | ValidPassword123    |

  @account_locked
  Scenario Outline: Login Screen for Recruiters
    Given the user enters a valid email ID "<email_id>"
    When the user enters an incorrect password "<password>"
    And the user clicks the Login button
    And the user repeats steps 2 to 4 for a total of 5 failed attempts
    Then the user should see an account locked message

    Examples:
      | email_id           | password        |
      | krishna@gmail.com  | wrongpassword   |

  @expired-password-prompt
  Scenario Outline: Login Screen for Recruiters
    Given the user is on the Login Screen
    When I enter "<email>"
    And I enter "<password>"
    And I click the Login button
    And I wait for the system to process the login request
    Then the user is prompted to change their password

    Examples:
      | email               | password             |
      | krishna@gmail.com   | expiredPassword123   |

@invalid_password
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>"
  And I enter "<password>"
  And I click the 'Login' button
  And I wait for the system to process the login request
  Then an error message 'Incorrect email ID or password.' is displayed

  Examples:
    | email_id            | password  |
    | krishna@gmail.com   | password  |

@invalid_reset_link
Scenario Outline: Login Screen for Recruiters
  When the user clicks on the 'Forgot Password?' link
  And the user enters "<email>" in the reset field
  And the user clicks the 'Send Reset Link' button
  And the user waits for the system to process the request
  And the user attempts to use an invalid reset link
  Then an error message indicating the link is invalid is displayed

  Examples:
    | email             |
    | krishna@gmail.com |

  @expired_reset_link
  Scenario Outline: Login Screen for Recruiters
    Given the user clicks on the 'Forgot Password?' link
    When the user enters "<email>"
    And the user clicks the 'Send Reset Link' button
    And the user waits for the system to process the request
    And the user attempts to use the reset link after the expiration period
    Then an error message indicating the link has expired is displayed

    Examples:
      | email              |
      | krishna@gmail.com  |

@password-reset-used
Scenario Outline: Login Screen for Recruiters
  When the user clicks on the 'Forgot Password?' link
  And the user enters a valid email ID "<email>"
  And the user clicks the 'Send Reset Link' button
  And the user waits for the system to process the request
  And the user uses the reset link to change the password
  And the user attempts to use the same reset link again
  Then an error message indicating the link has already been used is displayed

  Examples:
    | email             |
    | krishna@gmail.com |

@valid_login_recruiter
Scenario Outline: Login Screen for Recruiters
  Given the user is on the login screen
  When I enter "<email>"
  And I enter "<password>"
  And I click the 'Login' button
  And I wait for the system to process the login request
  Then the dashboard should be displayed

  Examples:
    | email                                                                                      | password              |
    | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | validPassword123      |

@valid-login-maximum-length
Scenario Outline: Login Screen for Recruiters
  Given the user is on the login screen
  When I enter "<email_id>"
  And I enter "<password>"
  And I click the 'Login' button
  And I wait for the system to process the login request
  Then the dashboard should be displayed

  Examples:
    | email_id            | password                                                                                                                                      |
    | krishna@gmail.com   | aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |

@valid_login_special_characters
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email>"
  And I enter "<password>"
  And the user clicks the Login button
  Then the dashboard is displayed

  Examples:
    | email                        | password           |
    | user.name+tag@domain.com    | validPassword123   |

@valid_login_slow_network
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email>"
  And I enter "<password>"
  And the user simulates a slow network connection
  And the user clicks the 'Login' button
  And the user waits for the system to process the login request
  Then the dashboard should be displayed after a delay

  Examples:
    | email               | password          |
    | krishna@gmail.com   | ValidPassword123  |

@session_timeout
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email>"
  And I enter "<password>"
  And I click the 'Login' button
  And I wait for the system to process the login request
  And I simulate a session timeout
  And I attempt to access the dashboard
  Then the user should be redirected to the login screen

  Examples:
    | email                  | password   |
    | recruiter@example.com  | Recruit123 |

@valid-login
Scenario Outline: Login Screen for Recruiters
  Given the user navigates to the login screen in the first tab
  When the user enters a valid email ID "<emailID>"
  And the user enters a valid password "<password>"
  And the user clicks the 'Login' button in the first tab
  Then the dashboard should be displayed in the first tab
  And the second tab should remain on the login screen

  Examples:
    | emailID           | password           |
    | krishna@gmail.com | ValidPassword123   |

@valid-login
Scenario Outline: Login Screen for Recruiters
  Given the user opens the application in "<browser>"
  And navigates to the login screen
  When I enter "<email>"
  And I enter "<password>"
  And I click the 'Login' button
  And I wait for the system to process the login request
  Then the dashboard should be displayed in "<browser>"

  Examples:
    | browser | email               | password              |
    | Chrome  | krishna@gmail.com   | ValidPassword123      |
    | Firefox | krishna@gmail.com   | ValidPassword123      |

@valid_login
Scenario Outline: Login Screen for Recruiters
  Given the user navigates to the login screen
  When the user enters a valid email ID "<email>"
  And the user enters a valid password "<password>"
  And the user clicks the 'Login' button
  Then the dashboard should be displayed on the mobile device
  And the system processes the login request without errors

  Examples:
    | email               | password           |
    | krishna@gmail.com   | ValidPassword123   |

@validate_screen_reader_accessibility
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When the screen reader reads the labels for Email ID and Password fields
  And I enter a valid email ID "<email_id>"
  And I enter a valid password "<password>"
  And I click the 'Login' button using the keyboard
  Then the dashboard is displayed

  Examples:
    | email_id           | password            |
    | krishna@gmail.com  | ValidPassword123    |

@validate_screen_reader_accessibility
Scenario Outline: Wait for Login Request Processing
  Given the user is on the Login Screen
  When the screen reader reads the labels for Email ID and Password fields
  And I enter a valid email ID "<email_id>"
  And I enter a valid password "<password>"
  And I click the 'Login' button using the keyboard
  And I wait for the system to process the login request
  Then the dashboard is displayed

  Examples:
    | email_id           | password            |
    | krishna@gmail.com  | ValidPassword123    |

@validate_screen_reader_accessibility
Scenario Outline: Verify Dashboard Display
  Given the user is on the Login Screen
  When the screen reader reads the labels for Email ID and Password fields
  And I enter a valid email ID "<email_id>"
  And I enter a valid password "<password>"
  And I click the 'Login' button using the keyboard
  And I wait for the system to process the login request
  Then the dashboard is displayed

  Examples:
    | email_id           | password            |
    | krishna@gmail.com  | ValidPassword123    |

  @feature_user_login
  @validate_keyboard_navigation
  Scenario Outline: Login Screen for Recruiters
    When the user uses the Tab key to focus on the Email ID field
    And the user enters "<email_id>" in the Email ID field
    And the user uses the Tab key to focus on the Password field
    And the user enters "<password>" in the Password field
    And the user uses the Tab key to focus on the 'Login' button
    And the user presses Enter to click the 'Login' button
    Then the system processes the login request without errors

    Examples:
      | email_id           | password            |
      | krishna@gmail.com  | ValidPassword123    |

@password_reset_link
Scenario Outline: Login Screen for Recruiters
  When the user clicks on the 'Forgot Password?' link
  Then the password reset screen is displayed
  When the user enters "<email>"
  And the user clicks the 'Send Reset Link' button
  And the user waits for the system to process the request
  Then a success message is displayed

  Examples:
    | email              |
    | krishna@gmail.com  |

@valid_login_complex_password
Scenario Outline: Login Screen for Recruiters
  Given the user is on the Login Screen
  When I enter "<email_id>"
  And I enter "<password>"
  And I click the 'Login' button
  Then the dashboard should be displayed

  Examples:
    | email_id            | password          |
    | krishna@gmail.com   | P@ssw0rd123!      |
