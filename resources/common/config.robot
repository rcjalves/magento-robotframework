*** Settings ***
Documentation    Configurações comuns para todos os testes
Library          SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}           https://magento.softwaretestingboard.com/
${TIMEOUT}       10
${BASE_EMAIL}    teste+robot
${EMAIL_DOMAIN}    @example.com
${RANDOM_STRING}    Generate Random String    3    [LETTERS]
${TEST_PASSWORD}    Senha@1234

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${TIMEOUT}
    Wait Until Page Contains    Hot Sellers

Go To Home Page
        [Documentation]    Navega para a página inicial
        Go To    ${URL}
        Wait Until Page Contains Element    xpath=//div[contains(@class,'page-wrapper')]    15s

Close Test Browser
    Close All Browsers