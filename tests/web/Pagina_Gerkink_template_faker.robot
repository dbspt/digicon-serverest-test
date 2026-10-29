language: pt-BR

*** Variáveis ***
${BASE_URL}    https://front.serverest.dev/login
${EMAIL_CORRETO}    fulano@qa.com
${PASSWORD_CORRETO}    teste
${MENSAGEM_SUCESSO}    Home
${MENSAGEM_ERRO}    Email e/ou senha inválidos
${MENSAGEM_ERRO_EMAIL}    Email não pode ficar em branco
${MENSAGEM_ERRO_SENHA}    Password não pode ficar em branco

*** Configurações ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR
Test Setup    Open Browser    ${BASE_URL}    firefox
Test Teardown    Close Browser

*** Casos de Teste ***    EMAIL    SENHA    MENSAGEM
Cenários de login
    [Template]    Login na pagina
    ${EMAIL_CORRETO}    ${PASSWORD_INCORRETO}    ${MENSAGEM_ERRO} 
    ${EMAIL_INCORRETO}  ${PASSWORD_CORRETO}      ${MENSAGEM_ERRO}
    ${EMPTY}            ${PASSWORD_INCORRETO}    ${MENSAGEM_ERRO_EMAIL}
    ${EMAIL_CORRETO}    ${EMPTY}                 ${MENSAGEM_ERRO_SENHA}
    ${EMAIL_CORRETO}    ${PASSWORD_CORRETO}      ${MENSAGEM_SUCESSO}

*** Palavras-Chave ***

Gerar Dados Fake
    ${EMAIL_INCORRETO}=    FakerLibrary.Email
    ${PASSWORD_INCORRETO}=    FakerLibrary.Text    max_nb_chars=20
    Set Suite Variable    ${EMAIL_INCORRETO}
    Set Suite Variable    ${PASSWORD_INCORRETO}

Login na pagina
    [Argumentos]    ${EMAIL}    ${SENHA}    ${MENSAGEM}
    Dado que estou na tela de login
    Quando preencho os dados de login    ${EMAIL}    ${SENHA}
    E clico em entrar
    Então devo ver    ${MENSAGEM}

que estou na tela de login
    No Operation

preencho os dados de login
    [Argumentos]    ${EMAIL}    ${PASSWORD}
    Input Text    email    ${EMAIL}
    Input Password    password    ${PASSWORD}

clico em entrar
    Click Button    Entrar

devo ver
    [Argumentos]    ${MENSAGEM}
    Wait Until Page Contains    ${MENSAGEM}
    Capture Page Screenshot