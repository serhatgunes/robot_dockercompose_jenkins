*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/
${browser}        %{BROWSER}
${DELAY}          0

*** Keywords ***
Open Browser With Parameter
    ${browser_options} =     Evaluate    sys.modules['selenium.webdriver'].${browser}Options()    sys, selenium.webdriver
    ${options} =     Call Method     ${browser_options}    to_capabilities
    Open Browser    ${URL}    browser=${browser}    remote_url=http://selenium-hub:4444/wd/hub    desired_capabilities=${options}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Wait Until Element Is Visible  ${LoginUsernameInputBox}  timeout=5
