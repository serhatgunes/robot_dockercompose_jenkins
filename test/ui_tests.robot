*** Settings ***
Documentation  UI tests in Robot Framework
Library  SeleniumLibrary
Library  pabot.PabotLib
Resource  ../Resources/KeywordDefinition/LoginPage.robot
Resource  ../Resources/KeywordDefinition/HomePage.robot
Resource  ../Resources/KeywordDefinition/AdminPage.robot
Resource  ../Resources/KeywordDefinition/PimPage.robot
Resource  ../Resources/KeywordDefinition/LeavePage.robot
Resource  ../Resources/KeywordDefinition/Common.robot

*** Variables ***

*** Test Cases ***
Verify Successful Login and Logout to System
    [documentation]  This test case verifies that the user is able to successfully Login and Logout to OrangeHRM
    [Tags]  ${tags}
    Open Browser With Parameter
    Input Username
    Input Password
    Click Login
    Verify Welcome Text is Visible
    [Teardown]    Close Browser

Verify Successful Navigation to Admin Page
    [documentation]  This test case verifies that the user is able to successfully Login and reach to Admin page
    [Tags]  ${tags}
    Open Browser With Parameter
    Input Username
    Input Password
    Click Login
    Verify Welcome Text is Visible
    Click Admin Tab
    Verify System Users Box is Visible
    [Teardown]    Close Browser

Verify Successful Navigation to PIM Page
    [documentation]  This test case verifies that the user is able to successfully Login and reach to PIM page
    [Tags]  ${tags}
    Open Browser With Parameter
    Input Username
    Input Password
    Click Login
    Verify Welcome Text is Visible
    Click PIM Tab
    Verify Employee Information Box is Visible
    [Teardown]    Close Browser

Verify Successful Navigation to Leave Page
    [documentation]  This test case verifies that the user is able to successfully Login and reach to Leave page
    [Tags]  ${tags}
    Open Browser With Parameter
    Input Username
    Input Password
    Click Login
    Verify Welcome Text is Visible
    Click Leave Tab
    Verify Leave Page Box is Visible
    [Teardown]    Close Browser

Verify Login Page is Opened Successfully
    [documentation]  This test case verifies that login page is open successfully
    [Tags]  ${tags}
    Open Browser With Parameter
    Verify Username and Password Buttons are Visible
    [Teardown]    Close Browser

*** Keywords ***