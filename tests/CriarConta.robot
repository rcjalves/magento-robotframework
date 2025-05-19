*** Settings ***
Documentation    Teste completo: cadastro de conta + endereço
Resource         ../resources/common/config.robot
Resource         ../pages/homePage.robot
Resource         ../pages/contaPage.robot
Resource         ../pages/enderecoPage.robot

Suite Setup      Setup Test
Suite Teardown   Teardown Test

*** Variables ***
&{ADDRESS_DATA}
    ...    firstname=Test
    ...    lastname=User
    ...    company=Robot Company
    ...    street=123 Robot Street
    ...    city=Robot City
    ...    state=California
    ...    zipcode=90210
    ...    country=United States
    ...    phone=5551234567

*** Keywords ***
Setup Test
    Open Browser To Home Page
    Maximize Browser Window
    Set Selenium Timeout    20s
    Set Selenium Speed      0.3s
    Generate Test Email

Generate Test Email
    ${random_part}=    Evaluate    ''.join(random.choice('abcdefghijklmnopqrstuvwxyz') for _ in range(5))    modules=random
    ${UNIQUE_EMAIL}=    Set Variable    ${BASE_EMAIL}${random_part}${EMAIL_DOMAIN}
    Set Suite Variable    ${UNIQUE_EMAIL}
    Log    Email gerado: ${UNIQUE_EMAIL}    console=True

Teardown Test
    Run Keywords    Capture Page Screenshot
    ...    AND    Click Account Menu
    ...    AND    Click Sign Out
    ...    AND    Close Browser

*** Test Cases ***
Complete Registration With Address
    [Documentation]    Teste completo de cadastro com endereço
    [Tags]    full_regression    address

    Register New Account
    Add New Shipping Address
    Validate Successful Registration

*** Keywords ***
Register New Account
    Go To Create Account Page
    Wait Until Page Contains    Create New Customer Account    20s

    Input Text With Scroll    id=firstname    ${ADDRESS_DATA}[firstname]
    Input Text With Scroll    id=lastname     ${ADDRESS_DATA}[lastname]
    Input Text With Scroll    id=email_address    ${UNIQUE_EMAIL}
    Input Text With Scroll    id=password    ${TEST_PASSWORD}
    Input Text With Scroll    id=password-confirmation    ${TEST_PASSWORD}

    Click Button With Scroll    xpath=//button[@title='Create an Account']
    Wait Until Page Contains    Thank you for registering    20s

Add New Shipping Address
    Go To Address Book
    Wait Until Page Contains    Address Book    20s
    Fill Address Form    ${ADDRESS_DATA}
    Click Save Address Button

Validate Successful Registration
    Wait Until Page Contains    You saved the address    20s
    Page Should Contain    ${ADDRESS_DATA}[street]
    Page Should Contain    ${ADDRESS_DATA}[city]
    Capture Page Screenshot    final_confirmation.png

*** Keywords ***
Input Text With Scroll
    [Arguments]    ${locator}    ${text}
    Scroll Element Into View    ${locator}
    Input Text    ${locator}    ${text}

Click Button With Scroll
    [Arguments]    ${locator}
    Scroll Element Into View    ${locator}
    Click Button    ${locator}