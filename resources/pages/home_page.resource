language: pt-br

*** Configurações ***
Documentação        Ações da página Home.

Biblioteca          SeleniumLibrary

Recurso             ../page_objects/home_page_objects.resource


*** Palavras-Chave ***
Esperar a tela de cadastro carregar
    Wait Until Page Contains Element
    ...    ${CADASTRESE_BUTTON}
    ...    timeout= 10s    
    ...    error= O sistema demora demais para carregar.

Acessar a página de cadastro
    Click Link    ${CADASTRESE_BUTTON}

Esperar a home logada carregar
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    timeout=10s
    ...    error=A home do usuário logado não carregou.

Fazer logout
    Click Button    ${LOGOUT_BUTTON}

Adicionar o primeiro produto na lista
    Wait Until Element Is Visible    ${PRIMEIRO_PRODUTO_ADICIONAR}    timeout=10s
    ${produto}=    Get Text          ${PRIMEIRO_PRODUTO_NOME}
    Click Button   ${PRIMEIRO_PRODUTO_ADICIONAR}
    RETURN         ${produto}
