language: pt-br

*** Configurações ***
Documentação        Ações das páginas de Produto e Carrinho da Serverest Store.
...                 Fluxo: na página principal clica em "Adicionar na lista"
...                 (data-testid=adicionarNaLista) e, na página seguinte,
...                 clica em "Adicionar ao carrinho"
...                 (data-testid=adicionar carrinho).

Biblioteca          SeleniumLibrary

Recurso             ../page_objects/produto_page_objects.resource


*** Palavras-Chave ***
Esperar o catálogo de produtos carregar
    Wait Until Page Contains
    ...    Serverest Store
    ...    timeout= 10s
    ...    error= O catálogo de produtos demora demais para carregar.


Adicionar produto na lista pela página principal
    Wait Until Element Is Visible
    ...    ${ADICIONAR_NA_LISTA_BUTTON}
    ...    timeout= 10s
    ...    error= O botão "Adicionar na lista" não foi exibido na página principal.
    Click Element    ${ADICIONAR_NA_LISTA_BUTTON}


Esperar a página de carrinho carregar
    Wait Until Element Is Visible
    ...    ${ADICIONAR_CARRINHO_BUTTON}
    ...    timeout= 10s
    ...    error= O redirecionamento para a página do carrinho demora demais.


Adicionar produto ao carrinho
    Click Element    ${ADICIONAR_CARRINHO_BUTTON}


Validar produto no carrinho
    Wait Until Element Is Visible
    ...    ${CARRINHO_H1}
    ...    timeout= 10s
    ...    error= O título <h1> do carrinho não foi exibido.

    Element Text Should Be
    ...    ${CARRINHO_H1}
    ...    ${CARRINHO_CONFIRMACAO}
    ...    message= O texto do <h1> do carrinho não corresponde ao formato esperado.

    Capture Page Screenshot
