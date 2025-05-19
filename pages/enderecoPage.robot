*** Settings ***
Documentation    Keywords para página de endereços
Resource         ../resources/common/keywords.robot
Library          SeleniumLibrary

*** Variables ***
${ADD_NEW_ADDRESS_BUTTON}    xpath=//button[@class='action add primary']
${ADDRESS_FORM}              id=form-validate
${FIRST_NAME_FIELD}          id=firstname
${LAST_NAME_FIELD}           id=lastname
${COMPANY_FIELD}             id=company
${STREET_ADDRESS_FIELD}      id=street_1
${CITY_FIELD}                id=city
${STATE_DROPDOWN}            id=region_id
${ZIP_CODE_FIELD}            id=zip
${COUNTRY_DROPDOWN}          id=country
${PHONE_FIELD}               id=telephone
${SAVE_ADDRESS_BUTTON}       xpath=//button[@class='action save primary']

*** Keywords ***
Scroll To Element
    [Arguments]    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute JavaScript    arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});    ARGUMENTS    ${element}
    Sleep    0.3

Input Text With Scroll
    [Arguments]    ${locator}    ${text}
    Scroll To Element    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Input Text    ${locator}    ${text}

Select From List With Scroll
    [Arguments]    ${locator}    ${value}
    Scroll To Element    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Select From List By Label    ${locator}    ${value}

Click Add New Address
    Wait Until Element Is Visible    ${ADD_NEW_ADDRESS_BUTTON}    15s
    Scroll To Element    ${ADD_NEW_ADDRESS_BUTTON}
    Click Element    ${ADD_NEW_ADDRESS_BUTTON}
    Wait Until Element Is Visible    ${ADDRESS_FORM}    15s

Fill Address Form
    [Arguments]    ${address_data}
    Input Text With Scroll    ${FIRST_NAME_FIELD}      ${address_data}[firstname]
    Input Text With Scroll    ${LAST_NAME_FIELD}       ${address_data}[lastname]
    Input Text With Scroll    ${COMPANY_FIELD}         ${address_data}[company]
    Input Text With Scroll    ${STREET_ADDRESS_FIELD}  ${address_data}[street]
    Input Text With Scroll    ${CITY_FIELD}            ${address_data}[city]
    Select From List With Scroll    ${STATE_DROPDOWN}    ${address_data}[state]
    Input Text With Scroll    ${ZIP_CODE_FIELD}        ${address_data}[zipcode]
    Select From List With Scroll    ${COUNTRY_DROPDOWN}  ${address_data}[country]
    Input Text With Scroll    ${PHONE_FIELD}           ${address_data}[phone]

Click Save Address Button
    Scroll To Element    ${SAVE_ADDRESS_BUTTON}
    Wait Until Element Is Visible    ${SAVE_ADDRESS_BUTTON}    10s
    Click Element    ${SAVE_ADDRESS_BUTTON}