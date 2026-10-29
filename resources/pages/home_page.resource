language: pt-br

*** Configurações ***
Documentação        Ações da página de Login.

Biblioteca          SeleniumLibrary

Recurso             ../page_objects/home_page_objects.resource


*** Palavras-Chave ***
Esperar a tela de cadastro carregar
    Wait Until Page Contains Element
    ...    ${CADASTRO_BUTTON}
    ...    timeout= 10s    
    ...    error= O sistema demora demais para carregar.
