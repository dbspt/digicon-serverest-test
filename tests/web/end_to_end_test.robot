language: pt-br

*** Configurações ***
Documentação        Teste end-to-end do fluxo completo da Serverest Store:
...                 cadastro de um novo usuário, login com esse usuário e
...                 adição de um produto ao carrinho (via "Adicionar na lista"
...                 na página principal e "Adicionar ao carrinho" na página
...                 seguinte).

Biblioteca          SeleniumLibrary
Biblioteca          FakerLibrary        locale=pt_BR

Recurso             ../../resources/configs/qa.resource
Recurso             ../../resources/steps/cadastrar_steps.resource
Recurso             ../../resources/steps/login_steps.resource
Recurso             ../../resources/steps/produto_steps.resource

Inicialização De Teste    Open Browser    ${URL}    ${BROWSER}
Finalização De Teste      Close Browser


*** Casos de Teste ***
Fluxo completo - cadastro, login e adicionar produto ao carrinho
    [Documentação]    Cria um novo usuário, autentica com ele e adiciona um
    ...               produto ao carrinho da Serverest Store, passando pela
    ...               página principal ("Adicionar na lista") e pela página de
    ...               carrinho ("Adicionar ao carrinho").
    [Tags]    e2e    cadastro    login    carrinho    happy_path

    # --- Massa de dados gerada pelo Faker e guardada em variáveis do teste ---
    # Estas variáveis (${NOME}, ${EMAIL}, ${SENHA}) são reutilizadas na etapa
    # de login para autenticar com a mesma conta recém-cadastrada.
    ${NOME} =     FakerLibrary.Name
    ${EMAIL} =    FakerLibrary.Email       domain=exemplo.com
    ${SENHA} =    FakerLibrary.Password    length=8

    # --- Cadastro ---
    Dado que acessei o sistema ServeRest
    E acessei a página de cadastro
    Quando preencho o formulário de cadastro com meus dados    ${NOME}    ${EMAIL}    ${SENHA}
    E marco o campo administrador se for o caso                ${False}
    E submeto os dados do cadastro
    Então devo ver a mensagem de cadastro com sucesso

    # --- Transição: garantir que a tela de login seja exibida ---
    # Após o cadastro o ServeRest pode autenticar automaticamente; por isso
    # fazemos logout (se necessário) e navegamos para a tela de login.
    E efetuo logout caso esteja autenticado
    E acesso a tela de login

    # --- Login (reutilizando os dados gerados pelo Faker no cadastro) ---
    Dado que a tela de login do sistema carregou
    Quando preencho corretamente meus dados de login
    ...    email=${EMAIL}
    ...    senha=${SENHA}
    E submeto o formulário para entrar
    Então devo visualizar a Serverest Store
    E devo visualizar as opções restritas

    # --- Adicionar produto à lista e ao carrinho ---
    Dado que estou na página principal da Serverest Store
    Quando adiciono o produto na lista pela página principal
    E sou redirecionado para a página de carrinho
    E adiciono o produto ao carrinho
    Então o produto deve constar no carrinho
