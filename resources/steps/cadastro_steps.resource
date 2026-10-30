*** Settings ***
Documentation    Implementação concreta dos passos Gherkin do Cadastro.
...              Camada Steps: liga cada frase "Dado/Quando/E/Então"
...              às ações definidas na camada de páginas.

Resource         ../pages/cadastro_actions.resource

*** Keywords ***
Dado que acessei o sistema ServeRest
    Acessar a página de cadastro

E acessei a página de cadastro
    No Operation

Quando preencho o formulário com meus dados
    [Arguments]    ${nome}    ${email}    ${senha}
    Preencher dados do usuário    ${nome}    ${email}    ${senha}

E marco o campo "administrador" se for o caso
    [Arguments]    ${eh_administrador}
    Marcar como administrador    ${eh_administrador}

Quando submeto os dados
    Submeter o cadastro

Então devo ver a mensagem de sucesso na tela
    [Arguments]    ${mensagem}
    Verificar mensagem de cadastro    ${mensagem}
