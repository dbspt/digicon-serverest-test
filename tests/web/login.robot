*** Settings ***
Documentation    Cenários de Login (HU03) escritos em Gherkin.
...              Camada Cenários: apenas a história do teste.
...              Antes dos testes, um usuário novo é cadastrado (Faker), então os
...              cenários não dependem de dados que o ServeRest possa ter apagado.

Library          FakerLibrary    locale=pt_BR
Resource         ../../resources/configs/qa.resource
Resource         ../../resources/steps/cadastro_steps.resource
Resource         ../../resources/steps/login_steps.resource

Suite Setup      Cadastrar um usuário para os testes de login
Test Setup       Open Browser    ${URL}login    ${BROWSER}
Test Teardown    Close Browser

*** Test Cases ***
CN-008 Login com credenciais corretas
    [Documentation]    Login realizado com sucesso.
    [Tags]    sucesso
    Dado que estou na tela de login
    Quando eu informo o email "${EMAIL_LOGIN}"
    E eu informo a senha "${SENHA_LOGIN}"
    E eu clico no botão entrar
    Então devo ver a mensagem "Serverest Store"

CN-009 Login recusado com credenciais incorretas
    [Documentation]    Login recusado com "Email e/ou senha inválidos".
    [Tags]    negativo
    Dado que estou na tela de login
    Quando eu informo o email "${EMAIL_LOGIN}"
    E eu informo a senha "senha_invalida"
    E eu clico no botão entrar
    Então devo ver a mensagem "Email e/ou senha inválidos"

CN-010 Login exige email e senha
    [Documentation]    O sistema indica que a senha é obrigatória.
    [Tags]    obrigatorios
    Dado que estou na tela de login
    Quando eu informo o email "${EMAIL_LOGIN}"
    E eu clico no botão entrar
    Então devo ver a mensagem "Password é obrigatório"

*** Keywords ***
Cadastrar um usuário para os testes de login
    [Documentation]    Cria, pela tela de cadastro, um usuário comum com dados do Faker.
    ${EMAIL_LOGIN}=    FakerLibrary.Email
    ${SENHA_LOGIN}=    FakerLibrary.Password    length=8    special_chars=${False}
    Set Suite Variable    ${EMAIL_LOGIN}
    Set Suite Variable    ${SENHA_LOGIN}
    Open Browser    ${URL}    ${BROWSER}
    Dado que acessei o sistema ServeRest
    Quando preencho o formulário com meus dados    Usuário de Teste    ${EMAIL_LOGIN}    ${SENHA_LOGIN}
    E marco o campo "administrador" se for o caso    ${False}
    Quando submeto os dados
    Então devo ver a mensagem de sucesso na tela    Cadastro realizado com sucesso
    [Teardown]    Close Browser
