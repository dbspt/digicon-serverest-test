language: pt-br

*** Configurações ***
Documentação        Fluxo end-to-end: cadastro, login e adição de produto na lista de compras.

Biblioteca          SeleniumLibrary
Recurso             ../../resources/configs/qa.resource
Recurso             ../../resources/steps/cadastrar_steps.resource
Recurso             ../../resources/steps/carrinho_steps.resource

Inicialização De Teste    Abrir navegador maximizado
Finalização De Teste      Close Browser

Test Tags                 e2e


*** Casos de Teste ***
Cadastrar, logar e adicionar produto na lista de compras
    [Tags]    cadastro    login    carrinho    happy_path

    Dado que acessei a página de cadastro
    E cadastrei um novo usuário com dados aleatórios
    Quando faço login com o usuário cadastrado
    E adiciono um produto na lista de compras
    Então devo ver o produto na lista de compras


*** Palavras-Chave ***
Abrir navegador maximizado
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
