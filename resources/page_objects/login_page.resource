*** Settings ***
Documentation    Mapeamento dos elementos (locators) da página de Login.
...              Camada Objetos: só o "onde" está cada elemento na tela.

*** Variables ***
${LOGIN_URL}             ${URL}login

${CAMPO_EMAIL}           id:email
${CAMPO_SENHA}           id:password
${BOTAO_ENTRAR}          tag:button

# Mensagens exibidas pela aplicação.
${MSG_SUCESSO}           Serverest Store
${MSG_CREDENCIAIS}       Email e/ou senha inválidos
${MSG_SENHA_OBRIG}       Password é obrigatório
${MSG_EMAIL_OBRIG}       Email é obrigatório
