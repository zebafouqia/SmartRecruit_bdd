package com.backend.pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import com.default_project.utils.ElementUtils;
import org.testng.Assert;

public class DriverFactoryPage {

    private WebDriver driver;
    private ElementUtils elementUtils;

    @FindBy(id = "vehicleLookupButton")
    private WebElement vehicleLookupButton;

    @FindBy(id = "dropdownElement")
    private WebElement dropdownElement;

    @FindBy(id = "alertAcceptButton")
    private WebElement alertAcceptButton;

    @FindBy(id = "alertDismissButton")
    private WebElement alertDismissButton;

    @FindBy(id = "pageTitle")
    private WebElement pageTitle;

    public DriverFactoryPage(WebDriver driver) {
        this.driver = driver;
        this.elementUtils = new ElementUtils(driver);
        PageFactory.initElements(driver, this);
    }



    }

    }


}