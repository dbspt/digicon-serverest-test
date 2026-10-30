*** Settings ***
Documentation    Mapeamento dos elementos (locators) da página de Cadastro.
...              Camada Objetos: só o "onde" está cada elemento na tela.

*** Variables ***
${LINK_CADASTRE_SE}        link:Cadastre-se

${CAMPO_NOME}             id:nome
${CAMPO_EMAIL}            id:email
${CAMPO_SENHA}           id:password
${CHECK_ADMINISTRADOR}    id:administrador
${BOTAO_CADASTRAR}        tag:button

# Mensagens exibidas pela aplicação.
${MSG_SUCESSO}            Cadastro realizado com sucesso
