*** Settings ***
Documentation    Ações executadas na página de Cadastro.
...              Camada Ações: o "como" fazer cada operação na tela,
...              usando os elementos mapeados no page_object.

Library          SeleniumLibrary
Resource         ../configs/qa.resource
Resource         ../page_objects/cadastro_page.resource

*** Keywords ***
Acessar a página de cadastro
    Wait Until Element Is Visible
    ...    ${LINK_CADASTRE_SE}
    ...    timeout=10s
    ...    error=O sistema demora demais para carregar.
    Click Link    ${LINK_CADASTRE_SE}

Preencher dados do usuário
    [Arguments]    ${nome}    ${email}    ${senha}
    Input Text        ${CAMPO_NOME}     ${nome}
    Input Text        ${CAMPO_EMAIL}    ${email}
    Input Password    ${CAMPO_SENHA}    ${senha}

Marcar como administrador
    [Arguments]    ${eh_administrador}
    Run Keyword If    ${eh_administrador}
    ...    Click Element    ${CHECK_ADMINISTRADOR}

Submeter o cadastro
    Click Button    ${BOTAO_CADASTRAR}

Verificar mensagem de cadastro
    [Arguments]    ${mensagem}
    Wait Until Page Contains
    ...    ${mensagem}
    ...    timeout=10s
    ...    error=A mensagem de sucesso não foi exibida. Revise o cadastro.
    # Dentro de um teste usa o nome dele; no Suite Setup (sem teste) usa um nome padrão.
    ${nome_print}=    Get Variable Value    ${TEST NAME}    cadastro_para_os_testes
    Capture Page Screenshot    ${nome_print}.png
