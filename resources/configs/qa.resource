*** Settings ***
Documentation    Configurações e variáveis globais do ambiente de QA.

*** Variables ***
${URL}         https://front.serverest.dev/
${BROWSER}     chrome

# Credenciais padrão usadas nos testes.
${EMAIL}       Ezequiel@digicon.com
${PASSWORD}    123456

# Pasta dos prints, na raiz do projeto (resources/configs -> ../../screenshots).
${PASTA_SCREENSHOTS}    ${CURDIR}${/}..${/}..${/}screenshots
