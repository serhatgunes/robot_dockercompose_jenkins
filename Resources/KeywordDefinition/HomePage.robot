*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Verify Welcome Text is Visible
    Wait Until Element Is Visible  ${WelcomeText}  timeout=15

Logout
    Wait Until Element Is Visible  ${WelcomeText}  timeout=15
    CLick Element  ${WelcomeText}
    Wait Until Element Is Visible  ${LogoutButton}  timeout=15
    Click Element  ${LogoutButton}
    Wait Until Element Is Visible  ${LoginUsernameInputBox}  timeout=15