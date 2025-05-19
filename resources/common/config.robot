*** Settings ***
Documentation    Configurações comuns para todos os testes
Library          SeleniumLibrary
Library          String    # Needed for random string generation

*** Variables ***
${BROWSER}        chrome
${HEADLESS}       ${False}
${URL}            https://magento.softwaretestingboard.com/
${TIMEOUT}        10
${BASE_EMAIL}     teste+robot
${EMAIL_DOMAIN}   @example.com
${TEST_PASSWORD}  Senha@1234

*** Keywords ***
Open Browser To Home Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless=new
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}
    Set Selenium Implicit Wait    ${TIMEOUT}
    Wait Until Page Contains    Hot Sellers

Get Random Email
    [Documentation]    Gera um e-mail aleatório para cadastro
    ${random_part}=    Generate Random String    3    [LETTERS][NUMBERS]
    [Return]    ${BASE_EMAIL}${random_part}${EMAIL_DOMAIN}

Go To Home Page
    [Documentation]    Navega para a página inicial
    Go To    ${URL}
    Wait Until Page Contains Element    xpath=//div[contains(@class,'page-wrapper')]    timeout=15s

Close Test Browser
    [Documentation]    Fecha todos os navegadores abertos
    Close All Browsers