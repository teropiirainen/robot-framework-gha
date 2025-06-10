*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Open Chrome Navigator
    [Documentation]    Opens a Chrome browser session with customizable options, including running in headless mode if specified.
    ...                - Configures Chrome browser options such as disabling extensions, preventing the use of /dev/shm (useful in CI environments), and setting a consistent window size.
    ...                - Optionally runs the browser in headless mode based on the provided argument, allowing for UI-less operation in automated environments.
    ...                - Initializes the Chrome WebDriver using WebDriver Manager to ensure the correct version of the WebDriver is used, reducing compatibility issues.
    ...                - Starts the Chrome browser session with the specified options and assigns it an alias for easy reference in subsequent test steps.
    [Arguments]        ${alias}    # The alias name to be assigned to the browser session, useful for referencing the browser later in the test, e.g., "main_browser".
    ...                ${headless}=False    # Boolean flag to determine if the browser should run in headless mode (default is False). Set to True to run the browser without a UI.
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    '${headless}' == 'True'    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-extensions    # Disables Chrome extensions to prevent interference with testing.
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage    # Prevents the use of /dev/shm, which can cause issues in some CI environments like Docker.
    Call Method    ${chrome_options}    add_argument    --no-sandbox    # Disables the sandboxing feature, which can cause issues in certain environments.
    Call Method    ${chrome_options}    add_experimental_option    detach    ${False}
    ${ws}=    Set Variable    window-size=1920,1080    # Sets the browser window size to 1920x1080 to ensure consistency across different test runs.
    Call Method    ${chrome_options}    add_argument    ${ws}
    ${driver}=    Evaluate    sys.modules['webdriver_manager.chrome'].ChromeDriverManager().install()    sys, webdriver_manager.chrome    # Uses WebDriver Manager to automatically download and use the correct version of the Chrome WebDriver.
    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=${driver}    alias=${alias}

