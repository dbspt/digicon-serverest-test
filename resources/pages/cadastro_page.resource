language: pt-br

*** Configurações ***
Documentação        Ações da página de Cadastro.

Biblioteca          SeleniumLibrary

Recurso             ../page_objects/cadastro_page_objects.resource
Recurso             ../page_objects/home_page_objects.resource


*** Palavras-Chave ***
Esperar a tela inicial carregar
    Wait Until Element Is Visible
    ...    ${CADASTRO_BUTTON}
    ...    timeout= 10s
    ...    error= O sistema demora demais para carregar.


Acessar a página de cadastro
    Click Link      ${CADASTRO_BUTTON}


Preencher campo de nome
    [Arguments]     ${nome}
    Input Text      ${NOME_TEXT_FIELD}       ${nome}


Preencher campo de e-mail do cadastro
    [Arguments]     ${email}
    Input Text      ${EMAIL_TEXT_FIELD}      ${email}


Preencher campo de senha do cadastro
    [Arguments]     ${senha}
    Input Password  ${PASSWORD_TEXT_FIELD}   ${senha}


Marcar o campo administrador
    [Arguments]     ${eh_administrador}
    Run Keyword If  ${eh_administrador}
    ...    Click Element    ${ADMINISTRADOR_CHECK}


Submeter o cadastro
    Click Button    ${CADASTRAR_BUTTON}
