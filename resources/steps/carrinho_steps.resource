language: pt-br

*** Configurações ***
Documentação        Steps do fluxo end-to-end: cadastro, login e lista de compras.

Biblioteca          SeleniumLibrary
Recurso             ../pages/home_page.resource
Recurso             ../pages/login_page.resource
Recurso             ../pages/lista_compras_page.resource


*** Palavras-Chave ***
faço login com o usuário cadastrado
    # O cadastro já loga automaticamente; sai para validar o login de fato
    Esperar a home logada carregar
    Fazer logout
    Esperar a tela de cadastro carregar
    Preencher campo de e-mail    ${USUARIO_EMAIL}
    Preencher campo de senha     ${USUARIO_SENHA}
    Submeter o formulário de cadastro
    Esperar a home logada carregar

adiciono um produto na lista de compras
    ${produto}=    Adicionar o primeiro produto na lista
    Set Test Variable    ${PRODUTO_ADICIONADO}    ${produto}

devo ver o produto na lista de compras
    Esperar a lista de compras carregar
    Validar produto na lista de compras    ${PRODUTO_ADICIONADO}
    Capture Page Screenshot
