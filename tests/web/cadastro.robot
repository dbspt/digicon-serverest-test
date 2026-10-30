*** Settings ***
Documentation    Cenários de Cadastro de usuários escritos em Gherkin.
...              Camada Cenários: apenas a história do teste; as ações e os
...              elementos ficam nas camadas de resources.

Library          FakerLibrary    locale=pt_BR
Resource         ../../resources/configs/qa.resource
Resource         ../../resources/steps/cadastro_steps.resource

Test Setup       Open Browser    ${URL}    ${BROWSER}
Test Teardown    Close Browser

Test Template    Cadastrar um usuário

*** Test Cases ***             NOME      EMAIL                 SENHA       EH_ADMINISTRADOR    MENSAGEM_ESPERADA
Cadastrar administrador        Celso     FAKER    admin123    ${True}             Cadastro realizado com sucesso
Cadastrar não administrador    Fulane    FAKER    teste123    ${False}            Cadastro realizado com sucesso

*** Keywords ***
Cadastrar um usuário
    [Arguments]    ${NOME}    ${EMAIL}    ${SENHA}    ${EH_ADMINISTRADOR}    ${MENSAGEM_ESPERADA}
    # Quando a coluna EMAIL for "FAKER", gera um email novo (evita "email já usado").
    ${EMAIL}=    Run Keyword If    '${EMAIL}' == 'FAKER'
    ...    FakerLibrary.Email
    ...    ELSE    Set Variable    ${EMAIL}
    Dado que acessei o sistema ServeRest
    E acessei a página de cadastro
    Quando preencho o formulário com meus dados    ${NOME}    ${EMAIL}    ${SENHA}
    E marco o campo "administrador" se for o caso    ${EH_ADMINISTRADOR}
    Quando submeto os dados
    Então devo ver a mensagem de sucesso na tela    ${MENSAGEM_ESPERADA}
