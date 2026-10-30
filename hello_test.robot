*** Variables ***
${NOME}     Edu
${CURSO}    Automação de testes
${NUMERO}    10

*** Test Cases ***
Meu primeiro teste com Robot
    Log to console    message=Olá mundo

Ler variáveis
    Log To Console    message=Aluno: ${NOME}
    Log To Console    Curso: ${CURSO}

Criar e alterar variável no teste
    ${nota} =    Set Variable    7.0
    Log To Console    Nota inicial = ${nota}
    ${nota} =    Set Variable    9.5
    Log To Console    Nota final = ${nota}

Manipular número
    ${soma} =    Evaluate    ${NUMERO} + 5
    Log To Console    Soma: ${soma}
