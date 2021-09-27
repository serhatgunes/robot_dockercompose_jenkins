*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Verify Employee Information Box is Visible
    Element Should Be Visible  ${EmployeeInformationBox}  timeout=5

Click PIM Tab
    Click Element  ${PimTab}