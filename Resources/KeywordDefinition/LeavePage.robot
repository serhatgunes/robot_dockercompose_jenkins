*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Verify Leave Page Box is Visible
    Element Should Be Visible  ${LeaveListBox}  timeout=5

Click Leave Tab
    Click Element  ${LeaveTab}