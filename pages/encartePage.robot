*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CART_ICON}          xpath=//a[contains(@class, 'showcart')]
${CART_ITEM_NAME}     xpath=//strong[@class='product-item-name']
${CART_ITEM_QTY}      xpath=//input[@title='Qty']

*** Keywords ***
Verify Product In Cart
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    ${CART_ITEM_NAME}
    Element Should Contain    ${CART_ITEM_NAME}    ${product_name}