*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PRODUCT_TITLE}        xpath=//span[@class='base']
${SIZE_DROPDOWN}        id=option-label-size-143-item-168
${COLOR_OPTION}         xpath=//div[@option-label='Black']
${ADD_TO_CART_BUTTON}   id=product-addtocart-button

*** Keywords ***
Select Product Options
    [Arguments]    ${size}    ${color}
    Wait Until Element Is Visible    ${SIZE_DROPDOWN}
    Select From List By Label    ${SIZE_DROPDOWN}    ${size}
    Click Element    ${COLOR_OPTION.replace('Black', color)}