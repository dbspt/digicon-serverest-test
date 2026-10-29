language: pt-br

*** Configurações ***
Documentação        Ações da página Lista de Compras.

Biblioteca          SeleniumLibrary

Recurso             ../page_objects/lista_compras_page_objects.resource


*** Palavras-Chave ***
Esperar a lista de compras carregar
    Wait Until Page Contains    ${LISTA_COMPRAS_TITULO}    timeout=10s
    ...    error=A lista de compras não foi exibida.

Validar produto na lista de compras
    [Arguments]    ${produto}
    Wait Until Element Is Visible    ${LISTA_PRODUTO_NOME}    timeout=10s
    Element Should Contain           ${LISTA_PRODUTO_NOME}    ${produto}
