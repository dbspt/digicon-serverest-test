*** Settings ***
Documentation    Ações executadas na página de Login.
...              Camada Ações: o "como" fazer cada operação na tela,
...              usando os elementos mapeados no page_object.

Library          SeleniumLibrary
Resource         ../configs/qa.resource
Resource         ../page_objects/login_page.resource

*** Keywords ***
Ir para a tela de login
    Go To    ${LOGIN_URL}

Acessar a tela de login
    Wait Until Element Is Visible    ${CAMPO_EMAIL}    timeout=10s

Preencher email
    [Arguments]    ${email}
    Run Keyword If    '${email}' != ''
    ...    Input Text    ${CAMPO_EMAIL}    ${email}

Preencher senha
    [Arguments]    ${senha}
    Run Keyword If    '${senha}' != ''
    ...    Input Password    ${CAMPO_SENHA}    ${senha}

Clicar em entrar
    Click Button    ${BOTAO_ENTRAR}

Verificar mensagem na tela
    [Arguments]    ${mensagem}
    Wait Until Page Contains    ${mensagem}    timeout=10s
    Capture Page Screenshot    ${TEST NAME}.png
