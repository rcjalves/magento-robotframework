*** Settings ***
Documentation    Configurações comuns para todos os testes
Library          SeleniumLibrary
Library          String    # Para geração de strings aleatórias

*** Variables ***
${BROWSER}        chrome
${HEADLESS}       ${True}
${URL}            https://magento.softwaretestingboard.com/
${TIMEOUT}        10
${BASE_EMAIL}     teste+robot
${EMAIL_DOMAIN}   @example.com
${TEST_PASSWORD}  Senha@1234

*** Keywords ***
Open Browser To Home Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    ${HEADLESS}    Run Keywords
    ...    Call Method    ${chrome_options}    add_argument    --headless=new    AND
    ...    Call Method    ${chrome_options}    add_argument    --no-sandbox    AND
    ...    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage    AND
    ...    Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080

    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}
    Set Selenium Implicit Wait    ${TIMEOUT}
    Wait Until Page Contains    Hot Sellers

Get Random Email
    ${random_part}=    Generate Random String    5    [LETTERS][NUMBERS]
    RETURN    ${BASE_EMAIL}${random_part}${EMAIL_DOMAIN}

Go To Home Page
    Go To    ${URL}
    Wait Until Page Contains Element    xpath=//div[contains(@class,'page-wrapper')]    timeout=15s

Close Test Browser
    Close All Browsers