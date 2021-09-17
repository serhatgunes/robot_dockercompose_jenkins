*** Settings ***
Documentation     A test suite with a single test for searching a movie on IMDB website
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Variables ***
${MOVIE_NAME}    matrix

*** Test Cases ***
Search Movie
    [Tags]  webui_demo
    Open Browser To IMDB
    Search Movie  ${MOVIE_NAME}
    [Teardown]    Close Browser