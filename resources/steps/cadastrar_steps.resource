language: pt-br

*** Configurações ***
Documentação        Implementação dos Steps da funcionalidade Cadastro.

Biblioteca          SeleniumLibrary
Recurso             ../pages/cadastro_page.resource


*** Palavras-Chave ***
que acessei o sistema ServeRest
    Esperar a tela inicial carregar


acessei a página de cadastro
    Acessar a página de cadastro


preencho o formulário de cadastro com meus dados
    [Arguments]     ${nome}    ${email}    ${senha}

    Preencher campo de nome              ${nome}
    Preencher campo de e-mail do cadastro    ${email}
    Preencher campo de senha do cadastro     ${senha}


marco o campo administrador se for o caso
    [Arguments]     ${eh_administrador}
    Marcar o campo administrador    ${eh_administrador}


submeto os dados do cadastro
    Submeter o cadastro


devo ver a mensagem de cadastro com sucesso
    [Arguments]     ${mensagem_esperada}=Cadastro realizado com sucesso

    Wait Until Page Contains
    ...    ${mensagem_esperada}
    ...    timeout=5s
    ...    error=A mensagem de sucesso não foi exibida. Revise o cadastro.

    Capture Page Screenshot
