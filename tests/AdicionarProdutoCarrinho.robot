*** Settings ***
Documentation    Fluxo completo: criar conta, login e comprar produto
Resource         ../resources/common/config.robot
Resource         ../pages/homePage.robot
Resource         ../pages/contaPage.robot
Resource         ../pages/produtoPage.robot
Resource         ../pages/encartePage.robot

Suite Setup      Setup do Teste
Suite Teardown   Finalização do Teste

*** Variables ***
${CATEGORIA}        Men
${SUBCATEGORIA}     Tops
${TIPO_PRODUTO}     Jackets
${SENHA}            Senha@1234

*** Test Cases ***
Fluxo Completo Criar Conta e Comprar Produto
    [Documentation]    Criar conta, fazer login e completar compra
    [Tags]    full_flow    e2e

    ${email}=    Criar Nova Conta
    Fazer Login Com Conta    ${email}
    Comprar Produto

*** Keywords ***
Setup do Teste
    Open Browser To Home Page
    Maximize Browser Window
    Set Selenium Timeout    20s
    Set Selenium Speed      0.5s

Finalização do Teste
    Close Browser

Criar Nova Conta
    ${random}=    Generate Random String    5    [LETTERS][NUMBERS]
    ${email}=    Set Variable    teste${random}@example.com
    Log To Console    \nEmail criado: ${email}

    Go To Create Account Page
    Wait Until Page Contains    Create New Customer Account    20s

    Input Text With Retry    id=firstname              Teste
    Input Text With Retry    id=lastname               Automacao
    Input Text With Retry    id=email_address          ${email}
    Input Text With Retry    id=password               ${SENHA}
    Input Text With Retry    id=password-confirmation  ${SENHA}

    Click Button With Retry    xpath=//button[@title='Create an Account']
    Wait Until Page Contains    Thank you for registering    20s
    Capture Page Screenshot    conta_criada.png

    [Return]    ${email}

Fazer Login Com Conta
    [Arguments]    ${email}
    Fazer Logout Se Logado
    Go To Login Page
    Wait Until Page Contains    Customer Login    15s

    Input Text With Retry    id=email    ${email}
    Input Text With Retry    id=pass     ${SENHA}
    Click Button With Retry    id=send2
    Wait Until Page Contains    Welcome, Teste Automacao    15s
    Capture Page Screenshot    login_sucesso.png

Comprar Produto
    Navegar Para Categoria    ${CATEGORIA}    ${SUBCATEGORIA}    ${TIPO_PRODUTO}
    Selecionar Primeiro Produto
    Selecionar Opcoes Produto
    Adicionar AoCarrinho
    Verificar Produto No Carrinho

# Keywords de apoio
Input Text With Retry
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    3x    2s    Input Text    ${locator}    ${text}

Click Button With Retry
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    3x    2s    Click Button    ${locator}

Fazer Logout Se Logado
    ${status}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//button[@class='action switch']
    Run Keyword If    ${status}    Click Element    xpath=//button[@class='action switch']
    Run Keyword If    ${status}    Wait Until Element Is Visible    xpath=//li[@class='authorization-link']/a    10s
    Run Keyword If    ${status}    Click Element    xpath=//li[@class='authorization-link']/a

Navegar Para Categoria
    [Arguments]    ${categoria}    ${subcategoria}    ${tipo_produto}

    # Hover no menu principal (Men)
    Mouse Over    xpath=//a[contains(@class,'level-top') and normalize-space(.)='${categoria}']
    Sleep         1s

    # Hover na subcategoria (Tops)
    Mouse Over    xpath=//a[contains(@href, '/${categoria.lower()}/${subcategoria.lower()}') and normalize-space(.)='${subcategoria}']
    Sleep         1s

    # Primeiro tenta clicar normalmente
        Run Keyword And Ignore Error    Click Element    xpath=//a[normalize-space(.)='${tipo_produto}']
        Sleep    1s

        # Se não funcionar, tenta clicar como link
        Run Keyword And Ignore Error    Click Link    xpath=//a[normalize-space(.)='${tipo_produto}']
        Sleep    1s

        # Se ainda não funcionar, usa JavaScript
        Execute JavaScript    document.querySelector("a[href*='jackets-men.html']").click()
        Sleep    1s

        Capture Page Screenshot    navegacao_${tipo_produto}.png





Selecionar Primeiro Produto
    Click Element               xpath=(//a[@class='product-item-link'])[1]
    Wait Until Page Contains    Size    20s
    Capture Page Screenshot    produto_selecionado.png

Selecionar Opcoes Produto
    [Arguments]
    Click Element   id=option-label-size-143-item-168
    Click Element   id=option-label-color-93-item-49
    Capture Page Screenshot    opcoes_selecionadas.png

Adicionar AoCarrinho
    Click Element               id=product-addtocart-button
    Wait Until Page Contains    You added    20s
    Capture Page Screenshot    produto_adicionado.png

Verificar Produto No Carrinho
    Click Element               xpath=//a[contains(@class, 'showcart')]
    Wait Until Element Is Visible    xpath=//strong[@class='product-item-name']    20s
    Page Should Contain Element     xpath=//strong[@class='product-item-name']
    Capture Page Screenshot    carrinho_com_produto.png