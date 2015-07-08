import cucumber.api.PendingException;
import cucumber.api.java.After;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import java.util.List;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;


public class LoginStepDefs {
    WebDriver browser = new FirefoxDriver();

    @Given("^I open the app url$")
    public void I_open_the_app_url() throws Throwable {
        browser.get("https://powerful-citadel-6254.herokuapp.com/");
    }

    @When("^I submit my credentials$")
    public void I_submit_my_credentials() throws Throwable {
        browser.findElement(By.id("username")).sendKeys("s");
        browser.findElement(By.id("password")).sendKeys("P@ssw0rd");
        browser.findElement(By.id("login-btn")).click();
    }

    @Then("^I should be logged in$")
    public void I_should_be_logged_in() throws Throwable {
        assertThat(browser.getCurrentUrl(), is("https://powerful-citadel-6254.herokuapp.com/"));
        assertThat(browser.findElement(By.id("idLinkRegisterMerchant")).isDisplayed(), is(true));

    }

    @Given("^I open the app url \"([^\"]*)\"$")
    public void I_open_the_app_url(String url) throws Throwable {
        browser.get(url);
    }

    @When("^I submit my credentials:$")
    public void I_submit_my_credentials(List<Credentials> credentialsList) throws Throwable {
        Credentials user = credentialsList.get(0);
        browser.findElement(By.id("username")).sendKeys(user.getUsername());
        browser.findElement(By.id("password")).sendKeys(user.getPassword());
        browser.findElement(By.id("login-btn")).click();
    }

    @When("^I submit \"([^\"]*)\" and \"([^\"]*)\"$")
    public void I_submit_and(String userName, String password) throws Throwable {
        browser.findElement(By.id("username")).sendKeys(userName);
        browser.findElement(By.id("password")).sendKeys(password);
        browser.findElement(By.id("login-btn")).click();
    }

    @Then("^I should get \"([^\"]*)\"$")
    public void I_should_get(String error) throws Throwable {
        assertThat(browser.findElement(By.className("error")).getText(), is(error));
    }

    @After
    public void closeBrowser(){
        browser.quit();
    }
}
