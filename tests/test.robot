*** Settings ***
Documentation   Basic test to verify Robot Framework functionality

Resource    ../resources/keywords/browser.resource

Test Teardown    Test Teardown

*** Test Cases ***
Robot Framework Basic Test
    [Documentation]    Verifies Robot Framework functionality
    [Tags]    basic    sanity
    Log    Hello, Robot Framework!
    ${result}    Set Variable    Hello, Robot Frameworkk!
    Should Be Equal    ${result}    Hello, Robot Framework!

Chrome Basic Test
    [Documentation]    Opens Chrome and verifies basic functionality
    [Tags]    basic    sanity    chrome
    Open Chrome Navigator    google   True
    Go To    https://www.facebook.com/
    Wait Until Element Is Visible    xpath: //img[contains(@alt, 'Facebook')]    10

Chrome Basic Test 2
    [Documentation]    Opens Chrome and verifies basic functionality
    [Tags]    basic    sanity    chrome
    Open Chrome Navigator    google   True
    Go To    https://www.facebook.com/
    Wait Until Element Is Visible    xpath: //img[contains(@alt, 'Faceboook')]    10

*** Keywords ***
Test Teardown
    Close All Browsers
    Capture Screenshot With Log Level

Capture Screenshot With Log Level
    Set Log Level    INFO
    ${screenshot_name} =  Set Variable  output/screenshot-${TEST NAME}.png
    Capture Page Screenshot  ${screenshot_name}
    Log    Screenshot saved as: ${screenshot_name}
    Set Log Level    WARN