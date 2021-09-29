*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Verify System Users Box is Visible
    Wait Until Element Is Visible  ${SystemUsersBox}  timeout=15

Click Admin Tab
    Click Element  ${AdminTab}
    Click Element  ${AdminTab}