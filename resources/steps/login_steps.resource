language: pt-br

*** Configurações ***
Documentação        Implementação dos Steps da funcionalidade Login.

Biblioteca          SeleniumLibrary
Recurso             ../configs/qa.resource
Recurso             ../pages/home_page.resource
Recurso             ../pages/login_page.resource


*** Palavras-Chave ***
efetuo logout caso esteja autenticado
    ${esta_logado} =    Run Keyword And Return Status
    ...    Element Should Be Visible    xpath: //button[text() = 'Logout']
    Run Keyword If      ${esta_logado}
    ...    Click Button    xpath: //button[text() = 'Logout']


acesso a tela de login
    Go To                              ${URL}login
    Wait Until Element Is Visible
    ...    ${EMAIL_TEXT_FIELD}
    ...    timeout= 10s
    ...    error= A tela de login demora demais para carregar.


que a tela de login do sistema carregou
    Esperar a tela de cadastro carregar


preencho corretamente meus dados de login
    [Arguments]     ${email}       ${senha}

    Preencher campo de e-mail      ${email}
    Preencher campo de senha       ${senha}


submeto o formulário para entrar
    Submeter o formulário de cadastro


devo visualizar a Serverest Store
    Wait Until Page Contains           Serverest Store  timeout=5s


devo visualizar as opções restritas
    Wait Until Page Contains Element   xpath: //button[text() = 'Logout']
    

não devo mais visualizar a tela de login
    Page Should Not Contain            Login
    Capture Page Screenshot
