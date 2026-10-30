*** Settings ***
Documentation    Cenários de Login sem sucesso (HU03) escritos em Gherkin.
...              Camada Cenários: apenas a história do teste; as ações e os
...              elementos ficam nas camadas de resources.

Library          OperatingSystem
Library          FakerLibrary    locale=pt_BR
Resource         ../../resources/configs/qa.resource
Resource         ../../resources/steps/login_steps.resource

Suite Setup      Preparar pasta de screenshots
Test Setup       Open Browser    ${URL}login    ${BROWSER}
Test Teardown    Close Browser

Test Template    Tentar login sem sucesso

*** Variables ***
${PASTA_PRINTS}     ${OUTPUT DIR}${/}screenshots

*** Test Cases ***                      EMAIL                SENHA            MENSAGEM_ESPERADA
CN-001 Login com senha incorreta        ${EMAIL}             senha_errada     Email e/ou senha inválidos
CN-002 Login com email não cadastrado   FAKER                ${PASSWORD}      Email e/ou senha inválidos
CN-003 Login sem informar a senha       ${EMAIL}             ${EMPTY}         Password é obrigatório
CN-004 Login sem informar o email       ${EMPTY}             ${PASSWORD}      Email é obrigatório

*** Keywords ***
Preparar pasta de screenshots
    Remove Directory            ${PASTA_PRINTS}    recursive=True
    Create Directory            ${PASTA_PRINTS}
    Set Screenshot Directory    ${PASTA_PRINTS}

Tentar login sem sucesso
    [Arguments]    ${EMAIL}    ${SENHA}    ${MENSAGEM_ESPERADA}
    # Quando a coluna EMAIL for "FAKER", gera um email aleatório com a FakerLibrary.
    ${EMAIL}=    Run Keyword If    '${EMAIL}' == 'FAKER'
    ...    FakerLibrary.Email
    ...    ELSE    Set Variable    ${EMAIL}
    Dado que estou na tela de login
    Quando eu informo o email "${EMAIL}"
    E eu informo a senha "${SENHA}"
    E eu clico no botão entrar
    Então devo ver a mensagem "${MENSAGEM_ESPERADA}"
