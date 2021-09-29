*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Verify Leave Page Box is Visible
    Wait Until Element Is Visible  ${LeaveListBox}  timeout=15

Click Leave Tab
    Click Element  ${LeaveTab}
    Click Element  ${LeaveTab}