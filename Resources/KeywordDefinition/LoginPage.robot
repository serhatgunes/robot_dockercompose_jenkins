*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Input Username
    Input Text  ${LoginUsernameInputBox}  ${Username}

Input Password
    Input Text  ${LoginPasswordInputBox}  ${Password}

Click Login
    Click Element  ${LoginButton}

Verify Username and Password Buttons are Visible
    Wait Until Element Is Visible  ${LoginUsernameInputBox}  timeout=15
    Wait Until Element Is Visible  ${LoginPasswordInputBox}  timeout=15