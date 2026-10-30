*** Settings ***
Documentation    Prática integradora (Exercício 10), em 3 testes sequenciais que
...              compartilham o mesmo usuário e o mesmo navegador:
...              1) cadastrar administrador, 2) fazer login, 3) adicionar produto
...              na lista de compras. Rode o arquivo inteiro: cada teste depende do anterior.

Library          OperatingSystem
Library          FakerLibrary    locale=pt_BR
Resource         ../../resources/configs/qa.resource
Resource         ../../resources/steps/cadastro_steps.resource
Resource         ../../resources/steps/login_steps.resource
Resource         ../../resources/steps/produtos_steps.resource

Suite Setup      Preparar a execução
Suite Teardown   Close Browser

*** Test Cases ***
CN-020 Cadastrar usuário como administrador
    [Tags]    e2e    admin    cadastro
    Dado que acessei o sistema ServeRest
    Quando preencho o formulário com meus dados    ${NOME}    ${EMAIL_ADMIN}    ${SENHA_ADMIN}
    E marco o campo "administrador" se for o caso    ${True}
    Quando submeto os dados
    Então devo ver a mensagem de sucesso na tela    Cadastro realizado com sucesso

CN-021 Fazer login com o administrador cadastrado
    [Tags]    e2e    admin    login
    Dado que vou para a tela de login
    Quando eu informo o email "${EMAIL_ADMIN}"
    E eu informo a senha "${SENHA_ADMIN}"
    E eu clico no botão entrar
    Então devo ver a mensagem "Bem Vindo"

CN-022 Adicionar produto na lista de compras
    [Tags]    e2e    admin    lista-de-compras
    Dado que acesso a lista de produtos
    Quando adiciono o primeiro produto à lista de compras
    Então devo ver o produto na minha lista de compras

*** Keywords ***
Preparar a execução
    [Documentation]    Gera o usuário (uma vez), limpa os prints antigos e abre o navegador.
    ${NOME}=           FakerLibrary.Name
    ${EMAIL_ADMIN}=    FakerLibrary.Email
    ${SENHA_ADMIN}=    FakerLibrary.Password    length=8    special_chars=${False}
    Set Suite Variable    ${NOME}
    Set Suite Variable    ${EMAIL_ADMIN}
    Set Suite Variable    ${SENHA_ADMIN}
    ${pasta}=    Normalize Path    ${PASTA_SCREENSHOTS}
    Remove Directory            ${pasta}    recursive=True
    Create Directory            ${pasta}
    Set Screenshot Directory    ${pasta}
    Open Browser    ${URL}    ${BROWSER}
