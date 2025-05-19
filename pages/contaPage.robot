*** Settings ***
Documentation    Elementos e keywords da página de conta
Resource         ../resources/common/keywords.robot

*** Variables ***
${ADDRESS_BOOK_LINK}    xpath=//a[contains(text(),'Address Book')]
${SUCCESS_MESSAGE}      xpath=//div[contains(@class,'message-success')]

*** Keywords ***
Go To Address Book
    Wait And Click Element    ${ADDRESS_BOOK_LINK}

Success Message Should Be Visible
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}    timeout=10s
    Element Should Contain    ${SUCCESS_MESSAGE}    ${expected_message}