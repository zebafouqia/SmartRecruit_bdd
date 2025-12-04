package com.default_project.stepdefinitions;

import com.default_project.utils.ElementUtils;
import org.junit.Assert;
import com.default_project.driverfactory.DriverFactory;
import com.default_project.pages.LoginScreenforRecruitersPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
public class LoginScreenforRecruiters extends DriverFactory {
LoginScreenforRecruitersPage loginScreenforRecruitersPage = new LoginScreenforRecruitersPage(driver);
@Given("the user is on the Login Screen")
public void the_user_is_on_the_login_screen() {
driver = DriverFactory.getDriver();
loginScreenforRecruitersPage.navigateToLoginScreen();
}
@When("I enter {string}")
public void i_enter_email(String email) {
loginScreenforRecruitersPage.enterEmail(email);
}
@When("I enter {string}")
public void i_enter_password(String password) {
loginScreenforRecruitersPage.enterPassword(password);
}
@When("I click the 'Login' button")
public void i_click_the_login_button() {
loginScreenforRecruitersPage.clickLoginButton();
}
@When("I wait for the system to process the login request")
public void i_wait_for_the_system_to_process_the_login_request() {
loginScreenforRecruitersPage.waitForLoginProcessing();
}
@Then("the dashboard should be displayed")
public void the_dashboard_should_be_displayed() {
loginScreenforRecruitersPage.isDashboardDisplayed();
}
@Then("the Login button should be enabled")
public void the_login_button_should_be_enabled() {
loginScreenforRecruitersPage.isLoginButtonEnabled();
}
@When("I click the 'Show Password' option")
public void i_click_the_show_password_option() {
loginScreenforRecruitersPage.clickShowPassword();
}
@Then("the password should be visible")
public void the_password_should_be_visible() {
loginScreenforRecruitersPage.isPasswordVisible();
}
@When("I click the 'Hide Password' option")
public void i_click_the_hide_password_option() {
loginScreenforRecruitersPage.clickHidePassword();
}
@Then("the password should be hidden")
public void the_password_should_be_hidden() {
loginScreenforRecruitersPage.isPasswordVisible();
}
@Then("an error message {string} should be displayed")
public void an_error_message_should_be_displayed(String errorMessage) {
Assert.assertEquals(errorMessage, loginScreenforRecruitersPage.getErrorMessage());
}
@When("I check the 'Remember Me' option")
public void i_check_the_remember_me_option() {
loginScreenforRecruitersPage.checkRememberMe();
}
@Then("the system processes the login request without errors")
public void the_system_processes_the_login_request_without_errors() {
loginScreenforRecruitersPage.isLoginProcessedSuccessfully();
}
@Then("the user logs out successfully")
public void the_user_logs_out_successfully() {
loginScreenforRecruitersPage.logout();
loginScreenforRecruitersPage.isLoggedOut();
}
@Then("the email ID is pre-filled in the Email ID field")
public void the_email_id_is_pre_filled_in_the_email_id_field() {
Assert.assertEquals("krishna@gmail.com", loginScreenforRecruitersPage.getEmailFieldValue());
}
@Then("the email ID field is empty")
public void the_email_id_field_is_empty() {
loginScreenforRecruitersPage.isEmailFieldEmpty();
}
@When("the user leaves the Email ID field empty")
public void the_user_leaves_the_email_id_field_empty() {
loginScreenforRecruitersPage.leaveEmailFieldEmpty();
}
@When("the user leaves the Password field empty")
public void the_user_leaves_the_password_field_empty() {
loginScreenforRecruitersPage.leavePasswordFieldEmpty();
}
@When("the user enters a valid email ID with maximum length {string}")
public void the_user_enters_a_valid_email_id_with_maximum_length(String email) {
loginScreenforRecruitersPage.enterEmail(email);
}
@When("the user enters a valid password with maximum length {string}")
public void the_user_enters_a_valid_password_with_maximum_length(String password) {
loginScreenforRecruitersPage.enterPassword(password);
}
@When("the user simulates a slow network connection")
public void the_user_simulates_a_slow_network_connection() {
loginScreenforRecruitersPage.simulateSlowNetwork();
}
@When("the user attempts to access the dashboard")
public void the_user_attempts_to_access_the_dashboard() {
loginScreenforRecruitersPage.accessDashboard();
}
@Then("the user should be redirected to the login screen")
public void the_user_should_be_redirected_to_the_login_screen() {
loginScreenforRecruitersPage.isOnLoginScreen();
}
@When("the user enters an XSS attempt in the Password field {string}")
public void the_user_enters_an_xss_attempt_in_the_password_field(String password) {
loginScreenforRecruitersPage.enterPassword(password);
}
@When("the user enters an SQL injection attempt in the Email ID field {string}")
public void the_user_enters_an_sql_injection_attempt_in_the_email_id_field(String email) {
loginScreenforRecruitersPage.enterEmail(email);
}
@When("the user enters an invalid reset link")
public void the_user_enters_an_invalid_reset_link() {
loginScreenforRecruitersPage.enterInvalidResetLink();
}
@When("the user attempts to use the reset link after the expiration period")
public void the_user_attempts_to_use_the_reset_link_after_the_expiration_period() {
loginScreenforRecruitersPage.useExpiredResetLink();
}
@When("the user attempts to use the same reset link again")
public void the_user_attempts_to_use_the_same_reset_link_again() {
loginScreenforRecruitersPage.useSameResetLinkAgain();
}
@Then("the user should see an account locked message")
public void the_user_should_see_an_account_locked_message() {
loginScreenforRecruitersPage.isAccountLockedMessageDisplayed();
}
@Then("the user is prompted to change their password")
public void the_user_is_prompted_to_change_their_password() {
loginScreenforRecruitersPage.isPasswordChangePromptDisplayed();
}
@When("the user enters a valid email ID {string} in the reset field")
public void the_user_enters_a_valid_email_id_in_the_reset_field(String email) {
loginScreenforRecruitersPage.enterEmail(email);
}
@When("the user clicks the 'Send Reset Link' button")
public void the_user_clicks_the_send_reset_link_button() {
loginScreenforRecruitersPage.clickSendResetLink();
}
@Then("a success message should be displayed")
public void a_success_message_should_be_displayed() {
loginScreenforRecruitersPage.isSuccessMessageDisplayed();
}
@When("the user answers the security questions correctly")
public void the_user_answers_the_security_questions_correctly() {
loginScreenforRecruitersPage.answerSecurityQuestions();
}
@When("the user sets a new password")
public void the_user_sets_a_new_password() {
loginScreenforRecruitersPage.setNewPassword();
}
@Then("the user verifies that the confirmation message is received")
public void the_user_verifies_that_the_confirmation_message_is_received() {
loginScreenforRecruitersPage.isConfirmationMessageReceived();
}
@Then("an error message indicates the link has expired")
public void an_error_message_indicates_the_link_has_expired() {
loginScreenforRecruitersPage.isExpiredLinkErrorMessageDisplayed();
}
@Then("an error message indicates the link is invalid")
public void an_error_message_indicates_the_link_is_invalid() {
loginScreenforRecruitersPage.isInvalidLinkErrorMessageDisplayed();
}
@Then("an error message indicates the link has already been used")
public void an_error_message_indicates_the_link_has_already_been_used() {
loginScreenforRecruitersPage.isLinkUsedErrorMessageDisplayed();
}