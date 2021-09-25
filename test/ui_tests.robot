*** Settings ***
Documentation  Page Object in Robot Framework
Library  SeleniumLibrary
Resource  ../Resources/KeywordDefinition/LoginPage.robot
Resource  ../Resources/KeywordDefinition/HomePage.robot
Resource  ../Resources/KeywordDefinition/Common.robot

*** Variables ***

*** Test Cases ***
Verify Successful Login to OrangeHRM
    [documentation]  This test case verifies that the user is able to successfully Login and Logout to OrangeHRM using Page Object
    [Tags]  Smoke
    Open Browser With Parameter
    Input Username
    Input Password
    Click Login
    Verify Welcome Text is Visible
    Logout
    [Teardown]    Close Browser

Search Movie
    [Tags]  webui_demo
    Open Browser With Parameter
    Search Movie  ${MOVIE_NAME}
    [Teardown]    Close Browser

*** Keywords ***