*** Settings ***
Documentation    Keywords compartilhadas para todos os testes
Library          SeleniumLibrary

*** Keywords ***
Wait And Click Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Click Element    ${locator}

Wait And Input Text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Input Text    ${locator}    ${text}

Wait And Select From List
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Select From List By Label    ${locator}    ${value}

Generate Random String
        [Arguments]    ${length}=3    ${chars}=[LETTERS]
        ${random}=    Evaluate    ''.join(random.choice('abcdefghijklmnopqrstuvwxyz') for _ in range(${length}))    modules=random
        [Return]    ${random}