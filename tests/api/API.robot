*** Variables ***
${BASE_URL}    https://serverest.dev
${LOGIN_EP}    /login

${EMAIL}    fulano@qa.com
${PASSWORD}    teste

*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
#Meu primeiro teste
#    Log To Console    Hello World

Login na api com suscesso
    Log To Console    Fazendo login...
    Create Session    servtest    ${BASE_URL}
    ${body}=    Create Dictionary
    ...    email=${EMAIL}
    ...    password=${PASSWORD}

    ${response}=    POST On Session    servtest    ${LOGIN_EP}    json=${body}
    Should Be Equal As Strings    ${response.status_code}    200

Login na api com falha
    Log To Console    Fazendo login...
    Create Session    servtest    ${BASE_URL}
    ${body}=    Create Dictionary
    ...    email=${EMAIL}__
    ...    password=${PASSWORD}__

    ${response}=    POST On Session    servtest    ${LOGIN_EP}    json=${body}    expected_status=400
    Should Be Equal As Strings    ${response.status_code}    400