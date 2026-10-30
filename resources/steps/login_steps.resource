*** Settings ***
Documentation    Implementação concreta dos passos Gherkin do Login.
...              Camada Steps: liga cada frase "Dado/Quando/E/Então"
...              às ações definidas na camada de páginas.

Resource         ../pages/login_actions.resource

*** Keywords ***
Dado que estou na tela de login
    Acessar a tela de login

Dado que vou para a tela de login
    Ir para a tela de login
    Acessar a tela de login

Quando eu informo o email "${email}"
    Preencher email    ${email}

Quando eu informo a senha "${senha}"
    Preencher senha    ${senha}

E eu informo a senha "${senha}"
    Preencher senha    ${senha}

E eu clico no botão entrar
    Clicar em entrar

Então devo ver a mensagem "${mensagem}"
    Verificar mensagem na tela    ${mensagem}
