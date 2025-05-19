*** Settings ***
Documentation    Elementos e keywords da página inicial
Resource         ../resources/common/keywords.robot

*** Variables ***
${CREATE_ACCOUNT_LINK}    xpath=//div[@class='panel header']//a[contains(text(),'Create an Account')]
${SIGN_IN_LINK}          xpath=//div[@class='panel header']//a[contains(text(),'Sign In')]
${ACCOUNT_MENU}          xpath=//button[@class='action switch']
${SIGN_OUT_LINK}         xpath=//li[@class='authorization-link']/a

*** Keywords ***
Go To Create Account Page
    Wait And Click Element    ${CREATE_ACCOUNT_LINK}

Go To Login Page
    Wait And Click Element    ${SIGN_IN_LINK}

Click Account Menu
    Wait And Click Element    ${ACCOUNT_MENU}

Click Sign Out
    Wait And Click Element    ${SIGN_OUT_LINK}