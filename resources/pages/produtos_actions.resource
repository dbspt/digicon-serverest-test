*** Settings ***
Documentation    Ações executadas nas páginas de Produtos e Lista de Compras.
...              Camada Ações: o "como" fazer cada operação na tela,
...              usando os elementos mapeados no page_object.

Library          SeleniumLibrary
Resource         ../configs/qa.resource
Resource         ../page_objects/produtos_page.resource

*** Keywords ***
Ir para a lista de produtos
    Go To    ${HOME_URL}

Aguardar a lista de produtos
    Wait Until Element Is Visible
    ...    ${BOTAO_ADICIONAR_LISTA}
    ...    timeout=10s
    ...    error=A lista de produtos não foi exibida após o login.

Adicionar o primeiro produto à lista
    Aguardar a lista de produtos
    Click Element    ${BOTAO_ADICIONAR_LISTA}

Verificar produto na lista de compras
    [Documentation]    O nome do produto muda entre execuções, então confere
    ...                que a lista foi aberta e tem 1 unidade de um produto.
    Wait Until Location Contains
    ...    ${URL_LISTA_COMPRAS}
    ...    timeout=10s
    ...    message=A página da lista de compras não foi aberta.
    Wait Until Element Is Visible
    ...    ${NOME_PRODUTO_LISTA}
    ...    timeout=10s
    ...    error=O produto não apareceu na lista de compras.
    Element Text Should Be    ${QTD_PRODUTO_LISTA}    Total: 1
    Capture Page Screenshot    ${TEST NAME}_lista.png
