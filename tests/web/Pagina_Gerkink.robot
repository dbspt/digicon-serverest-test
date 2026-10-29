language: pt-BR

*** Variáveis ***
${BASE_URL}    https://front.serverest.dev/login
${EMAIL}    fulano@qa.com
${PASSWORD}    teste

*** Configurações ***
Library    SeleniumLibrary
Test Setup    Open Browser    ${BASE_URL}    firefox
Test Teardown    Close Browser

*** Casos de Teste ***

Login na pagina com sucesso
    Dado que estou na tela de login
    Quando preencho corretamente os dados de login
    E clico em entrar
    Então devo conseguir logar corretamente
    

Login na pagina com falha
    Dado que estou na tela de login
    Quando preencho incorretamente os dados de login
    E clico em entrar
    Então a pagina deve mostrar erro de credenciais invalidas

*** Palavras-Chave ***

que estou na tela de login
    No Operation

preencho corretamente os dados de login
    Input Text    email    ${EMAIL}
    Input Password    password    ${PASSWORD}

preencho incorretamente os dados de login
    Input Text    email    ${EMAIL}
    Input Password    password    ${PASSWORD}__

clico em entrar
    Click Button    Entrar

devo conseguir logar corretamente
    Wait Until Page Contains    Home
    Capture Page Screenshot

a pagina deve mostrar erro de credenciais invalidas
    Wait Until Page Contains    Email e/ou senha inválidos
    Capture Page Screenshot