*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Verify Leave Page Box is Visible
    Wait Until Element Is Visible  ${LeaveListBox}  timeout=15

Click Leave Tab
    Wait Until Element Is Visible  ${LeaveTab}  timeout=15
    Mouse Over  ${LeaveTab}
    Double Click Element  ${LeaveTab}
    Double Click Element  ${LeaveTab}