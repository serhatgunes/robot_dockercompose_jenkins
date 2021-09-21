*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.imdb.com/
${browser}        %{BROWSER}
${DELAY}          0

*** Keywords ***
Open Browser To IMDB
    ${browser_options} =     Evaluate    sys.modules['selenium.webdriver'].${browser}Options()    sys, selenium.webdriver
    ${options} =     Call Method     ${browser_options}    to_capabilities
    Open Browser    ${URL}    browser=${browser}    java -jar selenium-server-standalone.jar -role hub    remote_url=http://localhost:4444/wd/hub    desired_capabilities=${options}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Search Movie
    [Arguments]    ${movie}
    Input Text    id=suggestion-search    ${movie}
    Click Button  id=suggestion-search-button
    Page Should Contain  Results for "${movie}"