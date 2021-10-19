*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Verify System Users Box is Visible
    Wait Until Element Is Visible  ${SystemUsersBox}  timeout=15

Click Admin Tab
    Wait Until Element Is Visible  ${AdminTab}  timeout=15
    Mouse Over  ${AdminTab}
    Double Click Element  ${AdminTab}