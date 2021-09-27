*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Verify System Users Box is Visible
    Element Should Be Visible  ${SystemUsersBox}  timeout=5

Click Admin Tab
    Click Element  ${AdminTab}