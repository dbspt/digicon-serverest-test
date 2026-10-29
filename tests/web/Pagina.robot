*** Variables ***
${BASE_URL}    https://front.serverest.dev/login
${EMAIL}    fulano@qa.com
${PASSWORD}    teste

*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser    ${BASE_URL}    firefox
Test Teardown    Close Browser

*** Test Cases ***
Login na pagina com sucesso
    Input Text    email    ${EMAIL}
    Input Password    password    ${PASSWORD}
    Click Button    Entrar
    Wait Until Page Contains    Home
    Capture Page Screenshot

Login na pagina com falha
    Input Text    email    ${EMAIL}
    Input Password    password    ${PASSWORD}__
    Click Button    Entrar
    Wait Until Page Contains    Email e/ou senha inválidos
    Capture Page Screenshot