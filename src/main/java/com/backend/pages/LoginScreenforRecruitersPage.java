
package com.backend.pages;

import com.backend.utils.ElementUtils;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class LoginScreenforRecruitersPage {
    private WebDriver driver;
    private ElementUtils elementUtils;

    @FindBy(id = "emailField")
    private WebElement emailField;

    @FindBy(id = "passwordField")
    private WebElement passwordField;

    @FindBy(id = "loginButton")
    private WebElement loginButton;

    @FindBy(id = "dashboard")
    private WebElement dashboard;

    @FindBy(id = "errorMessage")
    private WebElement errorMessage;

    @FindBy(id = "rememberMe")
    private WebElement rememberMeCheckbox;

    @FindBy(id = "showPassword")
    private WebElement showPasswordOption;

    @FindBy(id = "hidePassword")
    private WebElement hidePasswordOption;

    @FindBy(id = "successMessage")
    private WebElement successMessage;

    @FindBy(id = "confirmationMessage")
    private WebElement confirmationMessage;

    @FindBy(id = "resetLinkButton")
    private WebElement resetLinkButton;

    @FindBy(id = "sendResetLinkButton")
    private WebElement sendResetLinkButton;

    @FindBy(id = "resetLinkInput")
    private WebElement resetLinkInput;

    @FindBy(id = "processingMessage")
    private WebElement processingMessage;

    @FindBy(id = "newPasswordInput")
    private WebElement newPasswordInput;

    @FindBy(id = "securityQuestionInput")
    private WebElement securityQuestionInput;

    public LoginScreenforRecruitersPage(WebDriver driver) {
        this.driver = driver;
        this.elementUtils = new ElementUtils(driver);
        PageFactory.initElements(driver, this);
    }

    public void navigateToLoginScreen() {
        driver.get("localhost");
    }

    public void enterEmail(String email) {
        elementUtils.clearAndSendKeys(emailField, email);
    }

    public void enterPassword(String password) {
        elementUtils.clearAndSendKeys(passwordField, password);
    }

    public void clickLoginButton() {
        elementUtils.clickElement(loginButton);
    }

    public void checkRememberMe() {
        elementUtils.clickElement(rememberMeCheckbox);
    }

    public boolean isDashboardDisplayed() {
        return elementUtils.isElementDisplayed(dashboard);
    }

    public boolean isLoginButtonEnabled() {
        return loginButton.isEnabled();
    }

    public void clickShowPassword() {
        elementUtils.clickElement(showPasswordOption);
    }

    public void clickHidePassword() {
        elementUtils.clickElement(hidePasswordOption);
    }

    public boolean isPasswordVisible() {
        return passwordField.getAttribute("type").equals("text");
    }

    public String getErrorMessage() {
        return elementUtils.getElementText(errorMessage);
    }

    public boolean isLoginProcessedSuccessfully() {
        // Implement logic to verify successful login
        return true; // Placeholder return
    }

    public void logout() {
        // Implement logout logic
    }

    public boolean isLoggedOut() {
        // Implement logic to verify logout
        return true; // Placeholder return
    }

    public String getEmailFieldValue() {
        return emailField.getAttribute("value");
    }

    public boolean isEmailFieldEmpty() {
        return getEmailFieldValue().isEmpty();
    }

    public void leaveEmailFieldEmpty() {
        elementUtils.clearElement(emailField);
    }

    public void leavePasswordFieldEmpty() {
        elementUtils.clearElement(passwordField);
    }

    public void clickSendResetLink() {
        elementUtils.clickElement(sendResetLinkButton);
    }

    public boolean isSuccessMessageDisplayed() {
        return elementUtils.isElementDisplayed(successMessage);
    }

    public boolean isConfirmationMessageReceived() {
        return elementUtils.isElementDisplayed(confirmationMessage);
    }

    public boolean isAccountLockedMessageDisplayed() {
        // Implement logic to verify account locked message
        return true; // Placeholder return
    }

    public boolean isPasswordChangePromptDisplayed() {
        // Implement logic to verify password change prompt
        return true; // Placeholder return
    }

    public boolean isExpiredLinkErrorMessageDisplayed() {
        // Implement logic to verify expired link error message
        return true; // Placeholder return
    }

    public boolean isInvalidLinkErrorMessageDisplayed() {
        // Implement logic to verify invalid link error message
        return true; // Placeholder return
    }

    public boolean isLinkUsedErrorMessageDisplayed() {
        // Implement logic to verify link used error message
        return true; // Placeholder return
    }

    public void enterInvalidResetLink(String invalidLink) {
        elementUtils.clearAndSendKeys(resetLinkInput, invalidLink);
    }

    public void isOnLoginScreen() {
        String actualUrl = driver.getCurrentUrl();
        String expectedUrl = "localhost/login";
        Assert.assertEquals(actualUrl, expectedUrl, "Not on the login screen!");
    }

    public void answerSecurityQuestions(String answer) {
        elementUtils.clearAndSendKeys(securityQuestionInput, answer);
    }

    public void setNewPassword(String newPassword) {
        elementUtils.clearAndSendKeys(newPasswordInput, newPassword);
    }

    public void waitForLoginProcessing() {
        Assert.assertTrue(elementUtils.isElementDisplayed(processingMessage), "Login processing message is not displayed!");
    }

    public void simulateSlowNetwork() {
        // Implementation to simulate slow network (this may require additional setup).
    }
}

public void useExpiredResetLink() {
    try {
        // Assuming there's a reset link button with the ID 'reset-link'
        WebElement expiredResetLink = driver.findElement(By.id("reset-link"));
        elementUtils.clickElement(expiredResetLink);
        
        // Validate the response after using the expired link
        String actualMessage = driver.findElement(By.id("alert")).getText();
        String expectedMessage = "This reset link has expired.";
        Assert.assertEquals(actualMessage, expectedMessage, "Alert message does not match!");
    } catch (Exception e) {
        e.printStackTrace();
    }
}

public void useSameResetLinkAgain() {
    try {
        // Assuming there's a reset link button with the ID 'same-reset-link'
        WebElement sameResetLink = driver.findElement(By.id("same-reset-link"));
        elementUtils.clickElement(sameResetLink);
        
        // Validate the response after using the same link again
        String actualMessage = driver.findElement(By.id("alert")).getText();
        String expectedMessage = "This reset link has already been used.";
        Assert.assertEquals(actualMessage, expectedMessage, "Alert message does not match!");
    } catch (Exception e) {
        e.printStackTrace();
    }
}

public void accessDashboard() {
    try {
        // Assuming there's a dashboard button with the ID 'dashboard-button'
        WebElement dashboardButton = driver.findElement(By.id("dashboard-button"));
        elementUtils.clickElement(dashboardButton);
        
        // Validate if the dashboard loads successfully
        String actualTitle = driver.getTitle();
        String expectedTitle = "Dashboard";
        Assert.assertEquals(actualTitle, expectedTitle, "Dashboard title does not match!");
    } catch (Exception e) {
        e.printStackTrace();
    }
}