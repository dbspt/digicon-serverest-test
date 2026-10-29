language: pt-br

*** Configurações ***
Documentação        Implementação dos Steps da funcionalidade Cadastro.

Biblioteca          SeleniumLibrary
Biblioteca          FakerLibrary    locale=pt_BR
Recurso             ../pages/home_page.resource
Recurso             ../pages/cadastro_page.resource


*** Palavras-Chave ***
que acessei a página de cadastro
    Esperar a tela de cadastro carregar
    Acessar a página de cadastro
    Esperar a página de cadastro carregar

cadastrei um novo usuário com dados aleatórios
    ${nome}=     FakerLibrary.Name
    ${email}=    FakerLibrary.Email       domain=dbservices.pt
    ${senha}=    FakerLibrary.Password    length=8
    Set Test Variable    ${USUARIO_EMAIL}    ${email}
    Set Test Variable    ${USUARIO_SENHA}    ${senha}

    Preencher formulário de cadastro    ${nome}    ${email}    ${senha}
    Submeter cadastro
    Validar mensagem de cadastro realizado
