*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Verify Employee Information Box is Visible
    Wait Until Element Is Visible  ${EmployeeInformationBox}  timeout=15

Click PIM Tab
    Click Element  ${PimTab}
    Click Element  ${PimTab}