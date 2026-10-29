language: pt-br

*** Configurações ***
Documentação        Ações da página de Cadastro.

Biblioteca          SeleniumLibrary

Recurso             ../page_objects/cadastro_page_objects.resource


*** Palavras-Chave ***
Esperar a página de cadastro carregar
    Wait Until Element Is Visible    ${NOME_TEXT_FIELD}    timeout=10s
    ...    error=A página de cadastro não carregou.

Preencher formulário de cadastro
    [Arguments]    ${nome}    ${email}    ${senha}
    Input Text        ${NOME_TEXT_FIELD}              ${nome}
    Input Text        ${CADASTRO_EMAIL_TEXT_FIELD}    ${email}
    Input Password    ${CADASTRO_SENHA_TEXT_FIELD}    ${senha}

Submeter cadastro
    Click Button    ${CADASTRAR_SUBMIT_BUTTON}

Validar mensagem de cadastro realizado
    Wait Until Page Contains    ${MENSAGEM_SUCESSO_CADASTRO}    timeout=10s
    ...    error=A mensagem de sucesso não foi exibida.
